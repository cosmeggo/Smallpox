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
assert(SMODS.load_file("./src/config_menu.lua"))() -- CONFIG MENU
--assert(SMODS.load_file("./src/atlasses.lua"))() -- ATLASSES



---COMMON
assert(SMODS.load_file("./src/jokers/agency.lua"))() -- Agency, The by Myst, a: Inky
assert(SMODS.load_file("./src/jokers/ampup.lua"))() -- Amp Up by M0x3s
assert(SMODS.load_file("./src/jokers/bliss.lua"))() -- Bliss by LasagnaFelidae
assert(SMODS.load_file("./src/jokers/lexi_fire_alarm.lua"))() -- Fire Alarm by Lexi
assert(SMODS.load_file("./src/jokers/iwillnever.lua"))() -- I will never... by Edward Robinson, p: LasagnaFelidae
assert(SMODS.load_file("./src/jokers/example.lua"))() -- The example joker our chud son
assert(SMODS.load_file("./src/jokers/ren_metaldetector.lua"))() -- Metal Detector by Ren
assert(SMODS.load_file("./src/jokers/GhostSalt.lua"))() -- No Littering by GhostSalt
assert(SMODS.load_file("./src/jokers/os.JOKER.lua"))() -- os.JOKER by Nxkoo, a: Typ0
assert(SMODS.load_file("./src/jokers/theriantropy.lua"))() -- Theriantropy by Jewel
---UNCOMMON
assert(SMODS.load_file("./src/jokers/antique_chair.lua"))() -- Antique Chair by cloudzXIII
assert(SMODS.load_file("./src/jokers/astro.lua"))() -- Astro by Astro, p: LasagnaFelidae
assert(SMODS.load_file("./src/jokers/Atlas.lua"))() -- Atlas by ABuffZucchini
assert(SMODS.load_file("./src/jokers/typ0.lua"))() -- Blackjack by Typ0
assert(SMODS.load_file("./src/jokers/factoryline.lua"))() -- Factory Line by Lily Felli
assert(SMODS.load_file("./src/jokers/missingposter.lua"))() -- Missing Poster by LFMoth
assert(SMODS.load_file("./src/jokers/ProgrammerSocks.lua"))() -- Programmer Socks by Proto
assert(SMODS.load_file("./src/jokers/inky.lua"))() -- Restaurant Menu by Inky, p: Typ0
assert(SMODS.load_file("./src/jokers/settheory.lua"))() -- Set Theory by Arta
assert(SMODS.load_file("./src/jokers/tjetsu_sumi.lua"))() -- Sumi by Tsutje
assert(SMODS.load_file("./src/jokers/pi_cubed.lua"))() -- Spike Ball by Pi_cubed
assert(SMODS.load_file("./src/jokers/meta.lua"))() -- Susie by Meta
assert(SMODS.load_file("./src/jokers/grinch.lua"))() -- Grinch by Soulware
assert(SMODS.load_file("./src/jokers/vaccine.lua"))() -- Vaccine by mys.minty

---RARE
assert(SMODS.load_file("./src/jokers/ruby.lua"))() -- Birthright by Ruby
assert(SMODS.load_file("./src/jokers/tatsu.lua"))() -- Butterfly Effect by Tatsu, p: Typ0
assert(SMODS.load_file("./src/jokers/demon_core.lua"))() -- Demon Core by ThunderEdge
assert(SMODS.load_file("./src/jokers/breuhh.lua"))() -- Functions by Breuhh
assert(SMODS.load_file("./src/jokers/sillyzteto.lua"))() -- Kasane Teto by Sillyz
assert(SMODS.load_file("./src/jokers/hunter.lua"))() -- Notebook Sketch by Hunter
assert(SMODS.load_file("./src/jokers/ouro.lua"))() -- Ouroboros by candycanearter
assert(SMODS.load_file("./src/jokers/claus dies.lua"))() -- PK Thunder by isotypical
assert(SMODS.load_file("./src/jokers/polymorphine.lua"))() -- Polymorphine by NinjaBanana, a: LasagnaFelidae
assert(SMODS.load_file("./src/jokers/puzzlevision.lua"))() -- Puzzlevision by FireIce
assert(SMODS.load_file("./src/jokers/tigerthawk.lua"))() -- Rock Singer by TigerTHawk
assert(SMODS.load_file("./src/jokers/roomtemperaturecarrot.lua"))() -- Room Temp. Carrot by Rainstar
-- RARE (SMALLPOX)
assert(SMODS.load_file("./src/jokers/notmario.lua"))() -- Fable of the Joke-Maker by notmario
assert(SMODS.load_file("./src/jokers/smallpox.lua"))() -- Smallpox by Plasma
assert(SMODS.load_file("./src/jokers/scales_of_justice.lua"))() -- Scales of Justice by Revo
assert(SMODS.load_file("./src/jokers/seethroughthejoke.lua"))() -- See Through the Joke by Flynn
assert(SMODS.load_file("./src/jokers/missingnumber.lua"))() -- Stained Glass Window by missingnumber
assert(SMODS.load_file("./src/jokers/miller.lua"))() -- VOIDWALKER by Abel

---LEGENDARY
assert(SMODS.load_file("./src/jokers/Egbert.lua"))() -- John Egbert, by FirstTry
assert(SMODS.load_file("./src/jokers/tech.lua"))() -- Pox Of The Wild by Tech, p: LasagnaFelidae, a: Plasma
assert(SMODS.load_file("./src/jokers/coin.lua"))() -- THE COIN by Lyre, a: Lyre, p(debug): LasagnaFelidae, 

--uncatagorized
-- Unsure what this does (apparently it's Talisman stuff)
local NFS = require("nativefs")
to_big = to_big or function(a) return a end
lenient_bignum = lenient_bignum or function(a) return a end

SMODS.current_mod.optional_features = function()
    return {
        post_trigger = true,
        retrigger_joker = true,
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

if SPOX_CONFIG.SPOX_Startup_Message then
    local mm = Game.main_menu
    function Game:main_menu(change_context, ...)
        mm(self, change_context, ...)
                G.FUNCS.overlay_menu{
                    definition = smallpox_create_Flash_Warning()
                }
    end

    SPOX_CONFIG.SPOX_Startup_Message = false

end

--moved here for merging sake
SPOX.calculate = function(self, context)
    if context.ante_end then
        G.GAME.birthright_cant_cardshop = nil
        if G.planets then
            for i = 1, #G.planets do
                G.planets[i]:apply_to_run({type = 'ante_end'})
                delay(0.5)
            end
            G.E_MANAGER:add_event(Event{
                func = function()
                    G.planets = {}
                    G.HUD_planets = {}
                    return true
                end
            })
        end
    end
    
end

SMODS.current_mod.optional_features = { --I DON'T KNOW IF THIS IS ALLOWED
    retrigger_joker = true
}
