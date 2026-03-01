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
    discovered = false,
    config = { extra = { x_mult = 1, mult = 1, dollars = 1 }, },
    atlas = 'PuzzleVision',
    pools = {["Smallpox"] = true, ["Metallic"] = true},
    loc_vars = function(self, info_queue, card)
        return { vars = { 1 + math.floor(G.GAME.round_resets.ante / 2), G.GAME.round, (G.jokers and math.floor(#G.jokers.cards / 2) or 0) } }
    end,
    
    calculate = function(self, card, context)
        if context.joker_main then
            return {
                mult = G.GAME.round,
                x_mult = 1 + math.floor(G.GAME.round_resets.ante / 2)
            }
        end
    end,
    calc_dollar_bonus = function(self, card)
        if G.jokers and #G.jokers.cards then
            return math.floor(#G.jokers.cards / 2)
        end
    end,
    smallpox_credits = {
    	{
    		text = "By: FireIce421",
            color = G.C.BLUE
    	},
    },
}