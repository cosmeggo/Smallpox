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
    discovered = false,
    atlas = 'Inky',
    pools = {["Smallpox"] = true},
    calculate = function(self, card, context)
        --from cryptid
        if context.selling_self then
            local card = create_card("Food", G.jokers, nil, nil, nil, nil, nil)
            card:add_to_deck()
            card:start_materialize()
            G.jokers:emplace(card)
            play_sound('generic1', 0.9 + math.random()*0.1, 0.8)
        end
    end,
    smallpox_credits = {
		{
			text = {
                "By: Inky",
                "Code: SLDTyp0"
            },
			color = G.C.GREEN
		},
	},
}