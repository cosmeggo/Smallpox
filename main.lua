SPOX = SMODS.current_mod
SPOX.optional_features = {
	post_trigger = true,
	retrigger_joker = true,
	}

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


-- ASSERTS
assert(SMODS.load_file("./src/pre.lua"))() -- PRELOADING FUNCTIONS
assert(SMODS.load_file("./src/ui.lua"))() -- UI
assert(SMODS.load_file("./src/backs.lua"))() -- DECKS
assert(SMODS.load_file("./src/pools.lua"))() -- JOKER POOLS
assert(SMODS.load_file("./src/sounds.lua"))() -- SOUNDS
--assert(SMODS.load_file("./src/atlasses.lua"))() -- ATLASSES


---COMMON
assert(SMODS.load_file("./src/jokers/ampup.lua"))() -- Amp Up by M0x3s
assert(SMODS.load_file("./src/jokers/bliss.lua"))() -- Bliss by LasagnaFelidae
assert(SMODS.load_file("./src/jokers/example.lua"))() -- The example joker
assert(SMODS.load_file("./src/jokers/GhostSalt.lua"))() -- No Littering by GhostSalt

---UNCOMMON
assert(SMODS.load_file("./src/jokers/astro.lua"))() -- Astro by Astro, p: LasagnaFelidae
assert(SMODS.load_file("./src/jokers/Atlas.lua"))() -- Atlas by ABuffZucchini
assert(SMODS.load_file("./src/jokers/typ0.lua"))() -- Blackjack by Typ0
assert(SMODS.load_file("./src/jokers/inky.lua"))() -- Restaurant Menu by Inky, p: Typ0
assert(SMODS.load_file("./src/jokers/settheory.lua"))() -- Set Theory by Arta
assert(SMODS.load_file("./src/jokers/pi_cubed.lua"))() -- Spike Ball by Pi_cubed
assert(SMODS.load_file("./src/jokers/meta.lua"))() -- Susie by Meta
assert(SMODS.load_file("./src/jokers/grinch.lua"))() -- Grinch by Soulware
assert(SMODS.load_file("./src/jokers/vaccine.lua"))() -- Vaccine by mys.minty

---RARE

assert(SMODS.load_file("./src/jokers/tatsu.lua"))() -- Butterfly Effect by Tatsu, p: Typ0
assert(SMODS.load_file("./src/jokers/demon_core.lua"))() -- Demon Core by ThunderEdge
assert(SMODS.load_file("./src/jokers/breuhh.lua"))() -- Functions by Breuhh
assert(SMODS.load_file("./src/jokers/sillyzteto.lua"))() -- Kasane Teto by Sillyz
assert(SMODS.load_file("./src/jokers/hunter.lua"))() -- Notebook Sketch by Hunter
assert(SMODS.load_file("./src/jokers/polymorphine.lua"))() -- Polymorphine by NinjaBanana --- THESE JOKERS HAVE PLACEHOLDER ART!!!!!!!!!!
assert(SMODS.load_file("./src/jokers/roomtemperaturecarrot.lua"))() -- Room Temp. Carrot by Rainstar
assert(SMODS.load_file("./src/jokers/scales_of_justice.lua"))() -- Scales of Justice by Revo
assert(SMODS.load_file("./src/jokers/smallpox.lua"))() -- Smallpox by Plasma
assert(SMODS.load_file("./src/jokers/missingnumber.lua"))() -- Stained Glass Window by missingnumber
assert(SMODS.load_file("./src/jokers/miller.lua"))() -- VOIDWALKER by Abel

assert(SMODS.load_file("./src/jokers/tigerthawk.lua"))() -- VOIDWALKER by Abel

---LEGENDARY
assert(SMODS.load_file("./src/jokers/Egbert.lua"))() -- John Egbert, by First Try
assert(SMODS.load_file("./src/jokers/tech.lua"))() -- Pox Of The Wild by Tech, p: LasagnaFelidae, a: Plasma

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