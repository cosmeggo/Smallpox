SMODS.Atlas({
    key = "SPOXBoosters", 
    path = "CustomBoosters.png", 
    px = 71,
    py = 95,
    atlas_table = "ASSET_ATLAS"
})




-- Buffoon Packs -----------------------------------------------------------------------------------------
SMODS.Booster {
    key = "SPOXPack1",
    loc_txt= {
        name = 'SPOX Booster Pack',
        text = { "Pick {C:attention}#1#{} card out",
                "{C:attention}#2#{} of SPOX's jokers!", },
        group_name = {"Pick a card,"},
    },
    weight = 0.6,
    kind = 'SPOXPack',
    cost = 4,
    atlas = "SPOXBoosters",
    pos = { x = 0, y = 0 },
    config = { extra = 3, choose = 1 },

    loc_vars = function(self, info_queue, card)
        local cfg = (card and card.ability) or self.config
        return {
            vars = { cfg.choose, cfg.extra },
           
        }
    end,

    ease_background_colour = function(self) ease_background_colour{new_colour = HEX('C2F4A4'), special_colour = HEX('A4C2F4'), contrast = 5} end,
    create_card = function(self, card, i)
        
        return { set = "Smallpox", area = G.pack_cards, skip_materialize = true, soulable = true}
    end,
}

SMODS.Booster {
    key = "SPOXPack2",
    loc_txt= {
        name = ' SPOX Booster Pack',
        text = { "Pick {C:attention}#1#{} card out",
                "{C:attention}#2#{} of SPOX's jokers!", },
        group_name = {"Any Card,"},
    },
    weight = 0.6,
    kind = 'SPOXPack',
    cost = 6,
    atlas = "SPOXBoosters",
    pos = { x = 1, y = 0 },
    config = { extra = 3, choose = 1 },

    
    loc_vars = function(self, info_queue, card)
        local cfg = (card and card.ability) or self.config
        return {
            vars = { cfg.choose, cfg.extra },
           
        }
    end,
    
    ease_background_colour = function(self) ease_background_colour{new_colour = HEX('C2F4A4'), special_colour = HEX('A4C2F4'), contrast = 5} end,

    create_card = function(self, card, i)
        
        return { set = "Smallpox", area = G.pack_cards, skip_materialize = true, soulable = true}
    end,
}

SMODS.Booster {
    key = "SPOXPack3",
    loc_txt= {
        name = 'Jumbo SPOX Booster Pack',
        text = { "Pick {C:attention}#1#{} card out",
                "{C:attention}#2#{} of SPOX's jokers!", },
        group_name = {"Oh aaaaaaaaaaaaaaaaaa"},
    },
    weight = 0.15,
    kind = 'SPOXPack',
    cost = 8,
    atlas = "SPOXBoosters",
    pos = { x = 2, y = 0 },
    config = { extra = 4, choose = 1 },


    
    loc_vars = function(self, info_queue, card)
        local cfg = (card and card.ability) or self.config
        return {
            vars = { cfg.choose, cfg.extra },
           
        }
    end,

    ease_background_colour = function(self) ease_background_colour{G.C.DARK_EDITION,G.C.UI.TEXT_INACTIVE, contrast = 5} end,
    
    create_card = function(self, card, i)
        
        return { set = "Smallpox", area = G.pack_cards, skip_materialize = true, soulable = true}
    end,
}

