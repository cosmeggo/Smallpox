SMODS.Atlas({
    key = "ruby_birthright", 
    path = "jokers/ruby_birthright.png", 
    px = 71,
    py = 95,
})

SMODS.Atlas({
    key = "ruby_birthright_glitched", 
    path = "glitched_sheet.png", 
    px = 71,
    py = 95,
})

SMODS.Atlas({
    key = "ruby_planets", 
    path = "ruby_planets.png", 
    px = 34,
    py = 34,
})
function SPOX.get_selected_deck()
    if G.STATE == G.STATES.MENU then
        return
    end
    local ret = G.GAME.selected_back and G.GAME.selected_back.effect and G.GAME.selected_back.effect and G.GAME.selected_back.effect.center.key
	if ret == "b_challenge" or string.match(ret, ".*_.*_.*") then ret = "b_erratic" end --lol
	return ret
end

SMODS.Joker {
    key = "birthright",
    pos = {x=0,y=0},
    atlas = "ruby_birthright",
    rarity = 3,
    cost = 10,
    pools = {["Smallpox"] = true},
    discovered = true,
    unlocked = true,
    config = {
        blue_csl = 3,
        black_dollars = 15,
        zodiac_set = nil
    },
    blueprint_compat = true,
    smallpox_credits = {
		{
			text = "By: Ruby",
            color = G.C.RED,
		},
	},
    loc_vars = function(self, q, card)
        local key = SPOX.get_selected_deck() and SPOX.get_selected_deck():sub(3, 999) or nil
        local vars = {}
        if key == "erratic" then
            card.ability.erratic_lines = SPOX.randomize_desc(card.ability.erratic_lines)
        end
        if key == "zodiac" and card.ability.zodiac_set then
            key = key.."_"..card.ability.zodiac_set
        end
        if key == "checkered" then
            if G.GAME.birthright_checkered_suit then
                vars = {
                    localize(G.GAME.birthright_checkered_suit, "suits_plural"),
                    colours = {
                        G.C.SUITS[G.GAME.birthright_checkered_suit]
                    }
                }
            else    
                vars = {
                    "[SUIT]",
                    colours = {
                        G.C.ORANGE
                    }
                }
            end
        end
        if key == "anaglyph" then
            q[#q+1] = {set = "Edition", key = "e_negative_tag", config = {extra = 1}}
        end
        if key == "magic" then  
            q[#q+1] = G.P_CENTERS.c_fool
            q[#q+1] = G.P_CENTERS.b_arcana_pack_normal_1
        end
        if key == "black" then
            q[#q+1] = G.P_CENTERS.e_negative
            q[#q+1] = {set = "Other", key = "eternal"}
            vars = {
                card.ability.black_dollars
            }
        end
        if key == "blue" then
            vars = {card.ability.blue_csl}
        end
        return {
            vars = vars,
            key = key and "j_smallpox_birthright_"..key or nil
        }
    end,
    add_to_deck = function(self, card)
        if SPOX.get_selected_deck() == "b_blue" then    
            SMODS.change_play_limit(card.ability.blue_csl)
        end
        if SPOX.get_selected_deck() == "b_black" and not card.ability.black_added then
            card.ability.black_added = true
            local card = SMODS.add_card {set = "Joker"}
            card.ability.eternal = true
            card:set_edition("e_negative")
        end
        if SPOX.get_selected_deck() == "b_plasma" then
            SMODS.set_scoring_calculation("smallpox_plasma_birthright")
            G.GAME.old_operator = "smallpox_plasma_birthright"
        end
        if SPOX.get_selected_deck() == "b_erratic" then
            local _, ind = pseudorandom_element(SPOX.erratic.effects)
            local _, ind2 = pseudorandom_element(SPOX.erratic.conditions)
            card.ability.erratic_effect = ind
            card.ability.erratic_condition = ind2 
        end
    end,
    set_sprites = function(self, card)
        if SPOX.get_selected_deck() == "b_erratic" then
            if card.ability then
                card.ability.erratic_pos = card.ability.erratic_pos or {x=math.floor(math.random()*9),y=math.floor(math.random()*15)}
                card.children.center.atlas = G.ASSET_ATLAS["smallpox_ruby_birthright_glitched"]
                card.children.center:set_sprite_pos(card.ability.erratic_pos)
                card.children.center:reset()
            end
            G.E_MANAGER:add_event(Event{
                func = function()
                    card.ability.erratic_pos = card.ability.erratic_pos or {x=math.floor(math.random()*9),y=math.floor(math.random()*15)}
                    card.children.center.atlas = G.ASSET_ATLAS["smallpox_ruby_birthright_glitched"]
                    card.children.center:set_sprite_pos(card.ability.erratic_pos)
                    card.children.center:reset()
                    return true
                end
            })
        end
    end,
    remove_from_deck = function(self, card)
        if SPOX.get_selected_deck() == "b_blue" then    
            SMODS.change_play_limit(-card.ability.blue_csl)
        end
        if SPOX.get_selected_deck() == "b_plasma" and #SMODS.find_card("j_smallpox_birthright") == 0 then
            SMODS.set_scoring_calculation("multiply")
            G.GAME.old_operator = nil
        end
    end,
    calculate = function(self, card, context)
        if card.ability.erratic_condition then
            if SPOX.erratic.conditions[card.ability.erratic_condition](self, card, context) then 
                return SPOX.erratic.effects[card.ability.erratic_effect](self, card, context) end
        end
        if context.repetition then
            if context.cardarea == G.play then
                if SPOX.get_selected_deck() == "b_blue" then    
                    local ind = 0
                    for i, v in pairs(G.play.cards) do
                        if v == context.other_card then ind = i; break end
                    end
                    if ind > 4 then
                        return {
                            repetitions = 1
                        }
                    end
                end
                if SPOX.get_selected_deck() == "b_zodiac" and card.ability.zodiac_set == "Tarot" and context.other_card.config.center.set ~= "Default" then
                    return {
                        repetitions = 1
                    }
                end
            end
        end
        if context.using_consumeable then
            if SPOX.get_selected_deck() == "b_nebula" and context.consumeable.config.center.set == "Planet"
                and context.consumeable.ability.hand_type
            then
                local t = context.consumeable.ability.hand_type
                return {
                    func = function()
                        add_planet(t)
                    end
                }
            end
            if SPOX.get_selected_deck() == "b_checkered" and context.consumeable.config.center.set == "Tarot"
                and context.consumeable.ability.suit_conv
            then
                G.GAME.birthright_checkered_suit = context.consumeable.ability.suit_conv
                return {
                    message = localize("k_switch_ex"),
                    colour = G.C.SUITS[G.GAME.birthright_checkered_suit]
                }
            end
            if SPOX.get_selected_deck() == "b_zodiac" and
                (
                    context.consumeable.config.center.set == "Tarot"
                    or context.consumeable.config.center.set == "Spectral"
                    or context.consumeable.config.center.set == "Planet"
                )
            then
                card.ability.zodiac_set = context.consumeable.config.center.set
                SPOX.birthright_zodiac(context.consumeable.config.center.set)
            end
        end
        if context.joker_main then
            if SPOX.get_selected_deck() == "b_zodiac" and card.ability.zodiac_set == "Planet" then
                local c = G.GAME.hands[context.scoring_name].chips
                local m = G.GAME.hands[context.scoring_name].mult
                return {
                    chips = c,
                    mult = m
                }
            end
        end
        if context.before then
            if SPOX.get_selected_deck() == "b_zodiac" and card.ability.zodiac_set == "Spectral" and #G.play.cards == 2 then
                local card = pseudorandom_element(G.play.cards, pseudoseed("birthright_zodiac_spectral"))
                return {
                    func = function()
                        card:set_edition(SMODS.poll_edition({guaranteed = true, no_negative = true}))
                    end
                }
            end
        end
        if context.individual and context.cardarea == G.hand and SPOX.get_selected_deck() == "b_painted" and not context.end_of_round then
            context.cardarea = G.play
            context.main_scoring = true
            local eval, post = eval_card(context.other_card, context)
            context.cardarea = G.hand
            context.main_scoring = nil
            eval = eval or {}
            local effects = {eval}
            SMODS.calculate_context({individual = true, other_card=context.other_card, cardarea = G.play, scoring_hand = context.scoring_hand})
            for _,v in ipairs(post or {}) do effects[#effects+1] = v end
            SMODS.trigger_effects(effects, context.other_card)
            SMODS.calculate_effect({message = localize("k_again_ex"), card = card})
            SMODS.trigger_effects(effects, context.other_card)
            SMODS.calculate_context({individual = true, other_card=context.other_card, cardarea = G.play, scoring_hand = context.scoring_hand})
        end
    end,
    br_usebutton = function()
        local d = SPOX.get_selected_deck()
        return d == "b_yellow" or d == "b_black" or d == "b_abandoned"
    end,
    brcan_use = function(self, card)
        local d = SPOX.get_selected_deck()
        if d == "b_yellow" then return true end
        if d == "b_black" then
            local cards = {}
            for i, v in pairs(G.jokers.cards) do
                if v.edition and v.edition.negative and v ~= card and v.highlighted then
                    cards[#cards+1] = v
                end
            end
            return #cards > 0 and (G.GAME.dollars + (G.GAME.bankrupt_at or 0)) >= card.ability.black_dollars
        end
        if d == "b_abandoned" then
            return not G.GAME.birthright_cant_cardshop
        end
    end,
    bruse = function(self, card)
        local d = SPOX.get_selected_deck()
        if d == "b_yellow" then
            G.FUNCS.overlay_menu {
                definition = create_UIBox_stocks()
            }
        end
        if d == "b_abandoned" then
            G.FUNCS.overlay_menu {
                definition = create_UIBox_card_shop()
            }
        end
        if d == "b_black" then
            local cards = {}
            for i, v in pairs(G.jokers.cards) do
                if v.edition and v.edition.negative and v ~= card and v.highlighted then
                    cards[#cards+1] = v
                end
            end
            SPOX.flip_then(cards, function(c)
                local _pool, _pool_key = get_current_pool("Joker", c.config.center.rarity, c.config.center.rarity == 4, "birthright_black")
                local center = pseudorandom_element(_pool, pseudoseed(_pool_key))
                local it = 1
                while center == 'UNAVAILABLE' do
                    it = it + 1
                    center = pseudorandom_element(_pool, pseudoseed(_pool_key..'_resample'..it))
                end

                center = G.P_CENTERS[center]
                c:set_ability(center)
            end)
            ease_dollars(-card.ability.black_dollars)
        end
    end
}


local G_UIDEF_use_and_sell_buttons_ref = G.UIDEF.use_and_sell_buttons
function G.UIDEF.use_and_sell_buttons(card)
	local abc = G_UIDEF_use_and_sell_buttons_ref(card)
    if (card.area == G.jokers and G.jokers and card.config.center.bruse and card.config.center:br_usebutton(card)) and not card.debuff and card.config.center.set == "Joker" then
        sell = {n=G.UIT.C, config={align = "cr"}, nodes={
            {n=G.UIT.C, config={ref_table = card, align = "cr",padding = 0.1, r=0.08, minw = 1.25, hover = true, shadow = true, colour = G.C.UI.BACKGROUND_INACTIVE, one_press = true, button = 'sell_card', func = 'can_sell_card', handy_insta_action = 'sell'}, nodes={
              {n=G.UIT.B, config = {w=0.1,h=0.6}},
              {n=G.UIT.C, config={align = "tm"}, nodes={
                {n=G.UIT.R, config={align = "cm", maxw = 1.25}, nodes={
                  {n=G.UIT.T, config={text = localize('b_sell'),colour = G.C.UI.TEXT_LIGHT, scale = 0.4, shadow = true}}
                }},
                {n=G.UIT.R, config={align = "cm"}, nodes={
                  {n=G.UIT.T, config={text = localize('$'),colour = G.C.WHITE, scale = 0.4, shadow = true}},
                  {n=G.UIT.T, config={ref_table = card, ref_value = 'sell_cost_label',colour = G.C.WHITE, scale = 0.55, shadow = true}}
                }}
              }}
            }},
        }}
        transition = {n=G.UIT.C, config={align = "cr"}, nodes={
            {n=G.UIT.C, config={ref_table = card, align = "cm",padding = 0.1, r=0.08, minw = 1.25, hover = true, shadow = true, colour = G.C.UI.BACKGROUND_INACTIVE, button = 'use_birthright', func = 'can_use_birthright', handy_insta_action = 'use'}, nodes={
              {n=G.UIT.B, config = {w=0.1,h=0.3}},
              {n=G.UIT.C, config={align = "tm"}, nodes={
                {n=G.UIT.R, config={align = "cm", maxw = 1.25}, nodes={
                  {n=G.UIT.T, config={text = localize(card.config.center.use_key or "b_use"),colour = G.C.UI.TEXT_LIGHT, scale = 0.4, shadow = true}}
                }},
              }}
            }},
        }}
        return {
            n=G.UIT.ROOT, config = {padding = 0, colour = G.C.CLEAR}, nodes={
              {n=G.UIT.C, config={padding = 0, align = 'cl'}, nodes={
                {n=G.UIT.R, config={align = 'cl'}, nodes={
                  sell
                }},
                {n=G.UIT.R, config={align = 'cl'}, nodes={
                  transition
                }},
            }},
        }}
    end
    return abc
end

G.FUNCS.can_use_birthright = function(e)
    local center = e.config.ref_table.config.center
    if
        center.brcan_use and center:brcan_use(e.config.ref_table) and not e.config.ref_table.debuff
        and G.STATE ~= G.STATES.HAND_PLAYED and G.STATE ~= G.STATES.DRAW_TO_HAND and G.STATE ~= G.STATES.PLAY_TAROT
        and not (((G.play and #G.play.cards > 0) or (G.CONTROLLER.locked) or (G.GAME.STOP_USE and G.GAME.STOP_USE > 0)))
    then
        e.config.colour = G.C.RED
        e.config.button = "use_birthright"
    else
        e.config.colour = G.C.UI.BACKGROUND_INACTIVE
        e.config.button = nil
    end
end
G.FUNCS.use_birthright = function(e)
    local int = G.TAROT_INTERRUPT
    G.TAROT_INTERRUPT = true
    local center = e.config.ref_table.config.center
    if center.bruse then
        center:bruse(e.config.ref_table)
    end
    e.config.ref_table:juice_up()
    G.TAROT_INTERRUPT = int
end

function G.UIDEF.stocks(stock_values)
    local hist_height, hist_width = 6, (5/30) *math.max(1, #stock_values-30)
  stock_values = stock_values or {
    1, 20, 2, 4, 23, 2, 1
  }
  local score_hist, max_stock_hist = {}, 0
  for k, v in ipairs(stock_values) do if max_stock_hist < v then max_stock_hist = v end end
  for k = math.max(1, #stock_values-30), #stock_values do 
    local inc = stock_values[k] > (stock_values[k-1] or -99999) and G.C.GREEN or G.C.RED
    score_hist[#score_hist+1] =  {n=G.UIT.C, config={align = 'bm'}, nodes ={{n=G.UIT.C, config={colour = inc, minw = hist_width/math.max(1, #stock_values-30), minh = (stock_values[k])/max_stock_hist*hist_height}}}}
  end

  return {n=G.UIT.R, config={align = "cl"}, nodes=score_hist}
end

function _G.create_UIBox_stocks()
    G.GAME.smallpox_invest_amt = G.GAME.smallpox_invest_amt or 0
    G.GAME.smallpox_invested = G.GAME.smallpox_invested or 0
    G.GAME.smallpox_stocks = G.GAME.smallpox_stocks or {1}
    local ratio = G.GAME.smallpox_stocks[#G.GAME.smallpox_stocks-1] and (G.GAME.smallpox_stocks[#G.GAME.smallpox_stocks]-G.GAME.smallpox_stocks[#G.GAME.smallpox_stocks-1])/G.GAME.smallpox_stocks[#G.GAME.smallpox_stocks-1] or 0
    return create_UIBox_generic_options({
        contents = {
            G.UIDEF.stocks(G.GAME.smallpox_stocks),
            {n=G.UIT.R, config={align = "cr"}, nodes={
                {n=G.UIT.C, config={align = "cm", padding = 0.1}, nodes={
                    {n=G.UIT.R,config={align = "cm", minw = 1.3, minh = 1.3, r=0.15,colour = G.C.ORANGE,shadow = true}, nodes = {
                        {n=G.UIT.R, config={align = "cm", padding = 0.07}, nodes={
                        {n=G.UIT.R, config={align = "cm", maxw = 1.3}, nodes={
                            {n=G.UIT.T, config={text = localize("k_last_change"), scale = 0.4, colour = G.C.WHITE, shadow = true}}
                        }},
                        {n=G.UIT.R, config={align = "cm", maxw = 1.3}, nodes={
                            {n=G.UIT.T, config={text = number_format(ratio*100).."%", scale = 0.4, colour = G.C.WHITE, shadow = true}}
                        }}   
                        }},              
                    }},
                }},
                {n=G.UIT.C, config={align = "cm", padding = 0.1}, nodes={
                    {n=G.UIT.R,config={func = "can_sell_all_stocks", button = 'toggle_shop', align = "cm", minw = 1.3, minh = 1.3, r=0.15,colour = G.C.RED,shadow = true}, nodes = {
                        {n=G.UIT.R, config={align = "cm", padding = 0.07}, nodes={
                            {n=G.UIT.R, config={align = "cm", maxw = 1.3}, nodes={
                                {n=G.UIT.T, config={text = localize("k_sell_all"), scale = 0.4, colour = G.C.WHITE, shadow = true}}
                            }}, 
                            {n=G.UIT.R, config={align = "cm", maxw = 1.3}, nodes={
                                {n=G.UIT.T, config={text = "("..localize("$"), scale = 0.4, colour = G.C.WHITE, shadow = true}},
                                {n=G.UIT.T, config={ref_value = "smallpox_invested", ref_table = G.GAME, scale = 0.4, colour = G.C.WHITE, shadow = true}},
                                {n=G.UIT.T, config={text = ")", scale = 0.4, colour = G.C.WHITE, shadow = true}},
                            }}, 
                        }},              
                    }},
                }},
                {n=G.UIT.C, config={align = "cm", padding = 0.1}, nodes={
                    {n=G.UIT.R,config={func = "can_buy_stocks", button = 'toggle_shop', align = "cm", minw = 1.3, minh = 1.3, r=0.15,colour = G.C.GREEN,shadow = true}, nodes = {
                        {n=G.UIT.R, config={align = "cm", padding = 0.07}, nodes={
                            {n=G.UIT.R, config={align = "cm", maxw = 1.3}, nodes={
                                {n=G.UIT.T, config={text = localize("k_buy"), scale = 0.4, colour = G.C.WHITE, shadow = true}}
                            }},
                            {n=G.UIT.R, config={align = "cm", maxw = 1.3}, nodes={
                                {n=G.UIT.T, config={text = "("..localize("$"), scale = 0.4, colour = G.C.WHITE, shadow = true}},
                                {n=G.UIT.T, config={ref_value = "smallpox_invest_amt", ref_table = G.GAME, scale = 0.4, colour = G.C.WHITE, shadow = true}},
                                {n=G.UIT.T, config={text = ")", scale = 0.4, colour = G.C.WHITE, shadow = true}},
                            }},
                        }},              
                    }},
                }},
                {n=G.UIT.C, config={align = "cm", padding = 0.1}, nodes={
                    {n=G.UIT.R,config={id = 'next_round_button', align = "cm", minw = 0.4, minh = 1.3, r=0.15,colour = {0,0,0,0}, shadow = true}, nodes = {
                        {n=G.UIT.R, config={align = "cm", padding = 0.07}, nodes={
                        {n=G.UIT.R, config={func = "can_increase_perc", button = 'toggle_shop', align = "cm",  minw = 0.4, minh = 1, r=0.15,colour = {0,0,0,0}, shadow = true, colour = G.C.GREEN}, nodes={
                            {n=G.UIT.T, config={text = "^", scale = 0.4, colour = G.C.WHITE, shadow = true}}
                        }}, 
                        {n=G.UIT.R, config={func = "can_decrease_perc", button = 'toggle_shop', align = "cm", minw = 0.4, minh = 1, r=0.15,colour = {0,0,0,0}, shadow = true, colour = G.C.RED}, nodes={
                            {n=G.UIT.T, config={text = "v", scale = 0.4, colour = G.C.WHITE, shadow = true}}
                        }}   
                        }},              
                    }},
                }},
                {n=G.UIT.C, config={align = "cm", padding = 0.1}, nodes={
                    {n=G.UIT.R, config={align = "cm", padding = 0.07}, nodes={
                        {n=G.UIT.R, config={align = "cm", maxw = 1.3}, nodes={
                            {n=G.UIT.T, config={text = localize("k_currently_invested"), scale = 0.4, colour = G.C.WHITE, shadow = true}}
                        }},
                        {n=G.UIT.R, config={align = "cm", maxw = 1.3}, nodes={
                            {n=G.UIT.T, config={text = localize("$"), scale = 0.4, colour = G.C.WHITE, shadow = true}},
                            {n=G.UIT.T, config={ref_value = "smallpox_invested", ref_table = G.GAME, scale = 0.4, colour = G.C.WHITE, shadow = true}},
                        }}   
                    }},    
                }}
            }}
        }
    })
end

G.FUNCS.can_sell_all_stocks = function(e)
    if
        G.GAME.smallpox_invested and G.GAME.smallpox_invested > 0 
    then
        e.config.colour = G.C.RED
        e.config.button = "sell_all_stocks"
    else
        e.config.colour = G.C.UI.BACKGROUND_INACTIVE
        e.config.button = nil
    end
end

G.FUNCS.can_buy_stocks = function(e)
    if
        G.GAME.dollars + G.GAME.bankrupt_at >= G.GAME.smallpox_invest_amt and G.GAME.smallpox_invest_amt > 0
    then
        e.config.colour = G.C.GREEN
        e.config.button = "buy_stocks"
    else
        e.config.colour = G.C.UI.BACKGROUND_INACTIVE
        e.config.button = nil
    end
end

G.FUNCS.can_increase_perc = function(e)
    e.config.colour = G.C.GREEN
    e.config.button = "increase_perc"
end
G.FUNCS.can_decrease_perc = function(e)
    if
        G.GAME.smallpox_invest_amt and G.GAME.smallpox_invest_amt > 0
    then
        e.config.colour = G.C.RED
        e.config.button = "decrease_perc"
    else
        e.config.colour = G.C.UI.BACKGROUND_INACTIVE
        e.config.button = nil
    end
end

function G.FUNCS.sell_all_stocks()
    ease_dollars(G.GAME.smallpox_invested)
    G.GAME.smallpox_invested = 0
end
function G.FUNCS.buy_stocks()
    ease_dollars(-G.GAME.smallpox_invest_amt)
    G.GAME.smallpox_invested = (G.GAME.smallpox_invested or 0) + G.GAME.smallpox_invest_amt
end
function G.FUNCS.decrease_perc() G.GAME.smallpox_invest_amt = G.GAME.smallpox_invest_amt - 5 end
function G.FUNCS.increase_perc() G.GAME.smallpox_invest_amt = G.GAME.smallpox_invest_amt + 5 end

function G.FUNCS.progress_stocks()
    local mult_max = 1.4
    local mult_min = 1/1.325
    if #G.GAME.smallpox_stocks == 1 then
        G.GAME.smallpox_stocks = {G.GAME.smallpox_invested} 
    end
    local mul = (pseudorandom("smallpox_stocks") * (mult_max - mult_min) + mult_min)
    G.GAME.smallpox_invested = math.floor(G.GAME.smallpox_invested * mul * 100) / 100
    G.GAME.smallpox_stocks[#G.GAME.smallpox_stocks+1] = G.GAME.smallpox_stocks[#G.GAME.smallpox_stocks]*mul
end

function alert_no_space_tag()
  G.CONTROLLER.locks.no_space = true
  attention_text({
      scale = 0.9, text = localize('k_no_space_ex'), hold = 0.9, align = 'cm',
      cover = G.GAME.tags[#G.GAME.tags].HUD_tag, cover_padding = 0.1, cover_colour = adjust_alpha(G.C.BLACK, 0.7)
  })
  for i = 1, #G.GAME.tags do
    G.GAME.tags[i]:juice_up(0.15)
  end
  G.E_MANAGER:add_event(Event({trigger = 'after', delay = 0.06*G.SETTINGS.GAMESPEED, blockable = false, blocking = false, func = function()
    play_sound('tarot2', 0.76, 0.4);return true end}))
    play_sound('tarot2', 1, 0.4)

    G.E_MANAGER:add_event(Event({trigger = 'after', delay = 0.5*G.SETTINGS.GAMESPEED, blockable = false, blocking = false,
    func = function()
      G.CONTROLLER.locks.no_space = nil
    return true end}))
end

function SPOX.negative_tags()
    local t = 0
    for i, v in pairs(G.GAME.tags) do
        if v.ability.negative then t = t + 1 end
    end
    return t
end

function SPOX.any_doubles()
    for i, v in pairs(G.GAME.tags) do
        if v.key == "tag_double" then return true end
    end
end

local add_tag_ref = add_tag
function add_tag(tag, ...)
    if next(SMODS.find_card("j_smallpox_birthright")) and SPOX.get_selected_deck() == "b_anaglyph" and #G.GAME.tags >= (10 + SPOX.negative_tags()) and not tag.ability.negative and not SPOX.any_doubles() then
        alert_no_space_tag()
    else
        G.GAME.smallpox_tags = (G.GAME.smallpox_tags or 0) + 1
        G.GAME.smallpox_tag_limit = G.GAME.smallpox_tag_limit or 10
        if tag.ability.negative then
            G.GAME.smallpox_tag_limit = G.GAME.smallpox_tag_limit + 1
        end
        return add_tag_ref(tag, ...)
    end
end

SMODS.Tag:take_ownership("double", {
    apply = function(self, tag, context)
        if context.type == 'tag_add' and context.tag.key ~= 'tag_double' then
            local lock = tag.ID
            G.CONTROLLER.locks[lock] = true
            tag:yep('+', G.C.BLUE, function()
                if context.tag.ability and context.tag.ability.orbital_hand then
                    G.orbital_hand = context.tag.ability.orbital_hand
                end
                add_tag(Tag(context.tag.key))
                if next(SMODS.find_card("j_smallpox_birthright")) and SPOX.get_selected_deck() == "b_anaglyph" then
                    local t2 = Tag(context.tag.key)
                    t2.ability.negative = true
                    add_tag(t2)
                end
                G.orbital_hand = nil
                G.CONTROLLER.locks[lock] = nil
                return true
            end)
            tag.triggered = true
        end
    end
}, true)

-- stolen from entropy
function SPOX.flip_then(cardlist, func, before, after)
    if not SPOX.should_skip_animations() then
        for i, v in ipairs(cardlist) do
            local card = cardlist[i]
            if card then
                G.E_MANAGER:add_event(
                    Event(
                        {
                            trigger = "after",
                            delay = 0.4,
                            func = function()
                                if before then
                                    before(card)
                                end
                                if card.flip then
                                    card:flip()
                                end
                                return true
                            end
                        }
                    )
                )
            end
        end
    else
        if before then
            before(card)
        end
    end
    for i, v in ipairs(cardlist) do
        local card = cardlist[i]
        if card then
            if type(func) ~= "table" then
                func = {{func = func, delay = 0.5}}
            end
            for i, v in pairs(func) do
                G.E_MANAGER:add_event(
                    Event(
                        {
                            trigger = "after",
                            delay = v.delay,
                            func = function()
                                v.func(card, cardlist, i)
                                return true
                            end
                        }
                    )
                )
            end
        end
    end
    if not SPOX.should_skip_animations() then
        for i, v in ipairs(cardlist) do
            local card = cardlist[i]
            if card then
                G.E_MANAGER:add_event(
                    Event(
                        {
                            trigger = "after",
                            delay = 0.4,
                            func = function()
                                if card.flip then
                                    card:flip()
                                end
                                if after then
                                    after(card)
                                end
                                return true
                            end
                        }
                    )
                )
            end
        end
    else    
        if after then
            after(card)
        end
    end
end

function SPOX.should_skip_animations(strict)
    if Talisman and Talisman.config_file.disable_anims then return true end
    if Handy and Handy.animation_skip.get_value() >= (strict and 4 or 3) then return true end
end

SMODS.Booster:take_ownership_by_kind("Arcana", {
    create_card = function(self, card, i)
        local _card
        if next(SMODS.find_card("j_smallpox_birthright")) and SPOX.get_selected_deck() == "b_magic" and i == 1 then
            _card = {
                set = "Tarot",
                area = G.pack_cards,
                skip_materialize = true,
                soulable = true,
                key = "c_fool",
                key_append = "pl1"
            }
        else
            _card = {
                set = "Tarot",
                area = G.pack_cards,
                skip_materialize = true,
                soulable = true,
                key_append = "pl1"
            }
        end
        return _card
    end
}, true)

SMODS.Consumable:take_ownership("c_fool", {
	no_collection = true,
    can_use = function(self, card)
        return (#G.consumeables.cards < G.consumeables.config.card_limit or card.area == G.consumeables) and
            G.GAME.last_tarot_planet and
            (G.GAME.last_tarot_planet ~= 'c_fool' or (next(SMODS.find_card("j_smallpox_birthright")) and SPOX.get_selected_deck() == "b_magic"))
    end ,
    use = function(self, card, area, copier)
        G.E_MANAGER:add_event(Event({
            trigger = 'after',
            delay = 0.4,
            func = function()
                if G.consumeables.config.card_limit > #G.consumeables.cards then
                    play_sound('timpani')
                    local key = G.GAME.last_tarot_planet
                    local set
                    if G.GAME.last_tarot_planet == 'c_fool' and next(SMODS.find_card("j_smallpox_birthright")) and SPOX.get_selected_deck() == "b_magic" then
                        key = nil
                        set = "Spectral"
                    end
                    SMODS.add_card({ key = key, set = set })
                    card:juice_up(0.3, 0.5)
                end
                return true
            end
        }))
        delay(0.6)
    end,
})

SPOX.planet_tags = {
    {consumable = "pluto", pos = {x=0,y=0}, hand = "High Card"},
    {consumable = "mercury", pos = {x=1,y=0}, hand = "Pair"},
    {consumable = "venus", pos = {x=2,y=0}, hand = "Three of a Kind"},
    {consumable = "earth", pos = {x=3,y=0}, hand = "Full House"},
    {consumable = "mars", pos = {x=4,y=0}, hand = "Four of a Kind"},
    {consumable = "jupiter", pos = {x=5,y=0}, hand = "Flush"},
    {consumable = "saturn", pos = {x=6,y=0}, hand = "Straight"},
    {consumable = "uranus", pos = {x=7,y=0}, hand = "Two Pair"},
    {consumable = "neptune", pos = {x=8,y=0}, hand = "Straight Flush"},
    {consumable = "planet_x", pos = {x=9,y=0}, hand = "Five of a Kind"},
    {consumable = "ceres", pos = {x=10,y=0}, hand = "Flush House"},
    {consumable = "eris", pos = {x=11,y=0}, hand = "Flush Five"},
}

function add_planet(key, tag)
    local _tag = key and Tag("tag_orbital") or tag
    if key then
        _tag.ability.birthright_planet = key
    end
    G.HUD_planets = G.HUD_planets or {}
    local tag_sprite_ui, tag_sprite = _tag:generate_UI()
    G.HUD_planets[#G.HUD_planets+1] = UIBox{
        definition = {n=G.UIT.ROOT, config={align = "tm", padding = 0.05, colour = G.C.CLEAR}, nodes={
          tag_sprite_ui
        }},
        config = {
          align = G.HUD_planets[1] and 'bm' or 'tri',
          offset = G.HUD_planets[1] and {x=0,y=0} or {x=_tag.ability.count and _tag.ability.count > 1 and 1.25 or 1,y=0},
          major = G.HUD_planets[1] and G.HUD_planets[#G.HUD_planets] or G.ROOM_ATTACH}
    }
    _tag.HUD_tag = G.HUD_planets[#G.HUD_planets]
    if #G.HUD_planets > 6 then
		for i = 2, #G.HUD_planets do
			G.HUD_planets[i].config.offset.y = -0.9 + 0.9 * (6 / #G.HUD_planets)
		end
	end
    G.planets = G.planets or {}
    G.planets[#G.planets+1] = _tag 
end

--fine, ill do it like this
SMODS.Tag:take_ownership("orbital", {
    apply = function(self, tag, context)
        if tag.ability.birthright_planet then
            if context.type == 'ante_end' then
                tag:yep('+', G.C.RED, function() 
                    tag:planet_remove()
                return true end)
                tag.triggered = true
            end
            if context.type == 'after_hand' then
                mult = mod_mult(mult + 2 * G.GAME.hands[ tag.ability.birthright_planet].l_mult)
                hand_chips = mod_chips(hand_chips + 2 * G.GAME.hands[tag.ability.birthright_planet].l_chips)
                tag_area_status_text(tag, "+"..number_format(2 * G.GAME.hands[tag.ability.birthright_planet].l_mult)..", +"..number_format(2 * G.GAME.hands[tag.ability.birthright_planet].l_chips), G.C.PURPLE, false, 0)
            end
        else
            if context.type == 'immediate' then
                local lock = tag.ID
                G.CONTROLLER.locks[lock] = true
                SMODS.upgrade_poker_hands({ from = tag, hands = { tag.ability.orbital_hand }, level_up = tag.config.levels })
                tag:yep('+', G.C.MONEY, function()
                    G.CONTROLLER.locks[lock] = nil
                    return true
                end)
                tag.triggered = true
                return true
            end
        end
    end,
    loc_vars = function(self, q, tag)
        if tag.ability.birthright_planet then
            return {
                vars = {
                    2 * G.GAME.hands[tag.ability.birthright_planet].l_mult,
                    2 * G.GAME.hands[tag.ability.birthright_planet].l_chips
                },
                key = "tag_smallpox_ruby_"..tag.ability.birthright_planet
            }
        else    
            return {
                vars = {
                    (tag.ability.orbital_hand == '[' .. localize('k_poker_hand') .. ']') and tag.ability.orbital_hand or
                    localize(tag.ability.orbital_hand, 'poker_hands'), tag.config.levels }
            }
        end
    end
}, true)

function tag_area_status_text(tag, text, colour, silent, delay, scale)
    percent = percent or (0.9 + 0.2*math.random())
    local delay = delay or 0.6
    G.E_MANAGER:add_event(Event({
    trigger = (delay==0 and 'immediate' or 'before'),
    delay = delay,
    func = function()
        attention_text({
            text = text,
            scale = scale or 1, 
            hold = 0.45,
            backdrop_colour = colour,
            align = 'cl',
            offset = {x=-0.7,y=0},
            major = tag.HUD_tag
        })
        if not silent then 
            play_sound('generic1', 0.8+percent*0.2, 1)
        end
      return true
    end
    }))
end


function Tag:planet_remove()
    self:remove_from_game()
    local HUD_tag_key = nil
    for k, v in pairs(G.HUD_planets) do
        if v == self.HUD_tag then HUD_tag_key = k end
    end

    if HUD_tag_key then 
        if G.HUD_planets and G.HUD_planets[HUD_tag_key+1] then
            if HUD_tag_key == 1 then
                G.HUD_planets[HUD_tag_key+1]:set_alignment({type = 'tri',
                offset = {x=1,y=0},
                xy_bond = 'Weak',
                major = G.ROOM_ATTACH})
            else
                G.HUD_planets[HUD_tag_key+1]:set_role({
                xy_bond = 'Weak',
                major = G.HUD_planets[HUD_tag_key-1]})
            end
        end
        table.remove(G.HUD_planets, HUD_tag_key)
    end
    self.HUD_tag:remove()

    if #G.HUD_planets >= 6 then
		for i = 2, #G.HUD_planets do
			G.HUD_planets[i].config.offset.y = -0.9 + 0.9 * 6 / #G.HUD_planets
		end
	end
end

local is_suit_ref = Card.is_suit
function Card:is_suit(suit, ...)
    return is_suit_ref(self, next(SMODS.find_card("j_smallpox_birthright")) and G.GAME.birthright_checkered_suit or suit, ...)
end

SMODS.Scoring_Calculation {
    key = "plasma_birthright",
    func = function(self, chips, mult, flames) return chips ^ 2 end,
    text = '^'
} 

local mod_mult_ref = mod_mult
function mod_mult(m,...)
    if not (SPOX.get_selected_deck() == "b_plasma" and next(SMODS.find_card("j_smallpox_birthright"))) then
        return mod_mult_ref(m, ...)
    else    
        return 2
    end
end

local scie = SMODS.calculate_individual_effect
function SMODS.calculate_individual_effect(effect, scored_card, key, amount, from_edition)
    if SPOX.get_selected_deck() == "b_plasma" and next(SMODS.find_card("j_smallpox_birthright")) then
        --hacky solution
        --probably want a whitelist of effects in the future
        --but should work fine if everyone uses standard capitalisation
        key = key:gsub("mult_mod", "chip_mod")
        key = key:gsub("mult", "chips")
    end
    local ret
    ret = scie(effect, scored_card, key, amount, from_edition)
    if ret then
        return ret
    end
end

local parse_highlighted_ref = CardArea.parse_highlighted
function CardArea:parse_highlighted(...)
    local ret = parse_highlighted_ref(self, ...)
    if SPOX.get_selected_deck() == "b_plasma" and next(SMODS.find_card("j_smallpox_birthright")) then
        SMODS.Scoring_Parameters.mult.current = 2
        update_hand_text({immediate = true, nopulse = true, delay = 0}, {mult = 2})
    end
    return ret
end

local update_hand_text_ref = update_hand_text
function update_hand_text(_, vals, ...)
    if vals and vals.mult and SPOX.get_selected_deck() == "b_plasma" and next(SMODS.find_card("j_smallpox_birthright")) then
        vals.mult = 2
    end
    return update_hand_text_ref(_, vals, ...)
end

function sprite_attention_text(args)
    local a = {}
    for i, v in pairs(args) do a[i] = v end
    args = args or {}
    args.text = args.text or 'test'
    args.scale = args.scale or 1
    args.colour = SMODS.shallow_copy(args.colour or G.C.WHITE)
    args.hold = (args.hold or 0) + 0.1*(G.SPEEDFACTOR)
    args.pos = args.pos or {x = 0, y = 0}
    args.align = args.align or 'cm'
    args.emboss = args.emboss or nil

    args.fade = 1

    if args.cover then
      args.cover_colour = SMODS.shallow_copy(args.cover_colour or G.C.RED)
      args.cover_colour_l = SMODS.shallow_copy(lighten(args.cover_colour, 0.2))
      args.cover_colour_d = SMODS.shallow_copy(darken(args.cover_colour, 0.2))
    else
      args.cover_colour = copy_table(G.C.CLEAR)
    end

    args.uibox_config = {
      align = args.align or 'cm',
      offset = args.offset or {x=0,y=0}, 
      major = args.cover or args.major or nil,
    }
    G.E_MANAGER:add_event(Event({
      trigger = 'after',
      delay = 0,
      blockable = false,
      blocking = false,
      func = function()
        local sprite
            if args.atlas then
                sprite = SMODS.create_sprite(args.X, args.Y, args.W, args.H, args.atlas, args.spos or {x = 0, y = 0})
            end
          args.AT = UIBox{
            T = {args.pos.x + args.X,args.pos.y + args.Y,0,0},
            definition = 
              {n=G.UIT.ROOT, config = {
                align = args.cover_align or 'cm', minw = (args.cover and args.cover.T.w or 0.001) + (args.cover_padding or 0), 
                minh = (args.cover and args.cover.T.h or 0.001) + (args.cover_padding or 0), padding = 0.03, r = 0.1, 
                emboss = args.emboss, colour = args.cover_colour}, nodes={
                sprite and {n=G.UIT.O, config={draw_layer = 1, object = sprite}} or nil,
              }}, 
            config = args.uibox_config
          }
          args.AT.attention_text = true

          args.sprite = args.AT.UIRoot.children[1].config.object
          --args.text:pulse(0.5)
          return true
      end
      }))

      G.E_MANAGER:add_event(Event({
        trigger = 'after',
        delay = args.hold,
        blockable = false,
        blocking = false,
        func = function()
          if not args.start_time then
            args.start_time = G.TIMERS.TOTAL
            --args.text:pop_out(3)
          else
            --args.AT:align_to_attach()
            args.fade = math.max(0, 1 - 3*(G.TIMERS.TOTAL - args.start_time))
            if args.cover_colour then args.cover_colour[4] = math.min(args.cover_colour[4], 2*args.fade) end
            if args.cover_colour_l then args.cover_colour_l[4] = math.min(args.cover_colour_l[4], args.fade) end
            if args.cover_colour_d then args.cover_colour_d[4] = math.min(args.cover_colour_d[4], args.fade) end
            if args.backdrop_colour then args.backdrop_colour[4] = math.min(args.backdrop_colour[4], args.fade) end
            args.colour[4] = math.min(args.colour[4], args.fade)
            if args.fade <= 0 then
              args.AT:remove()
              return true
            end
          end
        end
      }))
      attention_text(a)
  end

SMODS.Atlas {
    key = 'zodiac_runes',
    path = 'zodiac_runes.png',
    px = 75,
    py = 75,
    atlas_table = 'ANIMATION_ATLAS',
    frames = 16,
    fps = 14
}

function SPOX.birthright_zodiac(set)
    play_sound("smallpox_birthright_zodiac_attune", 8)
    sprite_attention_text({
        scale = 1,
        text = set,
        hold = 4 * G.SETTINGS.GAMESPEED / 4,
        align = "cm",
        offset = { x = 0, y = -2.7 },
        major = G.play,
        atlas = "smallpox_zodiac_runes",
        X = 0, Y = 0, W = 6, H = 6,
        spos = ({
            Planet = {x=0,y=0},
            Spectral = {x=0,y=1},
            Tarot = {x=0,y=2}
        })[set] or {x=0,y=0}
    })
end

function SPOX.randomize_desc(lines)
    local slines = lines or {}
    if not lines then
        local controls = {}
        math.randomseed(os.time())
        local lines = math.floor(math.random()*3) + 1
        local i = 1
        while i <= lines do
            local str = ""
            local segments = math.floor(math.random()*4) + 2
            for j = 1, segments do
                local randomset = pseudorandom_element(G.localization.descriptions, pseudoseed("birthright_erratic"))
                local random_entry = pseudorandom_element(randomset, pseudoseed("birthright_erratic")).text_parsed
                while #random_entry == 0 do
                    randomset = pseudorandom_element(G.localization.descriptions, pseudoseed("birthright_erratic"))
                    random_entry = pseudorandom_element(randomset, pseudoseed("birthright_erratic")).text_parsed
                end
                local segment = pseudorandom_element(random_entry, pseudoseed("birthright_erratic"))
                while not segment do
                    segment = pseudorandom_element(random_entry, pseudoseed("birthright_erratic"))
                end
                if segment then

                    while not segment.strings do
                        segment = pseudorandom_element(segment, pseudoseed("birthright_erratic"))
                    end
                    local fragment = pseudorandom_element(segment.strings, pseudorandom("birthright_erratic"))
                    while type(fragment) ~= "string" do
                        fragment = pseudorandom_element(fragment, pseudoseed("birthright_erratic"))
                    end
                    local control, key = pseudorandom_element(segment.control, pseudorandom("birthright_erratic"))
                    if control and key ~= "V" then
                        controls[#controls+1] = "{"..key..":"..control.."}"
                    elseif math.random() < 0.05 then
                        controls[#controls+1] = "{}"
                    end
                    if string.len(str)+string.len(fragment) > 20 and lines < 8 then
                        if math.random() < 0.5 then
                            lines = lines + 1
                        end
                        if math.random() < 0.2 then
                            if type(fragment) == "string" then
                                str = str..fragment.." "
                            end
                        end
                    else
                        if type(fragment) == "string" then
                            str = str..fragment.." "
                        end
                    end
                end
            end
            slines[#slines+1] = str
            i = i + 1
        end
        for i, v in pairs(slines) do
            for j = 1, string.len(v) do
                if math.random() < 0.75 then
                    local ctr = pseudorandom_element(controls, pseudoseed("birthright_erratic"))
                    if ctr then
                        slines[i] = v:insert(ctr, math.floor(math.random()*string.len(v)))
                    end
                end
            end
        end
    end
    local center = G.localization.descriptions.Joker.j_smallpox_birthright_erratic
    center.text = slines
    center.text_parsed = {}
    if not center.text then else
        for _, line in ipairs(center.text) do
            if type(line) == 'table' then
                center.text_parsed[#center.text_parsed+1] = {}
                for _, new_line in ipairs(line) do
                    center.text_parsed[#center.text_parsed][#center.text_parsed[#center.text_parsed]+1] = loc_parse_string(new_line)
                end
            else
                center.text_parsed[#center.text_parsed+1] = loc_parse_string(line)
            end
        end
    end
    return slines
end

function string.insert(str1, str2, pos)
    return str1:sub(1,pos)..str2..str1:sub(pos+1)
end

function string.split(inputstr, sep)
  if sep == nil then
    sep = "%s"
  end
  local t = {}
  for str in string.gmatch(inputstr, "([^"..sep.."]+)") do
    table.insert(t, str)
  end
  return t
end

SPOX.erratic = {
    effects = {
        function(self, card, context) return {mult = 8} end,
        function(self, card, context) return {chips = 80} end,
        function(self, card, context) return {xmult = 2} end,
        function(self, card, context) if context.repetition or context.retrigger_joker_check then return {repetitions = 2} end end,
        function(self, card, context)
            local my_pos = nil
            for i = 1, #G.jokers.cards do
                if G.jokers.cards[i] == card then
                    my_pos = i
                    break
                end
            end
            if my_pos and G.jokers.cards[my_pos + 1] and not SMODS.is_eternal(G.jokers.cards[my_pos + 1], card) and not G.jokers.cards[my_pos + 1].getting_sliced then
                local sliced_card = G.jokers.cards[my_pos + 1]
                sliced_card.getting_sliced = true -- Make sure to do this on destruction effects
                G.GAME.joker_buffer = G.GAME.joker_buffer - 1
                G.E_MANAGER:add_event(Event({
                    func = function()
                        G.GAME.joker_buffer = 0
                        -- See note about SMODS Scaling Manipulation on the wiki
                        card:juice_up(0.8, 0.8)
                        sliced_card:start_dissolve({ HEX("57ecab") }, nil, 1.6)
                        play_sound('slice1', 0.96 + math.random() * 0.08)
                        return true
                    end
                }))
            end
        end,
        function(self, card, context) return {chips = G.GAME.current_round.discards_left * 30} end,
        function(self, card, context) if G.GAME.current_round.discards_left == 0 then return {mult = 30} end end,
        function(self, card, context) 
            local stone_card = SMODS.add_card { set = "Base", enhancement = "m_stone", area = G.deck }
            return {
                message = localize('k_plus_stone'),
                colour = G.C.SECONDARY_SET.Enhanced,
                func = function()
                    SMODS.calculate_context({ playing_card_added = true, cards = { stone_card } })
                end
            }
        end,
        function(self, card, context) SMODS.add_card{set = "Tarot"} end,
        function(self, card, context) SMODS.add_card{set = "Planet"} end,
        function(self, card, context) SMODS.add_card{set = "Spectral"} end,
        function(self, card, context) return {mult = pseudorandom("birthright_erratic_mult")*20} end,
        function(self, card, context) return {chips = pseudorandom("birthright_erratic_chips")*90} end,
        function(self, card, context) return {xmult = pseudorandom("birthright_erratic_xmult")*4} end,
        function(self, card, context)
            local temp_Mult, temp_ID = 15, 15
            local raised_card = nil
            for i = 1, #G.hand.cards do
                if temp_ID >= G.hand.cards[i].base.id and not SMODS.has_no_rank(G.hand.cards[i]) then
                    temp_Mult = G.hand.cards[i].base.nominal
                    temp_ID = G.hand.cards[i].base.id
                    raised_card = G.hand.cards[i]
                end
            end
            if raised_card == context.other_card then
                if context.other_card.debuff then
                    return {
                        message = localize('k_debuffed'),
                        colour = G.C.RED
                    }
                else
                    return {
                        mult = 2 * temp_Mult
                    }
                end
            end
        end,
        function(self, card, context)
            local steel_tally = 0
            for _, playing_card in ipairs(G.playing_cards) do
                if SMODS.has_enhancement(playing_card, 'm_steel') then steel_tally = steel_tally + 1 end
            end
            return {
                Xmult = 1 + 0.2 * steel_tally,
            }
        end,
        function(self, card, context)
            if SMODS.pseudorandom_probability(card, 'erratic_cavendish', 1, 10) then
                SMODS.destroy_cards(card, nil, nil, true)
                return {
                    xmult = 2,
                    message = localize('k_extinct_ex')
                }
            else
                return {
                    xmult = 2,
                    message = localize('k_safe_ex')
                }
            end
        end,
        function(self, card, context) return {mult = 6, chips = 30} end,
        function(self, card, context) return {dollars = 3} end,
        function(self, card, context) return {mult = G.GAME.hands[context.scoring_name or "High Card"].played} end,
        function(self, card, context)
            return {
                level_up = true,
                message = localize('k_level_up_ex')
            }
        end,
        function(self, card, context)
            card.ability.extra_value = card.ability.extra_value + 5
            card:set_cost()
            return {
                message = localize('k_val_up'),
                colour = G.C.MONEY
            }
        end,
        function(self, card, context)
            G.E_MANAGER:add_event(Event({
                func = function()
                    ease_discard(-G.GAME.current_round.discards_left, nil, true)
                    ease_hands_played(4)
                    SMODS.calculate_effect(
                        { message = localize { type = 'variable', key = 'a_hands', vars = { 4 } } },
                        context.blueprint_card or card)
                    return true
                end
            }))
            return nil, true
        end,
        function(self, card, context)
            local all_black_suits = true
            for _, playing_card in ipairs(G.hand.cards) do
                if not playing_card:is_suit('Clubs', nil, true) and not playing_card:is_suit('Spades', nil, true) then
                    all_black_suits = false
                    break
                end
            end
            if all_black_suits then
                return {
                    xmult = 4
                }
            end
        end,
        function(self, card, context)
            if G.GAME.current_round.hands_played == 0 then
                G.playing_card = (G.playing_card and G.playing_card + 1) or 1
                local card_copied = copy_card(context.full_hand[1], nil, nil, G.playing_card)
                card_copied:add_to_deck()
                G.deck.config.card_limit = G.deck.config.card_limit + 1
                table.insert(G.playing_cards, card_copied)
                G.hand:emplace(card_copied)
                card_copied.states.visible = nil

                G.E_MANAGER:add_event(Event({
                    func = function()
                        card_copied:start_materialize()
                        return true
                    end
                }))
                return {
                    message = localize('k_copied_ex'),
                    colour = G.C.CHIPS,
                    func = function() -- This is for timing purposes, it runs after the message
                        G.E_MANAGER:add_event(Event({
                            func = function()
                                SMODS.calculate_context({ playing_card_added = true, cards = { card_copied } })
                                return true
                            end
                        }))
                    end
                }
            end
        end,
        function(self, card, context)
            if G.GAME.hands[context.scoring_name] and G.GAME.hands[context.scoring_name].played_this_round > 1 then
                return {
                    xmult = 4
                }
            end
        end,
        function(self, card, context)
            local destructable_jokers = {}
            for i = 1, #G.jokers.cards do
                if G.jokers.cards[i] ~= card and not SMODS.is_eternal(G.jokers.cards[i], card) and not G.jokers.cards[i].getting_sliced then
                    destructable_jokers[#destructable_jokers + 1] =
                        G.jokers.cards[i]
                end
            end
            local joker_to_destroy = pseudorandom_element(destructable_jokers, 'vremade_madness')

            if joker_to_destroy then
                joker_to_destroy.getting_sliced = true
                G.E_MANAGER:add_event(Event({
                    func = function()
                        (context.blueprint_card or card):juice_up(0.8, 0.8)
                        joker_to_destroy:start_dissolve({ G.C.RED }, nil, 1.6)
                        return true
                    end
                }))
            end
            return { xmult = 4 }
        end,
        function(self, card, context)
            if #G.jokers.cards + G.GAME.joker_buffer < G.jokers.config.card_limit then
                local jokers_to_create = 1
                G.GAME.joker_buffer = G.GAME.joker_buffer + jokers_to_create
                G.E_MANAGER:add_event(Event({
                    func = function()
                        for _ = 1, jokers_to_create do
                            SMODS.add_card {
                                set = 'Joker',
                                rarity = 'Common',
                            }
                            G.GAME.joker_buffer = 0
                        end
                        return true
                    end
                }))
                return {
                    message = localize('k_plus_joker'),
                    colour = G.C.BLUE,
                }
            end
        end,
        function(self, card, context)
            local enhanced = {}
            for _, scored_card in ipairs(context.scoring_hand or {}) do
                if next(SMODS.get_enhancements(scored_card)) and not scored_card.debuff and not scored_card.vampired then
                    enhanced[#enhanced + 1] = scored_card
                    scored_card.vampired = true
                    scored_card:set_ability('c_base', nil, true)
                    G.E_MANAGER:add_event(Event({
                        func = function()
                            scored_card:juice_up()
                            scored_card.vampired = nil
                            return true
                        end
                    }))
                end
            end
            return {xmult = 4}
        end,
        function(self, card, context)
            if #G.consumeables.cards + G.GAME.consumeable_buffer < G.consumeables.config.card_limit then
                if G.GAME.dollars <= 4 then
                    G.GAME.consumeable_buffer = G.GAME.consumeable_buffer + 1
                    G.E_MANAGER:add_event(Event({
                        func = (function()
                            SMODS.add_card {
                                set = 'Tarot',
                            }
                            G.GAME.consumeable_buffer = 0
                            return true
                        end)
                    }))
                    return {
                        message = localize('k_plus_tarot'),
                    }
                end
            end
        end,
        function(self, card, context)
            local faces = 0
            for _, scored_card in ipairs(context.scoring_hand) do
                if scored_card:is_face() then
                    faces = faces + 1
                    scored_card:set_ability('m_gold', nil, true)
                    G.E_MANAGER:add_event(Event({
                        func = function()
                            scored_card:juice_up()
                            return true
                        end
                    }))
                end
            end
            if faces > 0 then
                return {
                    message = localize('k_gold'),
                    colour = G.C.MONEY
                }
            end
        end,
        function(self, card, context)
            return {
                message = localize('ph_boss_disabled'),
                func = function()
                    G.GAME.blind:disable()
                end
            }
        end,
        function(self, card, context)
            for _, area in ipairs({ G.jokers, G.consumeables }) do
                for _, other_card in ipairs(area.cards) do
                    if other_card.set_cost then
                        other_card.ability.extra_value = (other_card.ability.extra_value or 0) + 4
                        other_card:set_cost()
                    end
                end
            end
            return {
                message = localize('k_val_up'),
                colour = G.C.MONEY
            }
        end,
        function(self, card, context) return {chips = 3 * math.max(0, (G.GAME.dollars + (G.GAME.dollar_buffer or 0)))} end,
        function(self, card, context)
            G.E_MANAGER:add_event(Event({
                func = (function()
                    add_tag(Tag('tag_double'))
                    play_sound('generic1', 0.9 + math.random() * 0.1, 0.8)
                    play_sound('holo1', 1.2 + math.random() * 0.1, 0.4)
                    return true
                end)
            }))
            return nil, true
        end,
        function(self, card, context)
            local _card = SMODS.add_card { set = "Base", seal = SMODS.poll_seal({ guaranteed = true, type_key = 'vremade_certificate_seal' }) }
            G.GAME.blind:debuff_card(_card)
            G.hand:sort()
            SMODS.calculate_context({ playing_card_added = true, cards = { _card } })
        end,
        function(self, card, context)
             local other_joker = nil
            for i = 1, #G.jokers.cards do
                if G.jokers.cards[i] == card then other_joker = G.jokers.cards[i + 1] end
            end
            local ret = SMODS.blueprint_effect(card, other_joker, context)
            if ret then
                ret.colour = G.C.BLUE
            end
            return ret
        end,
        function(self, card, context)
            local ret = SMODS.blueprint_effect(card, G.jokers.cards[1], context)
            if ret then
                ret.colour = G.C.RED
            end
            return ret
        end,
        function(self, card, context)
            local jokers = {}
            for i = 1, #G.jokers.cards do
                if G.jokers.cards[i] ~= card then
                    jokers[#jokers + 1] = G.jokers.cards[i]
                end
            end
            if #jokers > 0 then
                if #G.jokers.cards <= G.jokers.config.card_limit then
                    local chosen_joker = pseudorandom_element(jokers, 'vremade_invisible')
                    local copied_joker = copy_card(chosen_joker, nil, nil, nil,
                        chosen_joker.edition and chosen_joker.edition.negative)
                    if copied_joker.ability.invis_rounds then copied_joker.ability.invis_rounds = 0 end
                    if type(copied_joker.ability.extra) == "table" and copied_joker.ability.extra.invis_rounds then copied_joker.ability.extra.invis_rounds = 0 end
                    copied_joker:add_to_deck()
                    G.jokers:emplace(copied_joker)
                    return { message = localize('k_duplicated_ex') }
                else
                    return { message = localize('k_no_room_ex') }
                end
            else
                return { message = localize('k_no_other_jokers') }
            end
        end,
        function(self, card, context)
            if G.consumeables.cards[1] then
                G.E_MANAGER:add_event(Event({
                    func = function()
                        local card_to_copy, _ = pseudorandom_element(G.consumeables.cards, 'perkeo')
                        local copied_card = copy_card(card_to_copy)
                        copied_card:set_edition("e_negative", true)
                        copied_card:add_to_deck()
                        G.consumeables:emplace(copied_card)
                        return true
                    end
                }))
                return { message = localize('k_duplicated_ex') }
            end
        end,
        --onto consumable effects
        function(self, card, context)
            local area = G.play and #G.play.cards > 0 and G.play or G.hand
            local card1 = pseudorandom_element(area.cards, pseudoseed("erratic_birthright_cards"))
            local card2 = pseudorandom_element(area.cards, pseudoseed("erratic_birthright_cards"))
            local card = pseudorandom("erratic_5050") and card1 or card2
            SPOX.flip_then({card1, card2}, function(c)
                if c == card then
                    copy_card(c, card == card1 and card2 or card1)
                end
            end)
        end,
        function(self, card, context)
            local area = G.play and #G.play.cards > 0 and G.play or G.hand
            local enhancement = SMODS.poll_enhancement({guaranteed = true})
            local cards = {}
            for i = 1, math.floor(pseudorandom("birthright_cards_num")*4)+1 do
                cards[#cards+1] = pseudorandom_element(area.cards, pseudoseed("erratic_birthright_cards"))
            end
            SPOX.flip_then(cards, function(c)
                c:set_ability(G.P_CENTERS[enhancement])
            end)
        end,
        function(self, card, context)
            SMODS.add_card{set="Planet"}
        end,
        function(self, card, context)
            SMODS.add_card{set="Tarot"}
        end,
        function(self, card, context)
            SMODS.add_card{set="Spectral"}
        end,
        function(self, card, context)
            G.E_MANAGER:add_event(Event({
                trigger = 'after',
                delay = 0.4,
                func = function()
                    play_sound('timpani')
                    card:juice_up(0.3, 0.5)
                    ease_dollars(math.max(0, math.min(G.GAME.dollars, 20)), true)
                    return true
                end
            }))
            delay(0.6)
        end,
		function(self, card, context)
            add_planet(context.scoring_name or "High Card")
        end,
		function(self, card, context)
			local hands = {}
			for i, v in pairs(G.GAME.hands) do hands[#hands+1] = i end
			local hand = pseudorandom_element(hands, pseudoseed("erratic_birthright_planet_tag"))
            add_planet(hand or "High Card")
        end,
        function(self, card, context)
            if SMODS.pseudorandom_probability(card, 'wheel_of_fortune', 1, 2) then
                local editionless_jokers = SMODS.Edition:get_edition_cards(G.jokers, true)

                local eligible_card = pseudorandom_element(editionless_jokers, 'wheel_of_fortune')
                local edition = SMODS.poll_edition { key = "wheel_of_fortune", guaranteed = true, no_negative = true, options = { 'e_polychrome', 'e_holo', 'e_foil' } }
                if eligible_card then
                    eligible_card:set_edition(edition, true)
                end
            else
                G.E_MANAGER:add_event(Event({
                    trigger = 'after',
                    delay = 0.4,
                    func = function()
                        attention_text({
                            text = localize('k_nope_ex'),
                            scale = 1.3,
                            hold = 1.4,
                            major = card,
                            backdrop_colour = G.C.SECONDARY_SET.Tarot,
                            align = (G.STATE == G.STATES.TAROT_PACK or G.STATE == G.STATES.SPECTRAL_PACK or G.STATE == G.STATES.SMODS_BOOSTER_OPENED) and
                                'tm' or 'cm',
                            offset = { x = 0, y = (G.STATE == G.STATES.TAROT_PACK or G.STATE == G.STATES.SPECTRAL_PACK or G.STATE == G.STATES.SMODS_BOOSTER_OPENED) and -0.2 or 0 },
                            silent = true
                        })
                        G.E_MANAGER:add_event(Event({
                            trigger = 'after',
                            delay = 0.06 * G.SETTINGS.GAMESPEED,
                            blockable = false,
                            blocking = false,
                            func = function()
                                play_sound('tarot2', 0.76, 0.4)
                                return true
                            end
                        }))
                        play_sound('tarot2', 1, 0.4)
                        card:juice_up(0.3, 0.5)
                        return true
                    end
                }))
            end
        end,
        function(self, card, context)
            local area = G.play and #G.play.cards > 0 and G.play or G.hand
            local enhancement = SMODS.poll_enhancement({guaranteed = true})
            local cards = {}
            for i = 1, math.floor(pseudorandom("birthright_cards_num")*4)+1 do
                cards[#cards+1] = pseudorandom_element(area.cards, pseudoseed("erratic_birthright_cards"))
            end
            SPOX.flip_then(cards, function(c)
                assert(SMODS.modify_rank(c, 1))
            end)
        end,
        function(self, card, context)
            local area = G.play and #G.play.cards > 0 and G.play or G.hand
            local enhancement = SMODS.poll_enhancement({guaranteed = true})
            local cards = {}
            for i = 1, math.floor(pseudorandom("birthright_cards_num")*4)+1 do
                local c = pseudorandom_element(area.cards, pseudoseed("erratic_birthright_cards"))
                c:start_dissolve()
            end
        end,
        function(self, card, context)
            local money = 0
            for i = 1, #G.jokers.cards do
                if G.jokers.cards[i].ability.set == 'Joker' then
                    money = money + G.jokers.cards[i].sell_cost
                end
            end
            money = math.min(money, 50)

            G.E_MANAGER:add_event(Event({
                trigger = 'after',
                delay = 0.4,
                func = function()
                    play_sound('timpani')
                    card:juice_up(0.3, 0.5)
                    ease_dollars(money, true)
                    return true
                end
            }))
            delay(0.6)
        end,
        function(self, card, context)
            local area = G.play and #G.play.cards > 0 and G.play or G.hand
            local enhancement = SMODS.poll_enhancement({guaranteed = true})
            local cards = {}
            for i = 1, math.floor(pseudorandom("birthright_cards_num")*4)+1 do
                cards[#cards+1] = pseudorandom_element(area.cards, pseudoseed("erratic_birthright_cards"))
            end
            local suits = {}
            for i, v in pairs(SMODS.Suits) do
                if not v.in_pool or v:in_pool({}) then suits[#suits+1] = i end
            end
            SPOX.flip_then(cards, function(c)
                SMODS.change_base(card, pseudorandom_element(suits, pseudoseed("erratic_birthright_suit")), nil)
            end)
        end,
        function(self, card, context)
            local hands = {}
            for i, v in pairs(G.GAME.hands) do
                if pseudorandom("erratic_birthright3070") < 0.3 then hands[#hands+1] = i end
            end
            SMODS.upgrade_poker_hands({ from = tag, hands = hands, level_up = pseudorandom("erratic_levels")*3 })
        end,
        function(self, card, context)
            local card = pseudorandom_element(G.hand.cards, pseudoseed("erratic_cards"))
            if card then
                card:start_dissolve()
            end
            for i = 1, 3 do
                local c = SMODS.add_card{key = SMODS.poll_enhancement{guaranteed = true}, area = G.hand}
                c:add_to_deck()
                G.deck.config.card_limit = G.deck.config.card_limit + 1
                table.insert(G.playing_cards, c)
            end
        end,
        function(self, card, context)
            local area = G.play and #G.play.cards > 0 and G.play or G.hand
            local seal = SMODS.poll_seal({guaranteed = true})
            local cards = {}
            for i = 1, math.floor(pseudorandom("birthright_cards_num")*4)+1 do
                local c = pseudorandom_element(area.cards, pseudoseed("erratic_birthright_cards"))
                c:set_seal(seal)
            end
        end,
        function(self, card, context)
            local card = pseudorandom_element(G.hand.cards, pseudoseed("erratic_cards"))
            for i = 1, 3 do
                local c = copy_card(card)
                c:add_to_deck()
                G.deck.config.card_limit = G.deck.config.card_limit + 1
                table.insert(G.playing_cards, c)
                G.hand:emplace(c)
            end
        end,
    },
    conditions = {
        function(self, card, context) return context.joker_main end,
        function(self, card, context) return context.joker_main end,
        function(self, card, context) return context.joker_main end,
        function(self, card, context) return context.joker_main end,
        function(self, card, context) return context.individual end,
        function(self, card, context) return context.individual and context.other_card:is_suit("Diamonds") end,
        function(self, card, context) return context.individual and context.other_card:is_suit("Hearts") end,
        function(self, card, context) return context.individual and context.other_card:is_suit("Spades") end,
        function(self, card, context) return context.individual and context.other_card:is_suit("Clubs") end,
        function(self, card, context) return context.individual and context.other_card:is_face() end,
        function(self, card, context) return context.joker_main and #G.play.cards <= 3 end,
        function(self, card, context) return context.individual and context.cardarea == G.play end,
        function(self, card, context) return context.individual and context.cardarea == G.hand end,
        function(self, card, context) return context.repetition end,
        function(self, card, context) return context.repetition and context.cardarea == G.hand end,
        function(self, card, context) return context.repetition and context.cardarea == G.play end,
        function(self, card, context) return context.setting_blind end,
        function(self, card, context) return context.reroll_shop end,
        function(self, card, context) return context.pre_discard end,
        function(self, card, context) return context.before end,
        function(self, card, context) return context.after end,
        function(self, card, context) return context.end_of_round and not context.individual and not context.repetition end,
        function(self, card, context)
            local ace_check = false
            if context.scoring_hand then
                for i = 1, #context.scoring_hand do
                    if context.scoring_hand[i]:get_id() == 14 then
                        ace_check = true
                        break
                    end
                end
            end
            return context.joker_main and next(context.poker_hands["Straight"]) and ace_check
        end,
        function(self, card, context) return context.joker_main and SMODS.pseudorandom_probability(card, "birthright_erratic_prob", 1, 4) end,
        function(self, card, context) return context.joker_main and SMODS.pseudorandom_probability(card, "birthright_erratic_prob", 1, 2) end,
        function(self, card, context) return context.joker_main and SMODS.pseudorandom_probability(card, "birthright_erratic_prob", 1, 8) end,
        function(self, card, context) 
            local all_black_suits = true
            for _, playing_card in ipairs(G.hand.cards) do
                if not playing_card:is_suit('Clubs', nil, true) and not playing_card:is_suit('Spades', nil, true) then
                    all_black_suits = false
                    break
                end
            end
            return context.joker_main and all_black_suits
        end,
        function(self, card, context)
            return context.joker_main and next(context.poker_hands["Straight"])
        end,
        function(self, card, context)
            return context.full_hand and #context.full_hand == 1 and context.destroy_card == context.full_hand[1] and context.full_hand[1]:get_id() == 6
        end,
        function(self, card, context)
            return context.using_consumeable and not context.blueprint and context.consumeable.ability.set == 'Planet'
        end,
        function(self, card, context) return context.skipping_booster end,
        function(self, card, context) return context.playing_card_added end,
        function(self, card, context) return context.skipping_booster end,
        function(self, card, context) return context.open_booster end,
        function(self, card, context) return context.other_joker and (context.other_joker.config.center.rarity == 2 or context.other_joker.config.center.rarity == "Uncommon") end,
        function(self, card, context) return context.selling_card end,
        function(self, card, context) return context.game_over end,
        function(self, card, context) return context.skip_blind end,
        function(self, card, context) return context.individual and context.cardarea == G.hand end,
		function(self, card, context) return context.individual and context.cardarea == G.play end,
		function(self, card, context) return context.individual and context.cardarea == "unscored" end,
    }
}

local create_card_ref = create_card
function create_card(...)
    local card = create_card_ref(...)
    if card.config.center.set == "Joker" and next(SMODS.find_card("j_smallpox_birthright")) and SPOX.get_selected_deck() == "b_erratic" then
        card:set_ability(G.P_CENTERS.j_smallpox_birthright)
    end
    return card
end

function _G.create_UIBox_card_shop()
    G.GAME.smallpox_card_shop = CardArea(
      G.hand.T.x+0,
      G.hand.T.y+G.ROOM.T.y + 9,
      math.min(G.GAME.shop.joker_max*1.02*G.CARD_W,4.08*G.CARD_W),
      1.05*G.CARD_H, 
      {card_limit = G.GAME.shop.joker_max, type = 'shop', highlight_limit = -9999, negative_info = true})

    local card = SMODS.add_card{area = G.GAME.smallpox_card_shop, rank = "Ace", suit = "Spades"}
    G.GAME.smallpox_card_cost = 4
    return create_UIBox_generic_options({
        contents = {
            {n=G.UIT.R, config={align = "cm", padding = 0.1}, nodes={
                {n=G.UIT.C, config={align = "cm", padding = 0.15, r=0.2, colour = G.C.L_BLACK, emboss = 0.05}, nodes={
                    {n=G.UIT.O, config={object = G.GAME.smallpox_card_shop}},
                }},
               {n=G.UIT.C, config={align = "cm", padding = 0.1}, nodes={
                    {n=G.UIT.R,config={func = "can_cycle_rank", button = 'toggle_shop', align = "cm", minw = 1.3, minh = 1.3, r=0.15,colour = G.C.BLUE,shadow = true}, nodes = {
                        {n=G.UIT.R, config={align = "cm", padding = 0.07}, nodes={
                            {n=G.UIT.R, config={align = "cm", maxw = 1.3}, nodes={
                                {n=G.UIT.T, config={text = localize("k_cycle_rank"), scale = 0.4, colour = G.C.WHITE, shadow = true}}
                            }},
                        }},              
                    }},
                    {n=G.UIT.R,config={func = "can_cycle_suit", button = 'toggle_shop', align = "cm", minw = 1.3, minh = 1.3, r=0.15,colour = G.C.RED,shadow = true}, nodes = {
                        {n=G.UIT.R, config={align = "cm", padding = 0.07}, nodes={
                            {n=G.UIT.R, config={align = "cm", maxw = 1.3}, nodes={
                                {n=G.UIT.T, config={text = localize("k_cycle_suit"), scale = 0.4, colour = G.C.WHITE, shadow = true}}
                            }},
                        }},              
                    }},
                    {n=G.UIT.R,config={func = "can_cycle_enhancement", button = 'toggle_shop', align = "cm", minw = 1.3, minh = 1.3, r=0.15,colour = G.C.PURPLE,shadow = true}, nodes = {
                        {n=G.UIT.R, config={align = "cm", padding = 0.07}, nodes={
                            {n=G.UIT.R, config={align = "cm", maxw = 1.3}, nodes={
                                {n=G.UIT.T, config={text = localize("k_cycle"), scale = 0.4, colour = G.C.WHITE, shadow = true}},
                            }},
                            {n=G.UIT.R, config={align = "cm", maxw = 1.3}, nodes={
                                {n=G.UIT.T, config={text = localize("k_enhancement"), scale = 0.4, colour = G.C.WHITE, shadow = true}},
                            }},
                        }},              
                    }},
                }},
                {n=G.UIT.C, config={align = "cm", padding = 0.1}, nodes={
                    {n=G.UIT.R,config={func = "can_cycle_seal", button = 'toggle_shop', align = "cm", minw = 1.3, minh = 1.3, r=0.15,colour = G.C.ORANGE,shadow = true}, nodes = {
                        {n=G.UIT.R, config={align = "cm", padding = 0.07}, nodes={
                            {n=G.UIT.R, config={align = "cm", maxw = 1.3}, nodes={
                                {n=G.UIT.T, config={text = localize("k_cycle_seal"), scale = 0.4, colour = G.C.WHITE, shadow = true}}
                            }},
                        }},              
                    }},
                    {n=G.UIT.R,config={func = "can_cycle_edition", button = 'toggle_shop', align = "cm", minw = 1.3, minh = 1.3, r=0.15,colour = G.C.DARK_EDITION,shadow = true}, nodes = {
                        {n=G.UIT.R, config={align = "cm", padding = 0.07}, nodes={
                            {n=G.UIT.R, config={align = "cm", maxw = 1.3}, nodes={
                                {n=G.UIT.T, config={text = localize("k_cycle_edition"), scale = 0.4, colour = G.C.WHITE, shadow = true}}
                            }},
                        }},              
                    }},
                    {n=G.UIT.R,config={func = "can_buy_cardshop", button = 'toggle_shop', align = "cm", minw = 1.3, minh = 1.3, r=0.15,colour = G.C.GREEN,shadow = true}, nodes = {
                        {n=G.UIT.R, config={align = "cm", padding = 0.07}, nodes={
                            {n=G.UIT.R, config={align = "cm", maxw = 1.3}, nodes={
                                {n=G.UIT.T, config={text = localize("k_buy_card"), scale = 0.4, colour = G.C.WHITE, shadow = true}}
                            }},
                            {n=G.UIT.R, config={align = "cm", maxw = 1.3}, nodes={
                                {n=G.UIT.T, config={text = localize("$"), scale = 0.4, colour = G.C.WHITE, shadow = true}},
                                {n=G.UIT.T, config={ref_table = G.GAME, ref_value = 'smallpox_card_cost', colour = G.C.WHITE, scale = 0.55, shadow = true}}
                            }},
                        }},              
                    }},

                }},
            }}
        }
    })
end

function G.FUNCS.can_cycle_rank(e) e.config.button = "cycle_rank" end
function G.FUNCS.can_cycle_suit(e) e.config.button = "cycle_suit" end
function G.FUNCS.can_cycle_enhancement(e) e.config.button = "cycle_enhancement" end
function G.FUNCS.can_cycle_seal(e) e.config.button = "cycle_seal" end
function G.FUNCS.can_cycle_edition(e) e.config.button = "cycle_edition" end
G.FUNCS.can_buy_cardshop = function(e)
    if
        G.GAME.dollars + G.GAME.bankrupt_at >= G.GAME.smallpox_card_cost
    then
        e.config.colour = G.C.ORANGE
        e.config.button = "buy_cardshop"
    else
        e.config.button = nil
        e.config.colour = G.C.UI.BACKGROUND_INACTIVE
    end
end

function G.FUNCS.calculate_cardshop_cost()
    local card = G.GAME.smallpox_card_shop.cards[1]
    local cost = 4 + (card:is_face() and 2 or 0)
    if card.config.center.set == "Enhanced" then cost = cost * 1.5 end
    if card.edition then 
        cost = cost * (({
            ["e_holo"] = 1.5,
            ["e_foil"] = 1.25
        })[card.edition.key] or 2 )
    end
    if card.seal then
        cost = cost * 1.5
    end
    cost = math.floor(cost)
    G.GAME.smallpox_card_cost = cost
end

function G.FUNCS.cycle_rank(e)
    local card = G.GAME.smallpox_card_shop.cards[1]
    SMODS.modify_rank(card, 1)
    G.FUNCS.calculate_cardshop_cost()
end

function G.FUNCS.cycle_suit(e)
    local card = G.GAME.smallpox_card_shop.cards[1]
    local index
    local suits = {}
    for i, v in pairs(SMODS.Suits) do
        if not v.in_pool or v:in_pool({}) then suits[#suits+1] = i end
    end
    table.sort(suits, function(a, b) return SMODS.Suits[a].suit_nominal < SMODS.Suits[b].suit_nominal end)

    for i, v in pairs(suits) do 
        if card:is_suit(v) then index = i end
    end
    index = index + 1
    if index > #suits then index = 1 end
    SMODS.change_base(card, suits[index])
    G.FUNCS.calculate_cardshop_cost()
end

function G.FUNCS.cycle_enhancement(e)
    local card = G.GAME.smallpox_card_shop.cards[1]
    local index = 1
    local suits = {}
    for i, v in pairs(G.P_CENTERS) do
        if v.set == "Default" or v.set == "Enhanced" then
            if not v.in_pool or v:in_pool({}) then suits[#suits+1] = i end
        end
    end
    table.sort(suits, function(a, b) return (G.P_CENTERS[a].order or 0) < (G.P_CENTERS[b].order or 0) end)
    for i, v in pairs(suits) do
        if card.config.center.key == v then index = i end
    end
    index = index + 1
    if index > #suits then index = 1 end
    card:set_ability(G.P_CENTERS[suits[index]])
    G.FUNCS.calculate_cardshop_cost()
end

function G.FUNCS.cycle_edition(e)
    local card = G.GAME.smallpox_card_shop.cards[1]
    local index = 1
    local suits = {}
    for i, v in pairs(G.P_CENTERS) do
        if v.set == "Edition" then
            if (not v.in_pool or v:in_pool({})) and v.key ~= "e_negative" then suits[#suits+1] = v.key end
        end
    end
    table.sort(suits, function(a, b) return G.P_CENTERS[a].order < G.P_CENTERS[b].order end)
    for i, v in pairs(suits) do
        if card.edition and card.edition.key == v then index = i end
    end
    index = index + 1
    if index > #suits then index = 0 end
    card:set_edition(suits[index])
    G.FUNCS.calculate_cardshop_cost()
end

function G.FUNCS.cycle_seal(e)
    local card = G.GAME.smallpox_card_shop.cards[1]
    local index = 0
    local suits = {}
    for i, v in pairs(SMODS.Seals) do
        if not v.in_pool or v:in_pool({}) then suits[#suits+1] = i end
    end
    table.sort(suits, function(a, b) return SMODS.Seals[a].order < SMODS.Seals[b].order end)
    for i, v in pairs(suits) do
        if card.seal == v then index = i end
    end
    index = index + 1
    if index > #suits then index = 0 end
    if index == 0 then
        card:set_seal()
    else
        card:set_seal(suits[index])
    end
    G.FUNCS.calculate_cardshop_cost()
end

function G.FUNCS.buy_cardshop(e)
    G.playing_card = (G.playing_card and G.playing_card + 1) or 1
    local card_copied = copy_card(G.GAME.smallpox_card_shop.cards[1], nil, nil, G.playing_card)
    card_copied:add_to_deck()
    table.insert(G.playing_cards, card_copied)
    G.deck:emplace(card_copied)
    G.FUNCS.exit_overlay_menu()
    G.GAME.birthright_cant_cardshop = true
end

SMODS.current_mod.set_debuff = function(card)
    if G.GAME.smallpox_card_shop
    and G.GAME.smallpox_card_shop.cards 
    and card == G.GAME.smallpox_card_shop.cards[1] then
        return 'prevent_debuff'
    end
end

SMODS.Atlas {
    key = "ruby_paw",
    path = "ruby_paw.png",
    px = 18,
    py = 18,
}
