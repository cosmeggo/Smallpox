SMODS.Atlas({
    key = "astro", 
    path = "jokers/astro.png", 
    px = 71,
    py = 95,
    atlas_table = "ASSET_ATLAS"
})

SMODS.Joker {
    key = "smallpox_astro",
    atlas = "astro",
    pos = { x = 0 , y = 0 },
    rarity = 2,
    blueprint_compat = true,
    cost = 7,
    config = { extra = { s_chips = 10, suit = 'Spades', s_count = 0}, },
    loc_vars = function(self, info_queue, card)
        return { vars = { card.ability.extra.s_chips, localize(card.ability.extra.suit, 'suits_singular'), card.ability.extra.s_chips * card.ability.extra.s_count, card.ability.extra.s_count, colours = {G.C.SUITS.Spades} },  }
    end,
	pronouns = 'they_them',
    calculate = function(self, card, context)
		if context.hand_drawn then
			card.ability.extra.s_count = 0
			for i = 1, #G.deck.cards do
				if G.deck.cards[i] and G.deck.cards[i].base.suit == card.ability.extra.suit then
					card.ability.extra.s_count = card.ability.extra.s_count + 1
				end
			end
		end
        if context.joker_main then
            return {
                chips = card.ability.extra.s_chips * card.ability.extra.s_count
            }
        end
    end
}
