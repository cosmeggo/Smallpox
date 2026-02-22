SMODS.Atlas({
    key = "scalesofjustice",
    path = "jokers/scalesofjustice.png",
    px = 71,
    py = 95
})

SMODS.Joker {
    key = "scales_of_justice",
    pos = { x = 0, y = 0 },
    atlas = "scalesofjustice",
    rarity = 3,
    blueprint_compat = true,
    cost = 4,
    discovered = true,
    config = { extra = { xmult = 1.5,xmult2 = 1.5 }, },
    pools = {["Smallpox"] = true, ["Metallic"] = true},
    loc_vars = function(self, info_queue, card)
        local cae = card.ability.extra
        return { vars = { cae.xmult,cae.xmult2 } }
    end,
    
    calculate = function(self, card, context)
        local cae = card.ability.extra
        if context.joker_main then
            local rr,a,b = nil,0,0
            for i = 1, #G.jokers.cards do
                if G.jokers.cards[i] == card then
                    rr = i
                    break
                end
            end
            for i = 1, #G.jokers.cards do
                if i < rr then
                    a = a + 1
                elseif i > rr then
                    b = b + 1
                end
            end
            local c = 0
            for k, v in pairs(context.scoring_hand) do
                if v and v.base and v.base.nominal then
                    c = c + v.base.nominal
                end
            end
            if c%2 == 0 then
                local d = cae.xmult
                if a == b then
                    d = d + cae.xmult2
                end
                return {
                    xmult = d
                }
            end
        end
    end,
    smallpox_credits = {
		{
			text = {
                "By: Revo",
                "Art: Plasma"
            },
            color = G.C.PURPLE
		},
	},
}