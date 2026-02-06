-- Showman Deck
SMODS.Back {
    key = 'showman',
    pos = { x = 0, y = 0 },
    config = {},
    
    unlocked = false,
    discovered = true,
    no_collection = false,

    atlas = 'CustomDecks',
    locked_loc_vars = function(self, info_queue, back)
        return { vars = { 4 } }
    end,

    check_for_unlock = function (self, args)
    return #SMODS.find_card("j_ring_master") >= 2
    end
}

local smods_showman_ref = SMODS.showman
function SMODS.showman(card_key)
    if G.GAME and G.GAME.selected_back and G.GAME.selected_back.effect.center.key == 'b_smallpox_showman' then 
        return true 
        end
    return smods_showman_ref(card_key)
end