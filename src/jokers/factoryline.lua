SMODS.Atlas({
    key = "factory_line", 
    path = "jokers/factory_line.png", 
    px = 71,
    py = 95,
    atlas_table = "ASSET_ATLAS"
})

--[[
Example Joker
CardPronouns prons: "she_her", "he_him", "they_them", "any_all", "it_its", "she_they", "he_they"
Pools must always have ["Smallpox"] = true, for other pools, check src/pools.lua if it exists already, if not, WARN the Helpers!
please set cost according to rarity
+-----+------------+----------+
|  #  |  Rarity    |  Cost    |
|-----+------------+----------+
|  1  |  Common    |  $3-5    |
|  2  |  Uncommon  |  $5-8    |
|  3  |  Rare      |  $8-10   |
|  4  |  Legendary |  $15-20  |
+-----+------------+----------+
]]

loc_colour()
G.ARGS.LOC_COLOURS.lily_pink = SMODS.Gradient {
    key = "lilypink",
    colours = {
        HEX("FC9FFF"),
        HEX("FF78E8"),
        HEX("F5CCFF"),
    },
    interpolation = "trig",
    cycle = 6, 
}
SMODS.Joker {
    key = "factory_line",
    atlas = 'factory_line',
    pos = { x = 0, y = 0 },
    rarity = 2,
    cost = 8,
    pools = {["Smallpox"] = true, ["Metallic"] = true}, -- see comment at the top
    blueprint_compat = false, -- set to false if you dont want blueprint to copy
    discovered = false,
    unlocked = true,
    config = { extra = { counter = 0, requirement = 9, increment = 1 }, },
    pronouns = "it_its",
    loc_vars = function(self, info_queue, card)
        return { vars = { card.ability.extra.requirement, card.ability.extra.counter, card.ability.extra.increment } }
    end,
    
    calculate = function(self, card, context)
        if context.end_of_round and context.main_eval then
            for _,joker in pairs(card.area.cards) do
                if joker ~= card then
                    SMODS.scale_card(card, {ref_table = card.ability.extra, ref_value = "counter", scalar_value = "increment", no_message = true})
                    SMODS.calculate_effect({message = localize("k_upgrade_ex")}, joker)
                end
            end
            if card.ability.extra.counter > card.ability.extra.requirement then
                card.ability.extra.counter = card.ability.extra.counter - card.ability.extra.requirement
                if #G.jokers.cards < G.jokers.config.card_limit then
                    SMODS.add_card({set = "Joker", rarity = "Rare"})
                    SMODS.calculate_effect({message = localize("k_reset")}, card)
                else
                    SMODS.calculate_effect({message = localize("k_nope_ex")}, card)
                end
            end
        end
    end,
    smallpox_credits = {
		{
			text = "By: Lily Felli",
			color = G.ARGS.LOC_COLOURS.lily_pink
		},
	},
}

--[[
hi its lily im just gonna yap here for a bit because nobody will ever read this
im having a pretyt good day right now but   oh fuck i just realized i have to code for someone
i dont want to do that but i have to so thats fun i guess
cynthia i love you
meeow??
The universe isn't simulated. It is real. The universe isn't simulated. It is real. The universe isn't simulated. It is real. The universe isn't simulated. It is real. The universe isn't simulated. It is real. The universe isn't simulated. It is real. The universe isn't simulated. It is real. The universe isn't simulated. It is real. The universe isn't simulated. It is real. The universe isn't simulated. It is real. The universe isn't simulated. It is real. The universe isn't simulated. It is real. The universe isn't simulated. It is real. The universe isn't simulated. It is real. The universe isn't simulated. It is real. The universe isn't simulated. It is real. 
]]