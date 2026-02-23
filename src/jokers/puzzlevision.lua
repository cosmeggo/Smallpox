-- Puzzlevision Atlas
SMODS.Atlas({
    key = "PuzzleVision", 
    path = "jokers/PuzzleVision.png", 
    px = 71,
    py = 95,
    atlas_table = "ASSET_ATLAS"
})

-- Puzzlevision
SMODS.Joker {
    key = "puzzlevision",
    pos = { x = 0, y = 0 },
    rarity = 3,
    blueprint_compat = true,
    cost = 7,
    discovered = true,
    config = { extra = { x_mult = 1, mult = 1, dollars = 1 }, },
    atlas = 'PuzzleVision',
    pools = {["Smallpox"] = true, ["Metallic"] = true},
    loc_vars = function(self, info_queue, card)
        return { vars = { card.ability.extra.x_mult, card.ability.extra.mult, (G.jokers and #G.jokers.cards or 0) } }
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
    calc_dollar_bonus = function(self, card)
        if G.jokers and #G.jokers.cards then
            return #G.jokers.cards
        end
    end,
    smallpox_credits = {
    	{
    		text = "By: FireIce421",
            color = G.C.BLUE
    	},
    },
}