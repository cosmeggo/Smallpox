SMODS.Atlas({
    key = "GhostSalt", 
    path = "jokers/GhostSalt.png", 
    px = 71,
    py = 95,
    atlas_table = "ASSET_ATLAS"
})

SMODS.Joker {
    key = "nolittering",
    atlas = 'GhostSalt',
    pos = { x = 0, y = 0 },
    rarity = 1,
    cost = 5,
    pools = {["Smallpox"] = true},
    blueprint_compat = true,
    eternal_compat = true,
    perishable_compat = false,
    discovered = true,
    unlocked = true,
    config = { extra = { added_mult = 1, current_mult = 0 }, },
    pronouns = "it_its",
    loc_vars = function(self, info_queue, card)
        return { vars = { card.ability.extra.added_mult, card.ability.extra.current_mult } }
    end,
    
    calculate = function(self, card, context)
        if context.joker_main and card.ability.extra.current_mult > 0 then return { mult = card.ability.extra.current_mult } end

        if context.before and G.GAME.current_round.discards_used <= 0 then
            card.ability.extra.current_mult = card.ability.extra.current_mult + card.ability.extra.added_mult
            return { message = localize("k_upgrade_ex") }
        end
    end
}
