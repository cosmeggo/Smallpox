

SMODS.Atlas({
    key = "missingnumber", 
    path = "jokers/MissingNumber.png", 
    px = 71,
    py = 95,
    atlas_table = "ASSET_ATLAS"
})

SMODS.Joker {
    key = "missingnumber",
    atlas = 'missingnumber',
    pos = { x = 0, y = 0 },
    rarity = 3,
    cost = 7,
    pools = {["Smallpox"] = true}, 
    blueprint_compat = true, 
    discovered = true,
    unlocked = true,
    config = { extra = { mult = 1.5 }, },
    pronouns = "they_them", 
    loc_vars = function(self, info_queue, card)
        return { vars = { card.ability.extra.mult } }
    end,
    
    calculate = function(self, card, context)

        if context.individual and context.cardarea == G.play and context.other_card and context.other_card:is_suit("Hearts") and not SMODS.has_enhancement(context.other_card, 'm_glass') then

            local card = context.other_card


            G.E_MANAGER:add_event(Event({
                trigger = 'after',
                delay = 0.1,
                func = function()
                    play_sound('tarot1')
                    card:flip()
                    return true
                end
            }))

            G.E_MANAGER:add_event(Event({
                trigger = 'after',
                delay = 0.25,
                func = function()
                    play_sound('card1')
                    card:juice_up(0.3, 0.1)
                    return true
                end
            }))

            G.E_MANAGER:add_event(Event({
                trigger = 'after',
                delay = 0.4,
                func = function()
                    card:set_ability("m_glass")
                    return true
                end
            }))

            G.E_MANAGER:add_event(Event({
                trigger = 'after',
                delay = 0.55,
                func = function()
                    play_sound('tarot2')
                    card:flip()
                    return true
                end
            }))

            return {
                message = "Stained!",
                colour = {0.5, 0.5, 0.5, 0.5},
                sound = "polychrome1"
            }
        end

        if context.individual and context.cardarea == G.play and context.other_card and context.other_card:is_suit("Hearts") and SMODS.has_enhancement(context.other_card, 'm_glass') then

            return {
                xchips = card.ability.extra.mult
            }
        end
    end,
    smallpox_credits = {
		{
			text = {
                "By: missingnumber",
                "Code: SLDTyp0"
            },
            color = HEX("000000"),
		},
	},

}
