-- Joker and art by ProdByProto
SMODS.Atlas({
    key = "socks", 
    path = "jokers/Socks.png", 
    px = 71,
    py = 95,
    atlas_table = "ASSET_ATLAS"
})

SMODS.Joker {
    key = "longsocks",
    atlas = 'socks',
    pos = { x = 0, y = 0 },
    soul_pos = { x = 1, y = 0 },
    rarity = 2,
    cost = 6,
    pools = {["Smallpox"] = true, ["Scaling"] = true, ["Meme"] = true}, -- see comment at the top
    blueprint_compat = true, -- set to false if you dont want blueprint to copy
    discovered = true,
    unlocked = true,
    config = { 
        extra = { 
            scale = 0.1,
            xmult = 1.5,
        },
    },
    pronouns = "any_all", -- see comment at top

    loc_vars = function(self, info_queue, card)
        return { vars = { card.ability.extra.scale, card.ability.extra.xmult } }
    end,
    
    calculate = function(self, card, context)
        if context.joker_main == true then
            local socks = pseudorandom("socks"..G.GAME.round..G.GAME.pseudorandom.seed, 0, 4)
              if socks == 0 then
                  card.ability.extra.xmult = card.ability.extra.xmult + card.ability.extra.scale
              end
            return {
            xmult = card.ability.extra.xmult
            }
        end
    end,
}