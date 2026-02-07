SMODS.Atlas({
    key = "miller", 
    path = "jokers/miller.png", 
    px = 71,
    py = 95,
    atlas_table = "ASSET_ATLAS"
})

SMODS.Joker{
    key = "miller",
    pos = {
        x = 0,
        y = 0
    },
    soul_pos = { 
        x = 1, 
        y = 0 
    },
    atlas = "miller",
    cost = 8,
    rarity = 3,
    pools = {["Smallpox_Pool"] = true},
    pronouns = "he_him",
    discovered = true,
    config = { extra = { percentage = 0.25}, },
    loc_vars = function(self, info_queue, card)
        return { vars = { card.ability.extra.percentage * 100} }
    end,
    calculate = function(self, card, context)
        if context.setting_blind and G.GAME.blind.in_blind then
                return {
                    message = "Drained", colour = G.C.RED,
                    play_sound("smallpox_miller_drain"),
                    func = function()
                        G.GAME.blind.chips = G.GAME.blind.chips * (1 - card.ability.extra.percentage)
                        G.GAME.blind.chip_text = number_format(G.GAME.blind.chips)
                    end
                }
        end
        if context.end_of_round and context.game_over then
        return {play_sound("smallpox_miller_laugh")}
        end
    end
}
