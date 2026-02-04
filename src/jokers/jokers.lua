SMODS.Joker{
    key = "miller",
    pos = {
        x = 7,
        y = 0
    },
    soul_pos = { 
        x = 8, 
        y = 0 
    },
    atlas = "CustomJokers", --change later
    cost = 8,
    rarity = 3,
    discovered = true,
    calculate = function(self, card, context)
        if context.setting_blind and G.GAME.blind.in_blind then
                return {
                    message = "Drained", colour = G.C.RED,
                    play_sound("smallpox_drain"),
                    func = function()
                        G.GAME.blind.chips = G.GAME.blind.chips * 0.75
                        G.GAME.blind.chip_text = number_format(G.GAME.blind.chips)
                    end
                }
        end
        if context.end_of_round and context.game_over then
        return {play_sound("smallpox_laugh")}
        end
    end
}

