SMODS.Atlas({
    key = "susie", 
    path = "jokers/susie.png", 
    px = 71,
    py = 95,
    atlas_table = "ASSET_ATLAS"
})

-- Susie
SMODS.Joker {
    key = "susie",
    pos = { x = 0, y = 0 },
    rarity = 2,
    blueprint_compat = true,
    cost = 6,
    discovered = true,
    config = { extra = { chips = 86 }, },
    atlas = 'susie',

    pools = { ["Smallpox"] = true, ["Metallic"] = true },
    pronouns = "she_her",

    loc_vars = function(self, info_queue, card)
        info_queue[#info_queue + 1] = G.P_CENTERS.m_steel
        return { vars = { card.ability.extra.chips } }
    end,
    
    calculate = function(self, card, context)
        if context.before and not context.blueprint then
            local triggered = false
            for _, v in pairs(context.scoring_hand) do
                if v:get_id() == 8 or v:get_id() == 6 then
                    triggered = true
                    v:set_ability("m_steel", nil, true)
                    G.E_MANAGER:add_event(Event({
                        func = function()
                            v:juice_up()
                            return true
                        end
                    }))
                end
            end
            if triggered then
                return {
                    message = localize("k_steel"),
                    colour = G.C.UI.TEXT_INACTIVE
                }
            end
        end

        if context.individual and context.cardarea == G.play and SMODS.has_enhancement(context.other_card, "m_steel") then
            return {
                chips = card.ability.extra.chips
            }
        end
    end,
    smallpox_credits = {
		{
			text = {
                "By: MetaNite64",
                "Art: Plasma"
            },
            color = HEX('000000')
		},
	},
}


