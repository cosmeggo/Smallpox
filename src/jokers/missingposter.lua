-- Joker Atlas
SMODS.Atlas({
    key = "missingposter", 
    path = "jokers/missingposter.png", 
    px = 71,
    py = 95,
    atlas_table = "ASSET_ATLAS"
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
SMODS.Joker {
    key = "missingposter",
    atlas = 'missingposter',
    pos = { x = 0, y = 0 },
    rarity = 2,
    cost = 5,
    pools = {["Smallpox"] = true}, -- see comment at the top
    blueprint_compat = false, -- set to false if you dont want blueprint to copy
    discovered = false,
    unlocked = true,
    config = { extra = { dollars = 6 }, },
    pronouns = "it_its", -- see comment at top
    loc_vars = function(self, info_queue, card)
        return { vars = { card.ability.extra.dollars} }
    end,
    
    calculate = function(self, card, context)
        if context.joker_type_destroyed and context.card.ability.set == "Joker" then
            return {
                dollars = card.ability.extra.dollars,
                func = function() -- This is for timing purposes, this goes after the dollar modification
                    G.E_MANAGER:add_event(Event({
                        func = function()
                            G.GAME.dollar_buffer = 0
                            return true
                        end
                    }))
                end
            }
        end
    end,
    smallpox_credits = {
		{
			text = "By: LFMoth",
            color = G.C.BLUE
		},
	},
}
