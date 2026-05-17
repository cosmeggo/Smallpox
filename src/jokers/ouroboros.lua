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
    eternal_compat = false, -- a bit antithetical to the entire design tbh
    discovered = false,
    unlocked = true,
    config = { extra = { mult_gain = 0.2 }, },
    pronouns = "any_all", -- see comment at top

    loc_vars = function(self, info_queue, card)
        return { vars = { G.GAME.SPOX_OROINIT or 1, card.ability.extra.mult_gain } }
    end,
    set_ability = function(self, card)
        G.GAME.SPOX_OROINIT = G.GAME.SPOX_OROINIT or 1
        G.GAME.SPOX_OROSHINY = G.GAME.SPOX_OROSHINY or {}
    end,
    add_to_deck = function(self, card, from_debuff)
        if not from_debuff then
            card:set_cost()
        end
    end,
    calculate = function(self, card, context)
        if context.joker_main then
            return {
                xmult = G.GAME.SPOX_OROINIT or 1
            }
        end

        if (context.selling_self or context.joker_type_destroyed and context.card == card) and not context.blueprint then
            G.GAME.SPOX_OROINIT = G.GAME.SPOX_OROINIT + card.ability.extra.mult_gain
            table.insert(G.GAME.SPOX_OROSHINY, card.edition or "base")
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
    if G.GAME.SPOX_OROSHINY and #G.GAME.SPOX_OROSHINY > 0 then
        local cyclic = SMODS.create_card { key = "j_smallpox_ins_oro", area = area, key_append = "spox_oro" }
        -- dear god ruby what are you doing
        if cyclic.config.center.key ~= "j_smallpox_ins_oro"  then
            return cyclic
        end

        local edit = table.remove(G.GAME.SPOX_OROSHINY) or "base"
        if edit ~= "base" then cyclic:set_edition(edit) end

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

local set_cost_ref = Card.set_cost
function Card:set_cost(...)
    local ret = set_cost_ref(self, ...)
    if (self.config.center.key == "j_smallpox_ins_oro") then
		self.sell_cost = 2
	end
    return ret
end
