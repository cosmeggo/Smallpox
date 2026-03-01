-- Smallpox Atlases
SMODS.Atlas({
    key = "smallpox", 
    path = "jokers/Smallpox.png", 
    px = 71,
    py = 95,
    atlas_table = "ASSET_ATLAS"
})

SMODS.Sound {
    key = "cronch",
    path = "cronch.ogg"
}

-- Smallpox
SMODS.Joker {
    key = "smallpox",
    pos = { x = 0, y = 0 },
    rarity = 3,
    blueprint_compat = true,
    cost = 1,
    discovered = false,
    config = { extra = { xmult = 1, odds = 4, xmult_gain = 0.5 }, },
    pools = {["Smallpox"] = true},
    atlas = 'smallpox',

    loc_vars = function(self, info_queue, card)
        local numerator, denominator = SMODS.get_probability_vars(card, 1, card.ability.extra.odds, 'smallpox_smallpox')
        return { vars = { colours = { HEX('2d50ba') }, card.ability.extra.xmult, numerator, denominator, card.ability.extra.xmult_gain } }
    end,

    calculate = function(self, card, context)
        if context.before and SMODS.pseudorandom_probability(card, 'smallpox_smallpox', 1, card.ability.extra.odds) then
        --Slicing
            local destructable_jokers = {}
            for i = 1, #G.jokers.cards do
                if G.jokers.cards[i] ~= card and not SMODS.is_eternal(G.jokers.cards[i], card) and G.jokers.cards[i].config.center.key ~= 'j_smallpox_smallpox' and G.jokers.cards[i].config.center.key ~= 'j_smallpox_poxofthewild'  and not G.jokers.cards[i].getting_sliced then
                    destructable_jokers[#destructable_jokers + 1] =
                        G.jokers.cards[i]
                end
            end
        local joker_to_destroy = pseudorandom_element(destructable_jokers, 'smallpox_smallpox')
        if joker_to_destroy then
            joker_to_destroy.getting_sliced = true
                card.ability.extra.xmult = card.ability.extra.xmult + card.ability.extra.xmult_gain -- Gain xMult
                return {
                    sound = "smallpox_cronch",
                    message = "Infected!",
                    colour = G.C.PURPLE
                },
            G.E_MANAGER:add_event(Event({ -- Start Dissolve
                func = function()
                    (context.blueprint_card or card):juice_up(0.8, 0.8)
                    joker_to_destroy:start_dissolve({ G.C.RED }, nil, 1.6)
                    return true
                 end,
            G.E_MANAGER:add_event(Event({ -- Newly Infected Card
                func = function()
                    copied_joker = copy_card(joker_to_destroy, nil, nil, nil, nil)
                    copied_joker:set_ability(card.config.center.key)
                    copied_joker:add_to_deck()
                    G.jokers:emplace(copied_joker)
                    return true
                end,
            })) -- End Dissolve
            })) -- End New Card
            end
        end
        if context.joker_main then --XMult
            return {
                xmult = card.ability.extra.xmult
            }
        end
    end,
    smallpox_credits = {
		{
			text = "By: Plasma",
            color = G.C.BLUE,
		},
	},
}


