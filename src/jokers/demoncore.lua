-- Example Joker Atlas
SMODS.Atlas({
	key = "demon_core",
	path = "jokers/demon_core.png",
	px = 71,
	py = 95,
	atlas_table = "ASSET_ATLAS",
})

local gradient = SMODS.Gradient({
	key = "thunderedge_gradient",
	colours = {
		HEX("89C41B"),
		HEX("C5CC41"),
	},
	cycle = 5,
})

-- Example Joker
SMODS.Joker({
	key = "demon_core",
	pos = { x = 0, y = 0 },
	rarity = 3,
	blueprint_compat = true,
	cost = 10,
	discovered = false,
	config = { extra = { xmult = 1, xmult_gain = 0.25 } },
	pools = {["Smallpox"] = true, ["Metallic"] = true},
	atlas = "demon_core",

	loc_vars = function(self, info_queue, card)
		return { vars = { card.ability.extra.xmult_gain, card.ability.extra.xmult, colours = { gradient } } }
	end,

	calculate = function(self, card, context)
		if context.joker_main then
			return {
				xmult = card.ability.extra.xmult,
			}
		end
        if context.setting_blind then
            local target = pseudorandom_element(G.playing_cards, "demon_core")
            if target then
                SMODS.destroy_cards(target)
            end
            SMODS.scale_card(card, {
                ref_value = "xmult",
                scalar_value = "xmult_gain"
            })
        end
	end,
	smallpox_credits = {
		{
			text = "By: ThunderEdge",
			color = gradient
		},
	},
})
