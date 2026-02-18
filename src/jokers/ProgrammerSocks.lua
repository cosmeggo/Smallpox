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
            populationFactor = 450,
            steps = 0,
            -- change the next two for rebalancing
            popFactorMin = 250,
            popFactorMax = 550
        },
    },
    pronouns = "any_all", -- see comment at top

    loc_vars = function(self, info_queue, card)
        return { vars = { card.ability.extra.scale, card.ability.extra.xmult } }
    end,
    
    calculate = function(self, card, context)
        local cae = card.ability.extra
        local ret = {}
        cae.steps = cae.steps + 1
        if not context.repetition then
            if cae.steps > cae.populationFactor then
                cae.xmult = cae.xmult + cae.scale
                ret.extra = {}
                ret.extra.message = localize("smallpox_sockscale"..pseudorandom("word",1,3))..G.PROFILES[G.SETTINGS.profile].name
                ret.extra.message_card = card
                cae.steps, cae.populationFactor = 0, pseudorandom("populationFactor",cae.popFactorMin,cae.popFactorMax)
                print(cae.populationFactor)
            end
        end

        if context.joker_main then
            ret.xmult = cae.xmult
        end

        return ret
        --[[ naive implementation, causes stack overflow
        for event in pairs(context) do
            if not cae.chance[event] then
                cae.chance[event] = {}
                cae.chance[event].numer = pseudorandom("numerator",1,19)
                cae.chance[event].denom = pseudorandom("denominator",cae.chance[event].numer+1,20)
            end
            if SMODS.pseudorandom_probability(self,"scale?",cae.chance[event].numer,cae.chance[event].denom,"smallpox_longsocks",true) then
                cae.xmult = cae.xmult + cae.scale
                ret.extra = {}
                ret.extra.message = localize("smallpox_sockscale"..pseudorandom("word",1,3))..G.PROFILES[G.SETTINGS.profile].name
            end
        end
        ]]
    end
}
