-- STANDARD ATLASES

SMODS.Atlas({
    key = "modicon", 
    path = "ModIcon.png", 
    px = 34,
    py = 34,
    atlas_table = "ASSET_ATLAS"
})

SMODS.Atlas({
    key = "balatro", 
    path = "balatro.png", 
    px = 333,
    py = 216,
    prefix_config = { key = false },
    atlas_table = "ASSET_ATLAS"
})

SMODS.Atlas({
    key = "CustomDecks", 
    path = "CustomDecks.png", 
    px = 71,
    py = 95,
    atlas_table = "ASSET_ATLAS"
})

SMODS.Atlas({
    key = "voidwalker", 
    path = "miller.png", 
    px = 71,
    py = 95,
    atlas_table = "ASSET_ATLAS"
})

-- ASSERTS
assert(SMODS.load_file("./src/sounds.lua"))()-- They werent loaded
assert(SMODS.load_file("./src/ui.lua"))() -- They werent loaded
assert(SMODS.load_file("./src/backs.lua"))()
assert(SMODS.load_file("./src/pools.lua"))()
assert(SMODS.load_file("./src/jokers/example.lua"))() -- The example joker
assert(SMODS.load_file("./src/jokers/miller.lua"))()

-- Unsure what this does (apparently it's Talisman stuff)
local NFS = require("nativefs")
to_big = to_big or function(a) return a end
lenient_bignum = lenient_bignum or function(a) return a end

SMODS.current_mod.optional_features = function()
    return {
        cardareas = {} 
    }
end

-- Main Menu Colours (Credit to Cryptid and JoyousSpring)
local game_main_menu_ref = Game.main_menu
function Game:main_menu(change_context)
    local ret = game_main_menu_ref(self, change_context)

        local colours = { c1 = HEX("3F528C"), c2 = HEX("89ACEB") }
        G.SPLASH_BACK:define_draw_steps({
            {
                shader = "splash",
                send = {
                    { name = "time",       ref_table = G.TIMERS, ref_value = "REAL_SHADER" },
                    { name = "vort_speed", val = 0.4 },
                    { name = "colour_1",   ref_table = colours,  ref_value = "c1" },
                    { name = "colour_2",   ref_table = colours,      ref_value = "c2" },
                },
            },
        })

    return ret
end
