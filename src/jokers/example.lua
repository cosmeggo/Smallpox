--[[
DO NOT DELETE OUR CHUD SON EXAMPLE JOKER
DO NOT DELETE OUR CHUD SON EXAMPLE JOKER
DO NOT DELETE OUR CHUD SON EXAMPLE JOKER
DO NOT DELETE OUR CHUD SON EXAMPLE JOKER
]]

-- Example Joker Atlas
SMODS.Atlas({
    key = "examplejoker", 
    path = "jokers/ExampleJoker.png", 
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
    key = "examplejoker",
    atlas = 'examplejoker',
    pos = { x = 0, y = 0 },
    rarity = 1,
    cost = 3,
    pools = {["Smallpox"] = true}, -- see comment at the top
    blueprint_compat = true, -- set to false if you dont want blueprint to copy
    discovered = true,
    unlocked = true,
    config = { extra = { mult = 5 }, },
    pronouns = "he_they", -- see comment at top
    loc_vars = function(self, info_queue, card)
        return { vars = { card.ability.extra.mult } }
    end,
    
    calculate = function(self, card, context)
        if context.joker_main then
            return {
                mult = card.ability.extra.mult
            }
        end
    end
}
