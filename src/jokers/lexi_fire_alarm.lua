SMODS.Atlas({
	key = "lexi_fire_alarm",
	path = "jokers/lexi_fire_alarm.png",
	px = 71,
	py = 95,
	atlas_table = "ASSET_ATLAS",
})

SMODS.Joker({
	key = "lexi_fire_alarm",
	atlas = "lexi_fire_alarm",
	pos = {
		x = 0,
		y = 0,
	},
	rarity = 1,
	cost = 3,
	pools = {
		["Smallpox"] = true,
		["Scaling"] = true,
		["Metallic"] = true
	},
	blueprint_compat = true,
	discovered = true,
	unlocked = true,
	config = {
		extra = {
			mult = 0,
			mult_g = 3,
		},
	},
	loc_vars = function(self, info_queue, card)
		return {
			vars = {
				card.ability.extra.mult,
				card.ability.extra.mult_g,
			},
		}
	end,
	calculate = function(self, card, context)
		if SMODS.last_hand_oneshot and context.after and context.main_eval and not context.blueprint then
			card.ability.extra.mult = card.ability.extra.mult + card.ability.extra.mult_g
			return {
				message = localize("k_upgrade_ex"),
				colour = G.C.MULT,
			}
		end
		if context.joker_main then
			return {
				mult = card.ability.extra.mult,
			}
		end
	end,
})
