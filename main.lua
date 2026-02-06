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

--enable retrigger jokers
SMODS.current_mod.optional_features = {
    retrigger_joker = true,
	post_trigger = true,
}

SMODS.optional_features.retrigger_joker = true

-- ASSERTS

assert(SMODS.load_file("./src/backs.lua"))()
assert(SMODS.load_file("./src/pools.lua"))()
assert(SMODS.load_file("./src/ui.lua"))() -- The use button
assert(SMODS.load_file("./src/pools.lua"))()
assert(SMODS.load_file("./src/sounds.lua"))()

assert(SMODS.load_file("./src/jokers/example.lua"))() -- The example joker
assert(SMODS.load_file("./src/jokers/scales_of_justice.lua"))() -- Scales of Justice by Revo
assert(SMODS.load_file("./src/jokers/breuhh.lua"))() -- Functions by Breuhh
assert(SMODS.load_file("./src/jokers/miller.lua"))() -- VOIDWALKER by Abel
assert(SMODS.load_file("./src/jokers/grinch.lua"))() -- Grinch by Soulware
assert(SMODS.load_file("./src/jokers/vaccine.lua"))() -- Vaccine by mys.minty
assert(SMODS.load_file("./src/jokers/astro.lua"))() -- Astro by Astro, p: LasagnaFelidae
assert(SMODS.load_file("./src/jokers/demon_core.lua"))() -- Demon Core by ThunderEdge
assert(SMODS.load_file("./src/jokers/bliss.lua"))() -- Bliss by LasagnaFelidae
assert(SMODS.load_file("./src/jokers/typ0.lua"))() -- Blackjack by Typ0
assert(SMODS.load_file("./src/jokers/tatsu.lua"))() -- Butterfly Effect by Tatsu, p: Typ0
assert(SMODS.load_file("./src/jokers/inky.lua"))() -- Restaurant Menu by Inky, p: Typ0
assert(SMODS.load_file("./src/jokers/smallpox.lua"))() -- Smallpox by Plasma
assert(SMODS.load_file("./src/jokers/tech.lua"))() 

-- Unsure what this does
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
