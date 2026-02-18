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
    config = { extra = { xmult = 1, xmult_gain = 0.5 } },

    loc_vars = function(self, info_queue, card)
        return { vars = { card.ability.extra.xmult_gain, card.ability.extra.xmult } }
    end,

    calculate = function(self, card, context)
        if context.destroy_card then
            if context.cardarea == G.play and context.destroy_card:is_suit("Hearts") and context.destroy_card:get_id() == 14 then
                card.ability.extra.xmult = card.ability.extra.xmult + card.ability.extra.xmult_gain
                return { 
                    remove = true,
                    message = localize('k_upgrade_ex')
                }
            end
        end
        if context.joker_main then
            return {
                xmult = card.ability.extra.xmult
            }
        end
    end,
}
