-- Puzzlevision
SMODS.Joker {
    key = "puzzlevision",
    pos = { x = 0, y = 0 },
    rarity = 3,
    blueprint_compat = true,
    cost = 7,
    discovered = true,
    config = { extra = { x_mult = 1, mult = 1, dollars = 1 }, },
    atlas = 'CustomJokers',

    loc_vars = function(self, info_queue, card)
        return { vars = { card.ability.extra.x_mult, card.ability.extra.mult, card.ability.extra.dollars } }
    end,
    
    calculate = function(self, card, context)
        if context.joker_main then
            return {
                mult = card.ability.extra.mult,
                x_mult = card.ability.extra.x_mult
            }
        end
        if context.setting_blind then
             card.ability.extra.x_mult = G.GAME.round_resets.ante
             card.ability.extra.mult = G.GAME.round
        end
    end,
    add_to_deck = function(self, card, from_debuff)
        card.ability.extra.x_mult = G.GAME.round_resets.ante
        card.ability.extra.mult = G.GAME.round
        card.ability.extra.dollars = card.ability.extra.dollars * (G.jokers and #G.jokers.cards or 0)
  end,
    calc_dollar_bonus = function(self, card)
        return card.ability.extra.dollars * ( #G.jokers.cards )
    end
}