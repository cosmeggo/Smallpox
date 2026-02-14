SMODS.Atlas({
    key = "iwillnever", 
    path = "jokers/iwillnever.png", 
    px = 71,
    py = 95,
    atlas_table = "ASSET_ATLAS"
})


SMODS.Joker {
    atlas = 'iwillnever',
    pos = { x = 0, y = 0 },
    pools = {["Smallpox"] = true },
    key = "smallpox_iwillnever",
	pronouns = "she_they",
    rarity = 1,
    cost = 5,
  	config = {
  		extra = {
  			xmult = 3
  		}, 
  		jokerforge = {
  			sucks = false,
  			set = false,
  		},
  	},
    loc_vars = function(self, info_queue, card)
		return { 
			vars = {
				card.ability.extra.xmult,
				colours = {
					HEX('91583D'),
				}, 
			},
		}
    end,
	
  	add_to_deck = function(self,card,from_debuff)
  		if card.ability.jokerforge.set == false then
  			local sucks = pseudorandom("jokerforgesucks"..G.GAME.round..G.GAME.pseudorandom.seed, 0, 1)
  			if sucks == 0 then
  				card.ability.jokerforge.sucks = false
  			else
  				card.ability.jokerforge.sucks = true
  			end
  			card.ability.jokerforge.set = true
  		end
  	end,

    calculate = function(self, card, context)
		if context.joker_main and card.ability.jokerforge.sucks == true then
			return {
			xmult = card.ability.extra.xmult
			}
		end
    end,
    blueprint_compat = true,
}
