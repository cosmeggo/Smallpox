SMODS.Atlas({
    key = "settheory", 
    path = "jokers/SetTheory.png", 
    px = 71,
    py = 95,
    atlas_table = "ASSET_ATLAS"
})

SMODS.Joker{
    key = "settheory",
    blueprint_compat = true,
    rarity = 2,
    cost = 7,
    pools = {["Smallpox"] = true},
    atlas = "settheory",
    pos = {x=0,y=0},
    pronouns = "it_its",
    config = {extra = {xmult = 1.5, ranks = {}}},
    loc_vars = function(self, info_queue, card)
        return {vars = {card.ability.extra.xmult}}
    end,
    calculate = function(self, card, context)
        if context.after and not context.blueprint then
            card.ability.extra.ranks = {}
            for i, scored_card in ipairs(context.scoring_hand) do
                card.ability.extra.ranks[i] = scored_card:get_id()
            end
        end
        if context.individual and context.cardarea == G.play then
            for _, rank in ipairs(card.ability.extra.ranks) do
                if context.other_card:get_id() == rank then
                    return{
                        xmult = card.ability.extra.xmult
                    }
                end
            end
        end
    end,
    smallpox_credits = {
		{
			text = "By: IamArta",
            color = G.C.DARK_EDITION,
		},
	},
}
