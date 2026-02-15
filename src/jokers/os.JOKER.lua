-- Example Joker Atlas

local key_ps = ""

if SPOX_CONFIG.SPOX_Photosensitivity then
    key_ps = "_ps"
end

    SMODS.Atlas({
        key = "ERRNO_ps", 
        path = "jokers/errjokerunanimated.png", 
        px = 71,
        py = 95,
        atlas_table = "ASSET_ATLAS"
    })

    SMODS.Atlas({
        key = "ERRNO",
        path = "jokers/errjoker.png",
        px = 71,
        py = 95,
        atlas_table = "ANIMATION_ATLAS",
        frames = 63
    })


--[[
Example Joker
CardPronouns prons: "she_her", "he_him", "they_them", "any_all", "it_its", "she_they", "he_they"
Pools must always have ["Smallpox"] = true, for other pools, check src/pools.lua if it exists already, if not, WARN the Helpers!
please set cost according to rarity
+-----+------------+----------+
|  #  |  Rarity    |  Cost    |
|-----+------------+----------+
|  1  |  Common    |  $3-5    |
|  2  |  Uncommon  |  $5-8    |
|  3  |  Rare      |  $8-10   |
|  4  |  Legendary |  $15-20  |
+-----+------------+----------+
]]

G.YOUAREANIDIOT = G.YOUAREANIDIOT or {
    start = love.timer.getTime(),
    pressed_f = false
}

local old_key = love.keypressed

function love.keypressed(key)
    if key == "f" then
        if G and G.jokers and G.jokers.cards and not G.SETTINGS.paused then
            G.YOUAREANIDIOT.pressed_f = true
            SMODS.calculate_context({ key_press_f = true })
        end
    end

    return old_key(key)
end

local function get_system_state() -- im sorry

    local t = os.date("*t")
    local s = {}

    s.friday = (t.wday == 6)
    s.june = (t.month == 6)
    s.four_pm = (t.hour == 16)
    s.session = love.timer.getTime() - G.YOUAREANIDIOT.start
    s.fps = love.timer.getFPS()
    s.volume = G.SETTINGS.SOUND.music_volume
    local _, batt = love.system.getPowerInfo()
    s.battery = batt or 100
    s.os = love.system.getOS()
    s.cpu = love.system.getProcessorCount()
    s.clipboard = love.system.getClipboardText() or ""
    return s
end


local funny_str = "!\"#$%&'()+-*,./\\:;<=>?[]^_~"
local font_cache = {}
SMODS.DynaTextEffect { -- credits to Haya
    key = "err",
    func = function(dynatext, index, letter)
        if not letter.normal_letter then
            letter.normal_letter = letter.letter
        end
        local st = pseudorandom('skip_' .. index, 1, #funny_str)
        local rnd = string.sub(funny_str, st, st + 1)
        font_cache[dynatext.font.key or dynatext.font.file] = font_cache[dynatext.font.key or dynatext.font.file] or {}
        font_cache[dynatext.font.key or dynatext.font.file][rnd] = font_cache[dynatext.font.key or dynatext.font.file]
        [rnd] or love.graphics.newText(dynatext.font.FONT, rnd)
        --print(rnd)
        letter.letter = font_cache[dynatext.font.key or dynatext.font.file][rnd]
    end
}

SMODS.Joker {
    key = "osjoker",
    atlas = 'ERRNO'..key_ps,
    pos = { x = 0, y = 0 },
    rarity = 2,
    cost = 5,
    pools = { ["Smallpox"] = true }, -- see comment at the top
    blueprint_compat = true,       -- set to false if you dont want blueprint to copy
    discovered = true,
    unlocked = true,
    pronouns = "it_its", -- see comment at top
    config = {
        extra = {
            base_mult = 4,
            friday_mult = 4,
            pm_xmult = 2,
            june_xchips = 2.5,
            lowfps_money = 2,
            volume_value = 2,
            batt_min = 30,
            batt_max = 50,
            session_min = 23,
            odds = 6,
            rare_xchips = 2,
            cpu_req = 2,
            f_chips = 5,
            money_mult = 2
        }
    },

    loc_vars = function(self, info_queue, card)
        local numerator, denominator = SMODS.get_probability_vars(card, 1, card.ability.extra.odds, 'fuckyouruby')
        local e = card.ability.extra
        return {
            vars = {
                e.base_mult,
                e.friday_mult,
                e.pm_xmult,
                e.june_xchips,
                e.lowfps_money,
                e.volume_value,
                e.batt_min,
                e.batt_max,
                e.session_min,
                numerator,
                denominator,
                e.rare_xchips,
                e.cpu_req,
                e.f_chips,
                e.money_mult
            }
        }
    end,
    calculate = function(self, card, context)
        
        local e = card.ability.extra
        local s = get_system_state()

        if context.joker_main then
            local mult = e.base_mult
            local chips = 0
            local money = 0

            if s.friday then
                mult = mult + e.friday_mult
            end

            if s.four_pm then
                mult = mult * (e.pm_xmult ^ context.full_hand_size)
            end

            if s.june then
                chips = chips + (e.june_xchips * #G.consumeables.cards)
            end

            if s.cpu > e.cpu_req then
                for _, j in ipairs(G.jokers.cards) do
                    if j.config.center.rarity == 3 then
                        chips = chips * e.rare_xchips
                    end
                end
            end

            if s.fps < 30 then
                money = money + (e.lowfps_money * context.full_hand_size)
            end

            local letters = s.clipboard:gsub("[^%a]", "")
            mult = mult + #letters

            if G.YOUAREANIDIOT.pressed_f then
                chips = chips +
                    math.floor(G.GAME.dollars / 5) * e.f_chips

                G.YOUAREANIDIOT.pressed_f = false
            end

            return {
                mult = mult,
                chips = chips,
                dollars = money
            }
        end

        if context.end_of_round then
            if s.volume < 0.1 then
                for _, j in ipairs(G.jokers.cards) do
                    j.ability.extra_value =
                        (j.ability.extra_value or 0) + e.volume_value
                end
            end

            if s.battery >= e.batt_min and s.battery <= e.batt_max then
                G.GAME.tags[#G.GAME.tags + 1] = Tag("double")
            end

            if s.session >= e.session_min * 60 then
                local c = pseudorandom_element(G.consumeables.cards)

                if c then
                    local copy = copy_card(c)
                    copy:set_edition({ negative = true })
                    G.consumeables:emplace(copy)
                end
            end
        end

        if context.setting_blind and s.os == "Linux" then
            if SMODS.pseudorandom_probability(
                    card,
                    'sys',
                    1,
                    e.odds
                ) then
                SMODS.add_card {
                    set = "Joker",
                    rarity = 1,
                    edition = "negative"
                }
            end
        end

        if context.ending_shop and card.ability.active
            and not context.blueprint then
            if s.friday
                and s.june
                and s.four_pm
                and s.fps < 30
                and s.volume < 0.1
                and s.battery >= e.batt_min
                and s.battery <= e.batt_max then
                local cur = G.GAME.dollars

                G.GAME.dollar_buffer =
                    (G.GAME.dollar_buffer or 0)
                    + cur * (e.money_mult - 1)

                return {

                    dollars = cur * (e.money_mult - 1),

                    message = "SYSTEM SYNC",

                    colour = G.C.MONEY,

                    message_card = card,

                    func = function()
                        G.E_MANAGER:add_event(Event({
                            func = function()
                                G.GAME.dollar_buffer = 0
                                return true
                            end
                        }))
                    end
                }
            end
        end
    end
}