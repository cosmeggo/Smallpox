SMODS.Atlas {
    key = "pk_thunder_ANIM",
    px = 71,
    py = 95,
    path = 'jokers/pkthunder.png',
    atlas_table = 'ANIMATION_ATLAS',
    frames = 24,
    fps = 18
}

SMODS.Sound {
    key = "iso_thunder_land",
    path = "thunder end.ogg"
}

SMODS.Sound {
    key = "iso_thunder_init",
    path = "thunder init.ogg"
}

SMODS.Joker {
    key = "claus_dies",
    name = "claus",
    rarity = 3,
    cost = 13,
    atlas = "pk_thunder_ANIM",
    pools = {["Smallpox"] = true},
    config = {
        extra = {
            probability_1a = 1,
            probability_1b = 2,
            probability_1c = 1,
            probability_2a = 6,
            probability_2b = 10,
            probability_2c = 8,
            xmult = 3,
            retrig_check = 0
        }
    },
    loc_vars = function(self, info_queue, card)
        local numerator_1, denominator_1 = SMODS.get_probability_vars(card, card.ability.extra.probability_1a,
            card.ability.extra.probability_2a,
            'j_smallpox_claus_dies')
        local numerator_2, denominator_2 = SMODS.get_probability_vars(card, card.ability.extra.probability_1b,
            card.ability.extra.probability_2b,
            'j_smallpox_claus_dies')
        local numerator_3, denominator_3 = SMODS.get_probability_vars(card, card.ability.extra.probability_1c,
            card.ability.extra.probability_2c,
            'j_smallpox_claus_dies')
        return {
            vars = {
                numerator_1, numerator_2, numerator_3, denominator_1, denominator_2, denominator_3
            }
        }
    end,
    blueprint_compat = false,
    calculate = function(self, card, context)
        if context.initial_scoring_step and not context.blueprint then
            card:juice_up()
            play_sound("smallpox_iso_thunder_init", 1, 1)
        end
        if context.joker_main and not context.blueprint then
            if SMODS.pseudorandom_probability(card, 'smallpox_claus_dies', card.ability.extra.probability_1a, card.ability.extra.probability_2a) then
                return {
                    remove_default_message = true,
                    message = "Hit!",
                    sound = "smallpox_iso_thunder_land",
                    pitch = 1,
                    xmult = card.ability.extra.xmult
                }
            else
                return {
                    message = "Miss!",
                }
            end
        end
        if context.retrigger_joker_check and (context.other_card and context.other_card == card) and not context.blueprint then
            return {
                message = "Again?",
                sound = "smallpox_iso_thunder_init",
                pitch = 1,
                repetitions = 3
            }
        end
    end,
	smallpox_credits = {
		{
			text = "By: isotypical",
			color = G.C.BLUE
		},
	},
}
