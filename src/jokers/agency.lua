SMODS.Atlas({
    key = "agency", 
    path = "jokers/Agency.png", 
    px = 71,
    py = 95,
    atlas_table = "ASSET_ATLAS"
})

SMODS.Joker {
    key = "agency",
    atlas = 'agency',
    pos = { x = 0, y = 0 },
    rarity = 1,
    cost = 5,
    pools = {["Smallpox"] = true},
    blueprint_compat = true,
    discovered = true,
    unlocked = true,
    config = { extra = { mult = 3, mult_gain = 3, restore = 3, threes = 0 }, },
    loc_vars = function(self, info_queue, card)
        return { vars = { card.ability.extra.mult, card.ability.extra.mult_gain, card.ability.extra.restore } }
    end,
    
    calculate = function(self, card, context)
        if context.press_play and not context.blueprint then
            if SMODS.find_card("j_smallpox_agency")[1] == card then
                -- Roll 6D4 here
                local rolls = {0, 0, 0, 0, 0, 0}
                local text = ""
                for i = 1, 6 do
                    rolls[i] = pseudorandom("agency_roll_"..i, 1, 4)
                    if rolls[i] == 3 then
                        card.ability.extra.threes = card.ability.extra.threes + 1
                    end
                end

                -- Sort so that 3s are before other values
                local function sorty(a, b)
                    if a == 3 and b ~= 3 then return true 
                    elseif b == 3 and a ~= 3 then return false 
                    end
                    return a < b 
                end
                table.sort(rolls, sorty)
                for i = 1, 6 do
                    text = text..rolls[i]..(i < 6 and ", " or "")
                end

                -- Texty text
                G.E_MANAGER:add_event(Event({
                    trigger = 'before',
                    func = function()
                        attention_text({
                            text = text, scale = 0.7, hold = 2, colour = HEX("ca202f"),
                            align = 'cm', major = G.play, offset = {x = 0, y = -3.5}, pop_in_rate = 9,
                        })
                        delay(1)
                        play_sound('generic1')
                        -- card.ability.extra.threes = 3 -- Uncomment for guaranteed Triscendence
                        if card.ability.extra.threes == 3 then
                            G.E_MANAGER:add_event(Event({
                                func = function()
                                    -- TRISCENDENCE
                                    G.SETTINGS.paused = true
                                    G.FUNCS.overlay_menu{
                                        definition = create_UIBox_smallpox_triscendence(),
                                    }
                                return true
                                end
                            }))
                        end
                    return true
                    end
                }))
            end
        end

        if context.joker_main then
            card.ability.extra.threes = SMODS.find_card("j_smallpox_agency")[1].ability.extra.threes
            local threes = card.ability.extra.threes
            return {
                mult = card.ability.extra.mult * threes
            }
        end

        if context.after then
            card.ability.extra.threes = 0
        end
    end,
    smallpox_credits = {
		{
			text = {
                "By: Mysthaps",
                "Art: Inky",
            },
			color = G.C.RED
		},
	},
}
