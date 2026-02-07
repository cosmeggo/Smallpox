--[[
DO NOT DELETE OUR CHUD SON EXAMPLE JOKER
DO NOT DELETE OUR CHUD SON EXAMPLE JOKER
DO NOT DELETE OUR CHUD SON EXAMPLE JOKER
DO NOT DELETE OUR CHUD SON EXAMPLE JOKER
]]

-- Example Joker Atlas
SMODS.Atlas({
    key = "eg", 
    path = "jokers/Egbert.png", 
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
    key = "egbert",
    atlas = 'eg',
    pos = { x = 0, y = 0 },
    soul_pos = { x = 1, y = 0 },
    rarity = 4,
    cost = 20,
    pools = {["Smallpox"] = true}, -- see comment at the top
    blueprint_compat = true, -- set to false if you dont want blueprint to copy
    discovered = true,
    unlocked = true,
    config = { extra = { xchips = 1, xchips_gain = .3 }, },
    pronouns = "he_him", -- see comment at top
    loc_vars = function(self, info_queue, card)
        return { vars = { card.ability.extra.xchips, card.ability.extra.xchips_gain } }
    end,
    
    calculate = function(self, card, context)
        if context.joker_main then
            return {
                xchips = card.ability.extra.xchips
            }
        end
    if context.individual and context.cardarea == G.play then
            if (context.other_card:get_id() <= 10 and
                    context.other_card:get_id() >= 0 and
                    context.other_card:get_id() % 2 == 1) or
                (context.other_card:get_id() == 14) then
                SMODS.scale_card(card, {
					ref_table = card.ability.extra,
					ref_value = "xchips",
					scalar_value = "xchips_gain",
					message_colour = G.C.CHIPS,
				})
            end
        end
    end
}
