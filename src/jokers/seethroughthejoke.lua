-- made by flynnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnn (i'm so fucking awesome haha)
SMODS.Atlas({
    key = "eyejoker", 
    path = "jokers/sight.png", 
    px = 71,
    py = 95,
    atlas_table = "ASSET_ATLAS"
})

--See Through the Joke
SMODS.Joker {
    key = "eyejoker",
    pos = { x = 0, y = 0 },
    rarity = 3,
    blueprint_compat = true,
    cost = 2,
    config = { extra = { h_size = 6 } },
    discovered = false,
    atlas = 'eyejoker',
    pools = {["Smallpox"] = true},
    calculate = function(self, card, context)
    end,

    add_to_deck = function(self, card, from_debuff)
        G.hand:change_size(card.ability.extra.h_size)
        SMODS.change_play_limit(-4)
        SMODS.change_discard_limit(-4)
    end,
    
    remove_from_deck = function(self, card, from_debuff)
        G.hand:change_size(-card.ability.extra.h_size)
        SMODS.change_play_limit(4)
        SMODS.change_discard_limit(4)
    end,
    smallpox_credits = {
		{
			text = "By: flynnsaneFellow",
            color = G.C.SECONDARY_SET.Tarot,
		},
	},
}


