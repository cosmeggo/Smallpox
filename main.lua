SPOX = SMODS.current_mod
SPOX.optional_features = {
	post_trigger = true,
	retrigger_joker = true,
	}

local gsr = Game.start_run
function Game:start_run(args, ...)
  local ret = gsr(self, args, ...)
  G.jokers.config.highlighted_limit = 1e100
  return ret
end
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
assert(SMODS.load_file("./src/boosters.lua"))() -- BOOSTERS
--assert(SMODS.load_file("./src/atlasses.lua"))() -- ATLASSES



---COMMON
assert(SMODS.load_file("./src/jokers/jokerplus.lua"))() -- The example joker our chud son
assert(SMODS.load_file("./src/jokers/agency.lua"))() -- Agency, The by Myst, a: Inky
assert(SMODS.load_file("./src/jokers/ampup.lua"))() -- Amp Up by M0x3s
assert(SMODS.load_file("./src/jokers/astro.lua"))() -- Astro by Astro, p: LasagnaFelidae
assert(SMODS.load_file("./src/jokers/bliss.lua"))() -- Bliss by LasagnaFelidae
assert(SMODS.load_file("./src/jokers/firealarm.lua"))() -- Fire Alarm by Lexi
assert(SMODS.load_file("./src/jokers/neverjokerforge.lua"))() -- I will never... by Edward Robinson, p: LasagnaFelidae
assert(SMODS.load_file("./src/jokers/metaldetector.lua"))() -- Metal Detector by Ren
assert(SMODS.load_file("./src/jokers/nolittering.lua"))() -- No Littering by GhostSalt
assert(SMODS.load_file("./src/jokers/os.JOKER.lua"))() -- os.JOKER by Nxkoo, a: Typ0
assert(SMODS.load_file("./src/jokers/theriantropy.lua"))() -- Theriantropy by Jewel
---UNCOMMON
assert(SMODS.load_file("./src/jokers/antique_chair.lua"))() -- Antique Chair by cloudzXIII
assert(SMODS.load_file("./src/jokers/Atlas.lua"))() -- Atlas by ABuffZucchini
assert(SMODS.load_file("./src/jokers/blackjack.lua"))() -- Blackjack by Typ0
assert(SMODS.load_file("./src/jokers/factoryline.lua"))() -- Factory Line by Lily Felli
assert(SMODS.load_file("./src/jokers/missingposter.lua"))() -- Missing Poster by LFMoth
assert(SMODS.load_file("./src/jokers/ProgrammerSocks.lua"))() -- Programmer Socks by Proto
assert(SMODS.load_file("./src/jokers/restaurantmenu.lua"))() -- Restaurant Menu by Inky, p: Typ0
assert(SMODS.load_file("./src/jokers/settheory.lua"))() -- Set Theory by Arta
assert(SMODS.load_file("./src/jokers/sumi.lua"))() -- Sumi by Tsutje
assert(SMODS.load_file("./src/jokers/spikeball.lua"))() -- Spike Ball by Pi_cubed
assert(SMODS.load_file("./src/jokers/susie.lua"))() -- Susie by Meta
assert(SMODS.load_file("./src/jokers/grinch.lua"))() -- Grinch by Soulware
assert(SMODS.load_file("./src/jokers/vaccine.lua"))() -- Vaccine by mys.minty

---RARE
assert(SMODS.load_file("./src/jokers/birthright.lua"))() -- Birthright by Ruby
assert(SMODS.load_file("./src/jokers/butterfly.lua"))() -- Butterfly Effect by Tatsu, p: Typ0
assert(SMODS.load_file("./src/jokers/demoncore.lua"))() -- Demon Core by ThunderEdge
assert(SMODS.load_file("./src/jokers/functions.lua"))() -- Functions by Breuhh
assert(SMODS.load_file("./src/jokers/kasaneteto.lua"))() -- Kasane Teto by Sillyz
assert(SMODS.load_file("./src/jokers/notebook.lua"))() -- Notebook Sketch by Hunter
assert(SMODS.load_file("./src/jokers/ouroboros.lua"))() -- Ouroboros by candycanearter
assert(SMODS.load_file("./src/jokers/pkthunder.lua"))() -- PK Thunder by isotypical
assert(SMODS.load_file("./src/jokers/polymorphine.lua"))() -- Polymorphine by NinjaBanana, a: LasagnaFelidae
assert(SMODS.load_file("./src/jokers/puzzlevision.lua"))() -- Puzzlevision by FireIce
assert(SMODS.load_file("./src/jokers/rocksinger.lua"))() -- Rock Singer by TigerTHawk
assert(SMODS.load_file("./src/jokers/roomtemperaturecarrot.lua"))() -- Room Temp. Carrot by Rainstar
-- RARE (SMALLPOX)
assert(SMODS.load_file("./src/jokers/fablemirror.lua"))() -- Fable of the Joke-Maker by notmario
assert(SMODS.load_file("./src/jokers/smallpox.lua"))() -- Smallpox by Plasma
assert(SMODS.load_file("./src/jokers/scales_of_justice.lua"))() -- Scales of Justice by Revo
assert(SMODS.load_file("./src/jokers/seethroughthejoke.lua"))() -- See Through the Joke by Flynn
assert(SMODS.load_file("./src/jokers/stainedglass.lua"))() -- Stained Glass Window by missingnumber
assert(SMODS.load_file("./src/jokers/voidwalker.lua"))() -- VOIDWALKER by Abel

---LEGENDARY
assert(SMODS.load_file("./src/jokers/johnegbert.lua"))() -- John Egbert, by FirstTry
assert(SMODS.load_file("./src/jokers/poxofthewild.lua"))() -- Pox Of The Wild by Tech, p: LasagnaFelidae, a: Plasma
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
    local desc = localize("Spox_Description")
    print(type(desc))
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

local XmainMenuHook = Game.main_menu
function Game:main_menu(ctx)
    local r = XmainMenuHook(self,ctx)
    if self.title_top then
        local tg = self.title_top
        local card = Card(tg.T.x,tg.T.y,G.CARD_W,G.CARD_H,nil,G.P_CENTERS['j_smallpox_smallpox'])
        card.bypass_discovery_center = true
        card.T.w = card.T.w * 1.4
        card.T.h = card.T.h * 1.4
        card:set_sprites(card.config.center)
        card.no_ui = true
        card.states.visible = false
        self.title_top:emplace(card)
        self.title_top:align_cards()
        G.E_MANAGER:add_event(
            Event{
                delay = 0.5,
                func = function ()
                    if ctx == "splash" then
                        card.states.visible = true
                        card:start_materialize({ G.C.WHITE, G.C.WHITE }, true, 0.5)
                    else
                        card.states.visible = true
                        card:start_materialize({ G.C.WHITE, G.C.WHITE }, nil, 0.2)
                    end
                    return true
                end
            }
        )
           for i,v in ipairs(G.title_top.cards) do
            if v.config.center.key == "c_base" then
                if v:get_id() == 14 and v:is_suit("Spades") then  --thanks mys minty for this
                    v:remove()
                    break
                end
            end
        end
    end
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



local smcmb = SMODS.create_mod_badges
function SMODS.create_mod_badges(obj, badges)
	smcmb(obj, badges)
    if not SMODS.config.no_mod_badges and obj and obj.smallpox_credits then
        --Taken from HotPot
        local function calc_scale_fac(text)
			local size = 0.9
			local font = G.LANG.font
			local max_text_width = 2 - 2 * 0.05 - 4 * 0.03 * size - 2 * 0.03
			local calced_text_width = 0
			-- Math reproduced from DynaText:update_text
			for _, c in utf8.chars(text) do
				local tx = font.FONT:getWidth(c) * (0.33 * size) * G.TILESCALE * font.FONTSCALE
					+ 2.7 * 1 * G.TILESCALE * font.FONTSCALE
				calced_text_width = calced_text_width + tx / (G.TILESIZE * G.TILESCALE)
			end
			local scale_fac = calced_text_width > max_text_width and max_text_width / calced_text_width or 1
			return scale_fac
		end
        --

        inital_badge_amount = #badges
        for i, credit in ipairs(obj.smallpox_credits) do
            if not credit.text then
                credit.text = "ERROR"
            end
            if not credit.color then
                credit.color = G.C.BLACK
            end
            if not credit.text_color then
                credit.text_color = G.C.WHITE
            end
            if not credit.size then
                local size = 1000
                if type(credit.text) == "table" then
                     for _, text in ipairs(credit.text) do
                        size = math.min(size, calc_scale_fac(text))
                     end
                else
                    size = calc_scale_fac(credit.text)
                end
                credit.size = math.max(size, 0.8)
            end
            badges[inital_badge_amount + i] = create_badge(credit.text, credit.color, credit.text_color, credit.size)
        end
    end
end
