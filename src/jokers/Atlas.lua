-- Example Joker Atlas
SMODS.Atlas({
	key = "zucchiniatlas",
	path = "jokers/Atlas.png",
	px = 71,
	py = 95,
	atlas_table = "ASSET_ATLAS"
})

--[[
Example Joker
CardPronouns prons: "she_her", "he_him", "they_them", "any_all", "it_its", "she_they", "he_they"
Pools must always have ["Smallpox"] = true, for other pools, check src/pools.lua if it exists already, if not, WARN the Helpers!
please set cost according to rarity
+-----+------------+----------+
|  #  |  Rarity    |  Cost    |
|-----+------------+----------+
|  1  |  Common    |  $3-5    |
|  2  |  Uncommon  |  $5-8    |
|  3  |  Rare      |  $8-10   |
|  4  |  Legendary |  $15-20  |
+-----+------------+----------+
]]
SMODS.Joker {
	key = "zucchiniatlas",
	atlas = 'zucchiniatlas',
	eternal_compat = false,
	perishable_compat = true,
	pos = { x = 0, y = 0 },
	rarity = 2,
	cost = 8,
	pools = { ["Smallpox"] = true }, -- see comment at the top
	blueprint_compat = true,      -- set to false if you dont want blueprint to copy
	discovered = true,
	unlocked = true,
	config = { extra = { xmult = 3, ceiling = 3, floor = 0, amt = 1 }, },
	pronouns = "he_him", -- see comment at top
	loc_vars = function(self, info_queue, card)
		return { vars = { card.ability.extra.xmult, card.ability.extra.ceiling, card.ability.extra.floor, card.ability.extra.amt } }
	end,

	calculate = function(self, card, context)
		if context.joker_main then
			return {
				xmult = card.ability.extra.xmult
			}
		end
		if context.using_consumeable and not context.blueprint and context.consumeable.ability.set == 'Planet' and card.ability.extra.xmult ~= card.ability.extra.ceiling then
			card.ability.extra.xmult = card.ability.extra.xmult + card.ability.extra.amt
			return {
				message = localize('k_upgrade_ex'),
				colour = G.C.MULT,
			}
		end
		if context.end_of_round and context.game_over == false and context.main_eval and not context.blueprint then
			if card.ability.extra.xmult == card.ability.extra.floor + card.ability.extra.amt then
				G.E_MANAGER:add_event(Event({
					func = function()
						play_sound('tarot1')
						card.T.r = -0.2
						card:juice_up(0.3, 0.4)
						card.states.drag.is = true
						card.children.center.pinch.x = true
						-- This part destroys the card.
						G.E_MANAGER:add_event(Event({
							trigger = 'after',
							delay = 0.3,
							blockable = false,
							func = function()
								G.jokers:remove_card(card)
								card:remove()
								card = nil
								return true;
							end
						}))
						return true
					end
				}))
				return {
					message = "!",
					colour = G.C.RED
				}
			else
				card.ability.extra.xmult = card.ability.extra.xmult - card.ability.extra.amt
				return {
					message = "Downgrade",
					colour = G.C.RED
				}
			end
		end
	end,
	smallpox_credits = {
		{
			text = "By: ABuffZucchini",
			color = G.C.BLUE
		},
	},
}
