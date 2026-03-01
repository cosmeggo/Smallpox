SMODS.Atlas({
    key = "hunter", 
    path = "jokers/Hunter.png", 
    px = 71,
    py = 95,
    atlas_table = "ASSET_ATLAS"
})

SMODS.Joker {
    key = "hunter",
    atlas = 'hunter',
    pos = { x = 0, y = 0 },
    rarity = 3,
    cost = 9,
    pools = {["Smallpox"] = true}, -- see comment at the top
    blueprint_compat = true, -- set to false if you dont want blueprint to copy
    discovered = false,
    unlocked = true,
    config = { extra = { xmult = 0, increase = 0.1 }, },
    loc_vars = function(self, info_queue, card)
        return { vars = { 1 + card.ability.extra.xmult } }
    end,
    
    calculate = function(self, card, context)
        if context.hand_drawn then  
            card.ability.extra.xmult = card.ability.extra.xmult + card.ability.extra.increase
            return {
                message = "Upgraded!",
                colour = G.C.FILTER
            }
        end
        if context.ante_end and context.ante_change then
            card.ability.extra.xmult = card.ability.extra.xmult / 2
            return {
                message = "Crumpled Page!",
                colour = G.C.FILTER
             }
        end
        if context.joker_main then
            return {
                xmult = 1 + card.ability.extra.xmult
            }
        end
    end,
    smallpox_credits = {
		{
			text = {
                "By: Hunter",
                "Code: SLDTyp0"
            },
			color = G.C.SECONDARY_SET.Planet
		},
	},
}