SMODS.Atlas {
    key = "thecoin",
    path = "jokers/thecoin.png",
    px = 71,
    py = 95
}

SMODS.Joker {
    atlas = 'thecoin',
    pos = { x = 0, y = 0 },
    soul_pos = { x = 1, y = 0 },
    pools = {["Smallpox"] = true },
    key = "smallpox_thecoin",
    pronouns = "she_they",
    rarity = 4,
    cost = 20,
	blueprint_compat = false,
	demicolon_compat = false,
	immutable = true,
    config = {
        extra = 
		{
			xmult_w = 2 , xmult_l = .5 , blind_mod = 2 , ante_mod = 2
        }, 
        coin = 
		{
            heads = false,
        },
    },
	
    loc_vars = function(self, info_queue, card)
        return { vars = { } }
    end,
    
	coinflip = function(self,card)
		local coin = pseudorandom("coinflip"..G.GAME.round..G.GAME.pseudorandom.seed, 0, 1)
		if coin == 0 then
			card.ability.coin.heads = false
		else
			card.ability.coin.heads = true
		end
		return coin
		-- u can hypothetically stick the animation in here, i'm not bothering
	end,
		

    calculate = function(self, card, context)

		-- Death context

		if context.end_of_round and context.game_over and context.main_eval then
			c1 = self:coinflip(card)
			c2 = self:coinflip(card)
            if c1 == 1 and c2 == 1 then
				card:juice_up()
				return 
				{
					message = localize("k_saved_ex"),
					saved = "the coin decides.",
					colour = G.C.RED
				}
			end
        end


        -- Boss blind context
		
		if context.setting_blind and not context.blueprint and context.blind.boss then
			self:coinflip(card)
            if card.ability.coin.heads == true then
				G.E_MANAGER:add_event(Event({
					func = function()
						G.E_MANAGER:add_event(Event({
							func = function()
								G.GAME.blind:disable()
								play_sound('timpani')
								delay(0.4)
								return true
							end
						}))
						SMODS.calculate_effect({ message = localize('ph_boss_disabled') }, card)
						return true
					end
				}))
				return nil, true
			else
				G.GAME.blind.chips = math.floor(G.GAME.blind.chips * card.ability.extra.blind_mod)
				G.GAME.blind.chip_text = number_format(G.GAME.blind.chips)
			end
		end
		
		
		-- Scoring context
		
		if context.joker_main then
			self:coinflip(card)
            if card.ability.coin.heads == true then
				return {
					xmult = card.ability.extra.xmult_w
				}
			else 
				return {
					xmult = card.ability.extra.xmult_l
				}
			end
        end
		
		if context.end_of_round and context.game_over == false and context.main_eval and not context.blueprint then
            if context.beat_boss then
        	c1 = self:coinflip(card)
			c2 = self:coinflip(card)
            if c1 == 1 and c2 == 1 then
					G.GAME.modifiers.scaling = (G.GAME.modifiers.scaling or 1) * 2
					ease_ante(-card.ability.extra.ante_mod)
					G.GAME.round_resets.blind_ante = G.GAME.round_resets.blind_ante or G.GAME.round_resets.ante
					G.GAME.round_resets.blind_ante = G.GAME.round_resets.blind_ante - card.ability.extra.ante_mod				
				end
			end		
    end
    end,
	smallpox_credits = {
		{
			text = "By: Lyre",
			color = G.C.RARITY[4]
		},
	},
}
