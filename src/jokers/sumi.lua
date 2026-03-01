SMODS.Atlas({
    key = "tjetsu_sumi_atlas", 
    path = "jokers/tjetsu_sumi.png", 
    px = 71,
    py = 95,
})
SMODS.Joker{
    key = 'tjetsu_sumi',
    atlas = 'tjetsu_sumi_atlas',
    rarity = 2,
    cost = 8,
    unlocked = true,
    discovered = false,
    blueprint_compat = true,
    eternal_compat = true,
    perishable_compat = true,
    pools = {["Smallpox"] = true},
    pos = {x = 0, y = 0},
    config = {
        extra = {
            xchips = 1.75,
            xmult = 1.5,
            lastsuit = "None",
            lastwild = "Mult"
        }
    },

    loc_vars = function(self, info_queue, card)
        if card.ability.extra.lastsuit == "Hearts" then
            return { 
                vars = {
                    card.ability.extra.xchips,
                    card.ability.extra.xmult,
                    card.ability.extra.lastsuit,
                    colours = {G.C.SUITS.Hearts}
                },
            }
        elseif card.ability.extra.lastsuit == "Spades" then
            return { 
                vars = {
                    card.ability.extra.xchips,
                    card.ability.extra.xmult,
                    card.ability.extra.lastsuit,
                    colours = {G.C.SUITS.Spades}
                },
            }
        elseif card.ability.extra.lastsuit == "None" then
            return { 
                vars = {
                    card.ability.extra.xchips,
                    card.ability.extra.xmult,
                    card.ability.extra.lastsuit,
                    colours = {G.C.INACTIVE}
                },  
            }
            elseif card.ability.extra.lastsuit == "Wild/Mixed" then
            return { 
                vars = {
                    card.ability.extra.xchips,
                    card.ability.extra.xmult,
                    card.ability.extra.lastsuit,
                    colours = {G.C.DARK_EDITION}
                },
            }
        end
    end,

calculate = function(self, card, context)
    if context.individual and context.cardarea == G.play then
        local scard = context.other_card
        local extra = card.ability.extra
        local is_light = scard:is_suit("Hearts")
        local is_dark  = scard:is_suit("Spades")
        local is_mixed = is_light and is_dark
        if extra.lastsuit == "None" then
            if is_mixed then
                extra.lastsuit = "Wild/Mixed"
            elseif is_light then
                extra.lastsuit = "Hearts"
            elseif is_dark then
                extra.lastsuit = "Spades"
            end
            return
        end
        if is_mixed and extra.lastsuit ~= "None" then
            extra.lastsuit = "Wild/Mixed"

            if extra.lastwild == "Mult" then
                extra.lastwild = "Chips"
                return { xmult = extra.xmult }
            else
                extra.lastwild = "Mult"
                return { xchips = extra.xchips }
            end
        end

        if is_light and extra.lastsuit ~= "Hearts" then
            extra.lastsuit = "Hearts"
            return { xmult = extra.xmult }
        end
        if is_dark and extra.lastsuit ~= "Spades" then
            extra.lastsuit = "Spades"
            return { xchips = extra.xchips }
        end
    end
end,
    smallpox_credits = {
		{
			text = "By: Tje.Tsu",
            color = G.C.SECONDARY_SET.Tarot
		},
	},
}

