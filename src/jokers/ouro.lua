SMODS.Atlas({
    key = "orojoker", 
    path = "jokers/j_oro.png", 
    px = 71,
    py = 95,
    atlas_table = "ASSET_ATLAS"
})

SMODS.Joker {
    key = "ins_oro",
    atlas = 'orojoker',
    pos = { x = 0, y = 0 },
    rarity = 3,
    cost = 8,
    pools = {["Smallpox"] = true}, -- see comment at the top
    blueprint_compat = true, -- set to false if you dont want blueprint to copy
    discovered = true,
    unlocked = true,
    config = { extra = { mult = 1, mult_gain = 0.25 }, },
    pronouns = "any_all", -- see comment at top
    loc_vars = function(self, info_queue, card)
        return { vars = { card.ability.extra.mult, card.ability.extra.mult_gain } }
    end,
    
    calculate = function(self, card, context)
        if context.joker_main then
            return {
                xmult = card.ability.extra.mult
            }
        end

        if context.selling_self or (context.joker_type_destroyed and context.card == card) then
            G.GAME.SPOX_OROINIT = card.ability.extra.mult + card.ability.extra.mult_gain
            print(G.GAME.SPOX_OROINIT)
        end
    end,
    smallpox_credits = {
		{
			text = "By: candycanearter",
            color = G.C.BLUE
		},
	},
}

local ccfs = create_card_for_shop
function create_card_for_shop(area)
    if G.GAME.SPOX_OROINIT then 
        local cyclic = SMODS.create_card { key = "j_smallpox_ins_oro", area = area, key_append = "spox_oro" }
        cyclic.ability.extra.mult = G.GAME.SPOX_OROINIT
        G.GAME.SPOX_OROINIT = nil

        create_shop_card_ui(cyclic, 'Joker', area)
        cyclic.states.visible = false

        G.E_MANAGER:add_event(Event({
            delay = 0.4,
            trigger = 'after',
            func = function()
                cyclic:start_materialize()
                return true
            end
        }))

        return cyclic
    end

    return ccfs(area)
end
