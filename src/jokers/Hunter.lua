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
    discovered = true,
    unlocked = true,
    config = { extra = { mult = 1, increase = 0.1 }, },
    loc_vars = function(self, info_queue, card)
        return { vars = { card.ability.extra.mult } }
    end,
    
    calculate = function(self, card, context)
        if context.hand_drawn then  
            card.ability.extra.mult = card.ability.extra.mult + card.ability.extra.increase
            return {
                message = "Upgraded!",
                colour = G.C.FILTER
            }
        end
        if context.ante_end then
            card.ability.extra.mult = card.ability.extra.mult / 2
            return {
                xmult = card.ability.extra.mult,
                message = "Halved!",
                colour = G.C.FILTER
             }
        end
        if context.joker_main then
            return {
                mult = card.ability.extra.mult
            }
        end
    end,
}