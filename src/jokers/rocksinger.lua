SMODS.Atlas({
    key = "tigerthawk", 
    path = "jokers/SmellsLikeTeenSpirit.png", 
    px = 71,
    py = 95
})

SMODS.Joker {
    key = "gun",
    blueprint_compat = true,
    perishable_compat = false,
    rarity = 3,
    cost = 8,
    atlas = "tigerthawk",
    pos = { x = 0, y = 0 },
    pools = {["Smallpox"] = true, ["Metallic"] = true},
    config = { extra = { mult = 1, change = 0.2 } },
    loc_vars = function(self, info_queue, card)
        return { vars = { card.ability.extra.mult, card.ability.extra.change } }
    end,
    calculate = function(self, card, context)
        if context.setting_blind and not context.blueprint then
            local my_pos = nil
            for i = 1, #G.jokers.cards do
                if G.jokers.cards[i] == card then
                    my_pos = i
                    break
                end
            end
            if my_pos and G.jokers.cards[my_pos + 1] and not SMODS.is_eternal(G.jokers.cards[my_pos + 1], card) and not G.jokers.cards[my_pos + 1].getting_sliced then
                local sliced_card = G.jokers.cards[my_pos + 1]
                sliced_card.getting_sliced = true -- Make sure to do this on destruction effects
                G.GAME.joker_buffer = G.GAME.joker_buffer - 1

                G.E_MANAGER:add_event(Event({
                    func = function()
                        G.GAME.joker_buffer = 0
                        -- See note about SMODS Scaling Manipulation on the wiki
                        card.ability.extra.mult = card.ability.extra.mult + sliced_card.sell_cost * card.ability.extra.change
                        card:juice_up(0.8, 0.8)
                        sliced_card:start_dissolve({ HEX("57ecab") }, nil, 1.6)
                        play_sound('smallpox_tigerthawk_gunshot', 0.96 + math.random() * 0.08, 2000)
                        return true
                    end
                }))

                
                
                
            end
            if my_pos and G.jokers.cards[my_pos - 1] and not SMODS.is_eternal(G.jokers.cards[my_pos - 1], card) and not G.jokers.cards[my_pos - 1].getting_sliced then
                local shot = G.jokers.cards[my_pos - 1]
                shot.getting_sliced = true -- Make sure to do this on destruction effects
                G.GAME.joker_buffer = G.GAME.joker_buffer - 1

                G.E_MANAGER:add_event(Event({
                    func = function()
                        G.GAME.joker_buffer = 0
                        -- See note about SMODS Scaling Manipulation on the wiki
                        card.ability.extra.mult = card.ability.extra.mult + shot.sell_cost * card.ability.extra.change
                        card:juice_up(0.8, 0.8)
                        shot:start_dissolve({ HEX("57ecab") }, nil, 1.6)
                        play_sound('smallpox_tigerthawk_gunshot', 0.96 + math.random() * 0.08, 2000)
                        return true
                    end
                }))

                
            end
            return {
                    message = "Shot!",
                    colour = G.C.MULT
                }
        end
        if context.joker_main then
            return {
                Xmult = card.ability.extra.mult
            }
        end
    end,
    smallpox_credits = {
		{
			text = {
                "By: TigerTHawk",
                "Code: SLDTyp0",
            },
            color = HEX("F399FF"),
		},
	},
}

