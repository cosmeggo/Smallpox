SMODS.Atlas({
    key = "Inky", 
    path = "jokers/inky.png", 
    px = 71,
    py = 95,
    atlas_table = "ASSET_ATLAS"
})

--taken from cryptid
-- Pool used by Food Jokers
SMODS.ObjectType({
	key = "Food",
	default = "j_reserved_parking",
	cards = {},
	inject = function(self)
		SMODS.ObjectType.inject(self)
		-- insert base game food jokers
		self:inject_card(G.P_CENTERS.j_gros_michel)
		self:inject_card(G.P_CENTERS.j_egg)
		self:inject_card(G.P_CENTERS.j_ice_cream)
		self:inject_card(G.P_CENTERS.j_cavendish)
		self:inject_card(G.P_CENTERS.j_turtle_bean)
		self:inject_card(G.P_CENTERS.j_diet_cola)
		self:inject_card(G.P_CENTERS.j_popcorn)
		self:inject_card(G.P_CENTERS.j_ramen)
		self:inject_card(G.P_CENTERS.j_selzer)
	end,
})

SMODS.Joker {
    key = "Inky",
    pos = { x = 0, y = 0 },
    rarity = 2,
    blueprint_compat = false,
    cost = 5,
    discovered = true,
    config = { extra = { mult = 5 }, },
    atlas = 'Inky',

    
    
    remove_from_deck = function(self, card, from_debuff)
        --from cryptid
        local card = create_card("Food", G.jokers, nil, nil, nil, nil, nil)
        card:add_to_deck()
        card:start_materialize()
        G.jokers:emplace(card)
        play_sound('generic1', 0.9 + math.random()*0.1, 0.8)
    end
}