SMODS.Atlas({
    key = "fableofthemirrorbreaker", 
    path = "jokers/fableofthemirrorbreaker.png", 
    px = 71,
    py = 95,
    atlas_table = "ASSET_ATLAS"
})

SMODS.Joker {
    key = "fableofthemirrorbreaker",
    atlas = 'fableofthemirrorbreaker',
    pos = { x = 0, y = 0 },
    rarity = 3,
    cost = 10,
    pools = {["Smallpox"] = true},
    blueprint_compat = true,
    discovered = true,
    unlocked = true,
    config = { extra = { progress = 0 }, },
    loc_vars = function(self, info_queue, card)
        if card.ability.extra.progress == 3 then
            return { vars = { colours = { HEX "ff6868" } }, key = "j_smallpox_fableofthemirrorbreaker_back" }
        end
        local active_col = G.C.IMPORTANT
        local inactive_col = G.C.TEXT_DARK

        info_queue[#info_queue + 1] = G.P_CENTERS.j_joker

        return { vars = { colours = {
            HEX "ff6868",
            (card.ability.extra.progress == 1) and active_col or inactive_col,
            (card.ability.extra.progress == 2) and active_col or inactive_col,
            (card.ability.extra.progress == 3) and active_col or inactive_col,
        } } }
    end,
    
    calculate = function(self, card, context)
		if context.retrigger_joker_check and not context.retrigger_joker and context.other_card ~= card 
            and card.ability.extra.progress == 3 then
            retrigger_card = nil
            for i = 1, #G.jokers.cards do
                if G.jokers.cards[i] == card then
                    retrigger_card = G.jokers.cards[i + 1]
                    break
                end
            end
            if retrigger_card == context.other_card then
                return {
                    message = localize('k_again_ex'),
                    repetitions = 1,
                    card = card
                }
            end
		end
        if context.end_of_round and context.main_eval and card.ability.extra.progress < 3 then
            card.ability.extra.progress = card.ability.extra.progress + 1

            if card.ability.extra.progress == 2 then
                SMODS.change_discard_limit(2)
            end

            if card.ability.extra.progress == 3 then
                SMODS.change_discard_limit(-2)
                G.E_MANAGER:add_event(Event({
                    trigger = 'after',
                    delay = 0.15,
                    func = function()
                        card:flip()
                        play_sound('card1', 1.15)
                        card:juice_up(0.3, 0.3)
                        return true
                    end
                }))
                delay(0.2)
                G.E_MANAGER:add_event(Event({
                    trigger = 'after',
                    delay = 0.1,
                    func = function()
                        card.children.center:set_sprite_pos({ x = 1, y = 0 })
                        return true
                    end
                }))
                local percent = 0.85
                G.E_MANAGER:add_event(Event({
                    trigger = 'after',
                    delay = 0.15,
                    func = function()
                        card:flip()
                        play_sound('tarot2', 0.85, 0.75)
                        card:juice_up(0.3, 0.3)
                        return true
                    end
                }))
            end
        end
    end,

    add_to_deck = function(self, card, from_debuff)
        if card.ability.extra.progress == 0 then
            card.ability.extra.progress = 1
            local other_card = SMODS.add_card {
                key = "j_joker",
                set = "Joker",
            }
            other_card.ability.smallpox_fable_sticker = true
        end
        if card.ability.extra.progress == 2 then
            SMODS.change_discard_limit(2)
        end
    end,

    remove_from_deck = function(self, card, from_debuff)
        if card.ability.extra.progress == 2 then
            SMODS.change_discard_limit(-2)
        end
    end,
}

SMODS.Sticker {
    key = "fable_sticker",
    atlas = 'fableofthemirrorbreaker',
    badge_colour = G.C.GOLD,
    pos = { x = 2, y = 0 },
    rate = 0,
    no_collection = true,
    apply = function(self, card, val)
        card.ability[self.key] = val
    end,
    calculate = function(self, card, context)
        if context.post_trigger and context.other_card == card then
            return {
                dollars = 1
            }
        end
    end
}