SMODS.Atlas({
    key = "Inky", 
    path = "jokers/inky.png", 
    px = 71,
    py = 95,
    atlas_table = "ASSET_ATLAS"
})


SMODS.Joker {
    key = "Inky",
    pos = { x = 0, y = 0 },
    rarity = 2,
    blueprint_compat = false,
    cost = 5,
    discovered = true,
    atlas = 'Inky',
    pools = {["Smallpox"] = true},

    
    
    remove_from_deck = function(self, card, from_debuff)
        --from cryptid
        local card = create_card("Food", G.jokers, nil, nil, nil, nil, nil)
        card:add_to_deck()
        card:start_materialize()
        G.jokers:emplace(card)
        play_sound('generic1', 0.9 + math.random()*0.1, 0.8)
    end
}