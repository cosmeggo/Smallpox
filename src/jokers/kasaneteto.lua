SMODS.Atlas({
    key = "sillyzteto", 
    path = "jokers/sillyzteto.png", 
    px = 71,
    py = 95,
    atlas_table = "ASSET_ATLAS"
})

-- Kasane Teto
SMODS.Joker {
    key = "sillyzteto",
    blueprint_compat = true,
    rarity = 3,
    cost = 8,
    pos = { x = 0, y = 0 },
    discovered = false,
    atlas = 'sillyzteto',
    pools = {["Smallpox"] = true, ["Metallic"] = true},
    config = { extra = { xmult = 0, xmult_gain = 0.5 } },

    loc_vars = function(self, info_queue, card)
        return { vars = { card.ability.extra.xmult_gain, 1 + card.ability.extra.xmult } }
    end,

    calculate = function(self, card, context)
        if context.remove_playing_cards and not context.blueprint then
            local hearts = 0
            for _, removed_card in ipairs(context.removed) do
                if removed_card:is_suit("Hearts") then 
                    hearts = hearts + 1 
                end
            end
            if hearts then
                SMODS.scale_card(card, {
				    ref_table = card.ability.extra,
    			    ref_value = "xmult",
				    scalar_value = "xmult_gain",
                    operation = function(ref_table, ref_value, initial, change)
	                    ref_table[ref_value] = initial + hearts*change
                    end,
				})
            end
        end
        if context.joker_main then
            return {
                xmult = card.ability.extra.xmult
            }
        end
    end,
    smallpox_credits = {
		{
			text = {
                "By: Sillyz",
                "Art: Plasma &",
                "LasagnaFelidae"
            },
            color = G.C.PURPLE,
		},
	},
}
