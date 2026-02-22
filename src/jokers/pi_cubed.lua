SMODS.Atlas({
    key = "picubed_atlas", 
    path = "jokers/pi_cubed.png", 
    px = 71,
    py = 95,
    atlas_table = "ANIMATION_ATLAS",
    frames = 7,
    fps = 8,
})

SMODS.Joker {
    key = "spikedball",
    pos = { x = 0, y = 1 },
    soul_pos = { x = 0, y = 0 },
    rarity = 2,
    blueprint_compat = true,
    perishable_compat = true,
    eternal_compat = true,
    cost = 6,
    discovered = true,
    config = { extra = { dollars = 1, difficulty = 0 }, },
    atlas = 'picubed_atlas',
    pools = { ["Smallpox"] = true, ["Metallic"] = true },
    loc_vars = function(self, info_queue, card)
        return { vars = { card.ability.extra.dollars, colours = { HEX("E14159") } } }
    end,
    calculate = function(self, card, context)
        if context.setting_blind and not context.blueprint then
            card.ability.extra.difficulty = card.ability.extra.difficulty + 1
            if not SpikedBall.show_game == true then
                SpikedBall.show_game = true
                return {
                    message = localize('k_active_ex'),
                    colour = G.C.ORANGE,
                }
            end
        end
        if context.individual and context.cardarea == G.play and SpikedBall.show_game and card.ability.extra.dollars > 0 then
            return {
                dollars = card.ability.extra.dollars,
                card = card
            }
        end
        if context.spikedball_reset and not context.blueprint then
            return {
                message = localize('k_disabled_ex'),
                colour = G.C.RED,
            }
        end
        if context.game_over and not context.blueprint then
            SpikedBall.show_game = false
        end
    end,
    smallpox_credits = {
		{
			text = "By: pi_cubed",
            color = HEX("E14159")
		},
	},
}

love.graphics.setDefaultFilter('nearest', 'nearest') -- stops blurry graphics

SpikedBall = {}
SpikedBall.window_width, SpikedBall.window_height = love.window.getMode()
SpikedBall.mouse_x, SpikedBall.mouse_y, SpikedBall.mouse_r = 0, 0, 0.02
SpikedBall.cooldown = 0.5
SpikedBall.timer = 0
SpikedBall.show_game = false
SpikedBall.spike_balls = {}
SpikedBall.difficulty = 0

local function t_g(val) -- converts val from pixels to game units
    return val / (G.TILESCALE*G.TILESIZE)
end

local function t_p(val) -- converts val from game units to pixels
    return val * (G.TILESCALE*G.TILESIZE)
end

SpikedBall.window_width = t_g(SpikedBall.window_width)
SpikedBall.window_height = t_g(SpikedBall.window_height)

Spike = Object:extend()

function Spike:init(size)
    self.size = size or 0.25
    self.size = self.size + SpikedBall.difficulty*0.005
    local choose_side = math.random()
    if choose_side < 0.25 then -- left border
        self.x = 0 - 8*self.size; self.y = math.random() * SpikedBall.window_height
        self.angle = math.random() * math.pi - math.pi/2
    elseif 0.25 <= choose_side and choose_side < 0.5 then -- right border
        self.x = SpikedBall.window_width + 8*self.size; self.y = math.random() * SpikedBall.window_height
        self.angle = math.random() * math.pi + math.pi/2
    elseif 0.5 <= choose_side and choose_side < 0.75 then -- top border
        self.x = math.random() * SpikedBall.window_width; self.y = 0 - self.size
        self.angle = math.random() * math.pi
    elseif 0.75 <= choose_side then -- bottom border
        self.x = math.random() * SpikedBall.window_width; self.y = SpikedBall.window_height + self.size
        self.angle = math.random() * -1 * math.pi
    end
    self.speed = 1 + math.random() * 0.25
    self.spin_speed = (math.random() - 0.5)*20
    self.spin_state = 0
end

function SpikedBall.get_difficulty()
    local diff = 0
    if SMODS.find_card('j_smallpox_spikedball') then
        for _,v in pairs(SMODS.find_card('j_smallpox_spikedball')) do
            if v.ability.extra.difficulty > diff then
                diff = v.ability.extra.difficulty
            end
        end
    end
    SpikedBall.difficulty = diff
    return diff
end

local love_update_ref = love.update
function love.update(dt)
    love_update_ref(dt)
    if SpikedBall.show_game == true then
        SpikedBall.get_difficulty()
    end
    if SpikedBall.show_game == true and SpikedBall.difficulty > 0 then
        SpikedBall.window_width, SpikedBall.window_height = love.window.getMode()
        SpikedBall.window_width = t_g(SpikedBall.window_width)
        SpikedBall.window_height = t_g(SpikedBall.window_height)
        SpikedBall.mouse_x, SpikedBall.mouse_y = love.mouse.getPosition()
        SpikedBall.timer = SpikedBall.timer + dt
        if SpikedBall.timer >= math.max(0.04, SpikedBall.cooldown - SpikedBall.difficulty*0.11 - 0) then
            SpikedBall.timer = 0
            if SpikedBall.show_game then
                local make_large = math.random() + math.min(0.75, SpikedBall.difficulty*0.015) > 1.015
                table.insert(SpikedBall.spike_balls, Spike(make_large and 1 or nil))
            end
        end
        for _, spike in ipairs(SpikedBall.spike_balls) do
            if math.sqrt((spike.x - t_g(SpikedBall.mouse_x))^2 + (spike.y - t_g(SpikedBall.mouse_y))^2) < SpikedBall.mouse_r + spike.size then
                SpikedBall.show_game = false
                play_sound('multhit1', 1.3)
                SMODS.calculate_context({spikedball_reset = true})
            end
            spike.x = spike.x + dt * spike.speed * math.cos(spike.angle)
            spike.y = spike.y + dt * spike.speed * math.sin(spike.angle)
            spike.speed = spike.speed + dt * 0.2
            spike.spin_state = spike.spin_state + dt * spike.spin_speed
            if spike.size < 1 then -- small balls
                if spike.spin_state < 0 then -- -ve spin
                    spike.spin_state = 3.999
                elseif spike.spin_state >= 4 then -- +ve spin
                    spike.spin_state = 0
                end
            else -- big balls
                if spike.spin_state < 0 then -- -ve spin
                    spike.spin_state = 6.999
                elseif spike.spin_state >= 7 then -- +ve spin
                    spike.spin_state = 0
                end
            end
        end
        for i = #SpikedBall.spike_balls, 1, -1 do
            if not SpikedBall.show_game or math.abs(SpikedBall.spike_balls[i].x) > 1.2 * SpikedBall.window_width or math.abs(SpikedBall.spike_balls[i].y) > 1.2 * SpikedBall.window_height then
                table.remove(SpikedBall.spike_balls, i)
            end
        end
    end
end

local mod_path = SMODS.current_mod
local function load_the_img(img)
    local full_path = (mod_path.path..'assets/'..img)
    local file_data = assert(NFS.newFileData(full_path))
    local tempimagedata = assert(love.image.newImageData(file_data))
    return (assert(love.graphics.newImage(tempimagedata)))
end

smallball_sheet = load_the_img('picubed_spikedballs/picubed_small.png')
bigball_sheet = load_the_img('picubed_spikedballs/picubed_big.png')

function newAnimation(image, width, height)
    local animation = {}
    animation.spriteSheet = image;
    animation.quads = {};
    animation.width = width;
    animation.height = height;

    for y = 0, image:getHeight() - height, height do
        for x = 0, image:getWidth() - width, width do
            table.insert(animation.quads, love.graphics.newQuad(x, y, width, height, image:getDimensions()))
        end
    end

    return animation
end

smallball_anim = newAnimation(smallball_sheet, 40, 36)
bigball_anim = newAnimation(bigball_sheet, 77, 74)

local love_draw_ref = love.draw
function love.draw()
    love_draw_ref()
    if SpikedBall.difficulty > 0 then
        for _, spike in ipairs(SpikedBall.spike_balls) do
            if spike and spike.spin_state then
                love.graphics.setColor(1, 1, 1, 0.85)
                if spike.size < 1 then -- small balls
                    if spike.spin_state < 0 then -- -ve spin
                        spike.spin_state = 3.999
                    elseif spike.spin_state >= 4 then -- +ve spin
                        spike.spin_state = 0
                    end
                else -- big balls
                    if spike.spin_state < 0 then -- -ve spin
                        spike.spin_state = 6.999
                    elseif spike.spin_state >= 7 then -- +ve spin
                        spike.spin_state = 0
                    end
                end
                local floored_spin_state = math.floor(spike.spin_state)
                if spike.size < 1 then
                    love.graphics.draw(smallball_anim.spriteSheet, smallball_anim.quads[floored_spin_state + 1], t_p(spike.x), t_p(spike.y), nil, t_p(spike.size*3)/smallball_anim.width, nil, smallball_anim.width/2 , smallball_anim.height/2)
                else
                    love.graphics.draw(bigball_anim.spriteSheet, bigball_anim.quads[floored_spin_state + 1], t_p(spike.x), t_p(spike.y), nil, t_p(spike.size*3.2)/bigball_anim.width, nil, bigball_anim.width/2 , bigball_anim.height/2)
                end
            end
        end
    end
end
