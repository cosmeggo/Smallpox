SMODS.Atlas({
    key = "chair",
    path = "jokers/cloudzXIII_chair.png",
    px = 71,
    py = 95,
    atlas_table = "ASSET_ATLAS"
})

SMODS.Joker {
    key = "antique_chair",

    loc_vars = function(self, info_queue, card)
        return {
            vars = {
                card.ability.extra.x_mult,
                card.ability.extra.Xmult_gain
            }
        }
    end,

    pools = { ["Smallpox"] = true },
    blueprint_compat = true,
    rarity = 2,
    cost = 5,
    atlas = 'chair',
    pos = { x = 0, y = 0 },
    discovered = false,
    config = { extra = { x_mult = 1, Xmult_gain = 0.5 } },
    pronouns = "it_its",

    set_sprites = function(self, card, front)
        G.E_MANAGER:add_event(Event({
            blockable = false,
            func = function()
                if not card.canvas_text then
                    card.canvas_text = SMODS.CanvasSprite {
                        canvasW = 71, canvasH = 95,
                        text_offset = { x = 55, y = 15 },
                        text_colour = G.C.MONEY,
                        text_width = 15,
                        text_height = 10,
                        ref_table = G.GAME,
                        ref_value = "xiii_chair_cost",
                    }
                end
                return true
            end
        }))
    end,

    calculate = function(self, card, context)
        if context.joker_main then
            return {
                x_mult = card.ability.extra.x_mult
            }
        end
    end,

    smallpox_credits = {
        {
            text = "By: cloudzXIII",
            color = G.C.GOLD
        },
    },
}

local setcost = Card.set_cost
function Card:set_cost()
    setcost(self)
    if self.config.center.key == 'j_smallpox_antique_chair' then
        self.cost = self.cost + (G.GAME.xiii_swap_count or 0)
        G.GAME.xiii_chair_cost = "$" .. self.cost
    end
end

-- borrowed the acquire function from Bunco (thank you)
local function xiii_acquire(acquired_card)
    acquired_card.area:remove_card(acquired_card)
    acquired_card:add_to_deck()
    if acquired_card.children.price then acquired_card.children.price:remove() end
    acquired_card.children.price = nil
    if acquired_card.children.buy_button then acquired_card.children.buy_button:remove() end
    acquired_card.children.buy_button = nil
    remove_nils(acquired_card.children)
    if acquired_card.ability.set == 'Default' or acquired_card.ability.set == 'Enhanced' then
        inc_career_stat('c_playing_cards_bought', 1)
        G.playing_card = (G.playing_card and G.playing_card + 1) or 1
        G.deck:emplace(acquired_card)
        acquired_card.playing_card = G.playing_card
        playing_card_joker_effects({ acquired_card })
        table.insert(G.playing_cards, acquired_card)
    else
        if acquired_card.ability.consumeable then
            G.consumeables:emplace(acquired_card)
        else
            G.jokers:emplace(acquired_card)
        end
        G.E_MANAGER:add_event(Event({
            func = function()
                acquired_card:calculate_joker({ buying_card = true, card = acquired_card })
                return true
            end
        }))
    end
    G.GAME.round_scores.cards_purchased.amt = G.GAME.round_scores.cards_purchased.amt + 1
    if acquired_card.ability.consumeable then
        if acquired_card.config.center.set == 'Planet' then
            inc_career_stat('c_planets_bought', 1)
        elseif acquired_card.config.center.set == 'Tarot' then
            inc_career_stat('c_tarots_bought', 1)
        end
    elseif acquired_card.ability.set == 'Joker' then
        G.GAME.current_round.jokers_purchased = G.GAME.current_round.jokers_purchased + 1
    end
end

--#region CHAIR BUTTON UI
local function xiii_chair_UIButton(card)
    return UIBox {
        definition = {
            n = G.UIT.ROOT,
            config = {
                colour = G.C.CLEAR
            },
            nodes = {
                {
                    n = G.UIT.C,
                    config = { ref_table = card, align = "cl", maxw = 1.25, padding = 0.1, r = 0.08, minw = 1.25, minh = 1, hover = true, shadow = true, colour = G.C.UI.BACKGROUND_INACTIVE, button = 'xiii_chair_button_click', func = 'xiii_chair_button_func' },
                    nodes = {
                        { n = G.UIT.B, config = { w = 0.1, h = 0.6 } },
                        { n = G.UIT.T, config = { text = "SWAP ", colour = G.C.UI.TEXT_LIGHT, scale = 0.65, shadow = true } }
                    }
                }
            }
        },
        config = {
            align = 'cl',
            major = card,
            parent = card,
            offset = { x = 0.2, y = 0 }
        }
    }
end

G.FUNCS.xiii_chair_button_click = function(e)
    local card = e.config and e.config.ref_table
    local shop_card = G.shop_jokers.highlighted[1]

    if shop_card.ability.consumeable and not (#G.consumeables.cards < G.consumeables.config.card_limit) then
        alert_no_space(card, G.consumeables)
        return
    end

    xiii_acquire(shop_card)

    SMODS.scale_card(card, {
        ref_table = card.ability.extra,
        ref_value = "x_mult",
        scalar_value = "Xmult_gain",
        operation = '+',
    })

    G.GAME.xiii_swap_count = (G.GAME.xiii_swap_count or 0) + 1
    card:set_cost()
    card.area:remove_card(card)
    G.shop_jokers:emplace(card)

    -- add buy/sell button
    create_shop_card_ui(card)
end

G.FUNCS.xiii_chair_button_func = function(e)
    local can_use = G.STATE == G.STATES.SHOP and G.shop_jokers and #G.shop_jokers.highlighted == 1 and G.shop_jokers.highlighted[1].config.center.key ~= "j_smallpox_antique_chair"

    e.config.colour = can_use and G.C.RED or G.C.UI.BACKGROUND_INACTIVE
    e.config.button = can_use and 'xiii_chair_button_click' or nil
end

SMODS.DrawStep {
    key = 'chair_button',
    order = -30,
    func = function(card, layer)
        if card.children.smallpox_chair_button then
            card.children.smallpox_chair_button:draw()
        end
    end
}

SMODS.draw_ignore_keys.smallpox_chair_button = true

local highlight_ref = Card.highlight
function Card.highlight(self, is_highlighted)
    if is_highlighted and self.config.center.key == "j_smallpox_antique_chair" and self.area == G.jokers then
        self.children.smallpox_chair_button = xiii_chair_UIButton(self)
    elseif self.children.smallpox_chair_button then
        self.children.smallpox_chair_button:remove()
        self.children.smallpox_chair_button = nil
    end

    return highlight_ref(self, is_highlighted)
end

--#endregion
