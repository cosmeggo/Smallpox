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
    discovered = false,
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
        local ret = {}
        if not context.repetition then
            if G.jokers and G.jokers.highlighted and #G.jokers.highlighted == 0 then
			    card.ability.extra.steps = card.ability.extra.steps + 1
		    end
            
            if card.ability.extra.steps > card.ability.extra.populationFactor then
                card.ability.extra.xmult = card.ability.extra.xmult + card.ability.extra.scale
                ret.extra = {}
                ret.extra.message = localize("smallpox_sockscale"..pseudorandom("word",1,3))..G.PROFILES[G.SETTINGS.profile].name
                ret.extra.message_card = card
                card.ability.extra.steps, card.ability.extra.populationFactor = 0, pseudorandom("populationFactor",card.ability.extra.popFactorMin,card.ability.extra.popFactorMax)
                print("Socks Population Factor - " .. card.ability.extra.populationFactor)
            end
        end

        if context.joker_main then
            ret.xmult = card.ability.extra.xmult
            return ret
        end

        if ret then 
            SMODS.calculate_effect(ret, card)
        end
    end,
    smallpox_credits = {
		{
			text = "By: ProdByProto",
            color = G.C.RARITY[4]
		},
	},
}