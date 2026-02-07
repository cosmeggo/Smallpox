SMODS.Atlas({
    key = "picubed_atlas", 
    path = "jokers/pi_cubed.png", 
    px = 71,
    py = 95,
    atlas_table = "ASSET_ATLAS"
})

SMODS.Joker {
    key = "spikedball",
    pos = { x = 0, y = 0 },
    soul_pos = { x = 1, y = 0 },
    rarity = 2,
    blueprint_compat = true,
    perishable_compat = true,
    eternal_compat = true,
    cost = 6,
    discovered = true,
    config = { extra = { dollars = 1, difficulty = 0, spin_pos = 0 }, },
    atlas = 'picubed_atlas',
    pools = { ['Smallpox'] = true },
    loc_vars = function(self, info_queue, card)
        return { vars = { card.ability.extra.dollars, colours = { HEX("E14159") } } }
    end,
    --[[update = function(self, card, dt) -- replace this with a love.update hook, and check all cards in G.your_collection[1,2,3] and/or G.joker to see if they're j_smallpox_spikedball
		if not G.SETTINGS.reduced_motion then
			if not card.ability.extra.spin_pos then card.ability.extra.spin_pos = 0 end
			card.ability.extra.spin_pos = card.ability.extra.spin_pos + dt * 3
			if card.ability.extra.spin_pos >= 7 then card.ability.extra.spin_pos = 0 end
			local da_spin_pos = math.floor(card.ability.extra.spin_pos)
			card.children.floating_sprite:set_sprite_pos({x = da_spin_pos + 1, y = 0})
		end
	end,]]
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
    end
}

local love_update_spin_pos_ref = love.update
function love.update(dt)
    love_update_spin_pos_ref(dt)
    if not G.SETTINGS.reduced_motion then
        if G.jokers and G.jokers.cards then
            for _, card in ipairs(G.jokers.cards) do
                if card and card.config.center_key == 'j_smallpox_spikedball' then
                    if not card.ability.extra.spin_pos then card.ability.extra.spin_pos = 0 end
                    card.ability.extra.spin_pos = card.ability.extra.spin_pos + dt * 8
                    if card.ability.extra.spin_pos >= 7 then card.ability.extra.spin_pos = 0 end
                    local da_spin_pos = math.floor(card.ability.extra.spin_pos)
                    card.children.floating_sprite:set_sprite_pos({x = da_spin_pos + 1, y = 0})
                end
            end
        end
        if G.your_collection then
            for i = 1, #G.your_collection do
                if G.your_collection[i] and G.your_collection[i].cards then
                    for _, card in ipairs(G.your_collection[i].cards) do
                        if card and card.config.center_key == 'j_smallpox_spikedball' then
                            if not card.ability.extra.spin_pos then card.ability.extra.spin_pos = 0 end
                            card.ability.extra.spin_pos = card.ability.extra.spin_pos + dt * 8
                            if card.ability.extra.spin_pos >= 7 then card.ability.extra.spin_pos = 0 end
                            local da_spin_pos = math.floor(card.ability.extra.spin_pos)
                            card.children.floating_sprite:set_sprite_pos({x = da_spin_pos + 1, y = 0})
                        end
                    end
                end
            end
        end
    end
end

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
            --SpikedBall.cooldown = SpikedBall.cooldown * 0.99
            if SpikedBall.show_game then
                local make_large = math.random() + math.min(0.75, SpikedBall.difficulty*0.015) > 1.015
                table.insert(SpikedBall.spike_balls, Spike(make_large and 1 or nil))
                --table.insert(SpikedBall.spike_balls, Spike())
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
                --love.graphics.circle("fill", t_p(spike.x), t_p(spike.y), t_p(spike.size*1.1))
                --love.graphics.setColor(darken({0.2157, 0.2588, 0.2667, 0.7}, 0.8))
                --love.graphics.circle("fill", t_p(spike.x), t_p(spike.y), t_p(spike.size))
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
                    --love.graphics.setColor(darken({(floored_spin_state+1)/7, 0, 0, 0.7}, 0.8))
                    --love.graphics.circle("fill", t_p(spike.x), t_p(spike.y), t_p(spike.size))
                    love.graphics.draw(smallball_anim.spriteSheet, smallball_anim.quads[floored_spin_state + 1], t_p(spike.x), t_p(spike.y), nil, t_p(spike.size*3)/smallball_anim.width, nil, smallball_anim.width/2 , smallball_anim.height/2)
                else
                    --love.graphics.setColor(darken({0, 0, (floored_spin_state+1)/4, 0.7}, 0.8))
                    --love.graphics.circle("fill", t_p(spike.x), t_p(spike.y), t_p(spike.size))
                    love.graphics.draw(bigball_anim.spriteSheet, bigball_anim.quads[floored_spin_state + 1], t_p(spike.x), t_p(spike.y), nil, t_p(spike.size*3.2)/bigball_anim.width, nil, bigball_anim.width/2 , bigball_anim.height/2)
                end
            end
        end
    end
end
