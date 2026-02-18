SMODS.Atlas {
	key = "Amp_Up",
	path = "jokers/jokerhythm.png",
	px = 71,
	py = 95
}

SMODS.Joker {
	key = 'rhythm',
	rarity = 1,
	atlas = 'Amp_Up',
	pos = { x = 0, y = 0 },
	cost = 5,
	config = { extra = { chip_mod = 12, chips = 0, frames = 8, fps = 8 } },
	pools = {["Smallpox"] = true, ["Metallic"] = true},
	pronouns = "it_its", 
	loc_vars = function(self, info_queue, card)
        return { vars = { card.ability.extra.chip_mod, card.ability.extra.chips, colours = { HEX('9d39c4') } }}
    end,
	update = function(self, card, dt)
		card.children.center:set_sprite_pos({x = math.floor((os.clock() * card.ability.extra.fps) % card.ability.extra.frames), y = 0})
	end,
    calculate = function(self, card, context)
        if context.press_play and
		not context.blueprint then
			local current_frame = math.floor((os.clock() * card.ability.extra.fps) % card.ability.extra.frames)
			print("Amp Up Frame - " .. current_frame)
			if current_frame >= 5 then

				SMODS.scale_card(card, {
					ref_table = card.ability.extra,
    				ref_value = "chips",
					scalar_value = "chip_mod"
				})
			else
				card.ability.extra.chips = 0
				return {
					message = localize("k_smallpox_rhythm_miss"),
                    colour = G.C.GREY 
				}
			end
        end

		if context.joker_main then
			return {
				chips = card.ability.extra.chips
			}
		end

        return nil
	end
}
