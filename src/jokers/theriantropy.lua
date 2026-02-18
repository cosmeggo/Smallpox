SMODS.Atlas({
    key = "theriantropy", 
    path = "jokers/Theriantropy.png", 
    px = 71,
    py = 95,
    atlas_table = "ASSET_ATLAS"
})
SMODS.Joker {
    key = "theriantropy",
    atlas = 'theriantropy',
    pos = { x = 0, y = 0 },
    rarity = 1,
    cost = 5,
    pools = {["Smallpox"] = true}, 
    blueprint_compat = false, 
    discovered = false,
    unlocked = true,
    pronouns = "she_they", 
    config = {extra = {chance = 2, chance2 = 15, edition = 'm_wild'}},
	loc_vars = function(self, info_queue, card)
        info_queue[#info_queue + 1] = G.P_CENTERS.m_wild
        local a, b = SMODS.get_probability_vars(card, 1, card.ability.extra.chance)
        local ab, c = SMODS.get_probability_vars(card, 1, card.ability.extra.chance2)
        return {vars = {a, b, card.ability.extra.edition}}
    end,
    calculate = function(self, card, context)
        if context.individual and context.cardarea == G.play and context.other_card:is_face() and SMODS.pseudorandom_probability(card, 'smallpox_therian', 1, card.ability.extra.chance) and not context.blueprint then
            local scored_card = context.other_card
            G.E_MANAGER:add_event(Event({
                func = function()                
                    scored_card:set_ability(G.P_CENTERS.m_wild)
                    return true            
                end
            }))
            SMODS.calculate_effect({ message = "Run wild", colour = G.C.BLUE},
            context.blueprint_card or card)
        end
        if context.individual and context.cardarea == G.play and context.other_card:is_face() and SMODS.pseudorandom_probability(card, 'smallpox_therian', 1, card.ability.extra.chance2) and not context.blueprint then
            card.getting_sliced = true
            SMODS.add_card({ set = 'Spectral', key = 'c_cryptid'})
            G.E_MANAGER:add_event(Event({
                func = function()
                    card:start_dissolve({G.C.RED}, nil, 1.6)
                    return true
                end
            }))
            SMODS.calculate_effect({ message = "We'll meet again", colour = G.C.BLUE},
            context.blueprint_card or card)
            return true            
        end
    end
}