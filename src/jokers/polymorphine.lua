SMODS.Atlas({
    key = "polymorphine", 
    path = "jokers/polymorphine.png", 
    px = 71,
    py = 95,
    atlas_table = "ASSET_ATLAS"
})

-- Polymorphine
SMODS.Joker {
    key = "polymorphine",
    atlas = 'polymorphine',
    pos = { x = 0, y = 0 },
    rarity = 3,
    pools = {["Smallpox"] = true},
    blueprint_compat = false,
    cost = 7,
    discovered = true,
    config = { extra = { mult = 5 }, },
    loc_vars = function(self, info_queue, card)
        return { }
    end,
    calculate = function(self, card, context)
        if context.reroll_shop and not context.blueprint and not card.getting_sliced and G.consumeables.cards[1] then
            local consumables = #G.consumeables.cards
            SMODS.destroy_cards(G.consumeables.cards)
            for i = 1, consumables do
                SMODS.add_card{ set = "Consumeables"}
            end
        end
    end,
    smallpox_credits = {
		{
			text = {
                "By: NinjaBanana",
                "Art: LasagnaFelidae"
            },
            color = G.C.BLUE
		},
	},
}
