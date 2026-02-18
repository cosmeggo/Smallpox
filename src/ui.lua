-- please put your ui there :)

--#region Agency
function create_UIBox_smallpox_triscendence()
    return 
    { n = G.UIT.ROOT, config = {align = "cm", minw = G.ROOM.T.w*5, minh = G.ROOM.T.h*5, padding = 0.1, r = 0.1, colour = {G.C.GREY[1], G.C.GREY[2], G.C.GREY[3], 0.7}}, nodes = {
        { n = G.UIT.R, config = { align = "cm", minh = 1, r = 0.3, padding = 0.07, minw = 1, colour = G.C.JOKER_GREY, emboss = 0.1}, nodes = {
            { n = G.UIT.C, config={align = "cm", minh = 1, r = 0.2, padding = 0.2, minw = 1, colour = G.C.L_BLACK}, nodes={
                { n = G.UIT.R, config = {align = "cm", colour = G.C.CLEAR}, nodes = {
                    { n = G.UIT.O, config = {object = DynaText({
                        scale = 1.2, string = localize("k_smallpox_triscendence"), 
                        colours = {HEX("ca202f")}, float = true, shadow = true, silent = true, pop_in = 0, pop_in_rate = 6})
                    }}
                }},
                { n = G.UIT.R, config = {align = "cm"}, nodes = {
                    { n = G.UIT.T, config = {text = localize("k_smallpox_select_tri"), scale = 0.4, colour = G.C.UI.TEXT_LIGHT}}
                }},
                { n = G.UIT.R, config = {align = "cm", padding = 0.2, colour = G.C.CLEAR}, nodes = {
                    {n=G.UIT.R, config= {align = "cm", minw = 5, padding = 0.1, r = 0.1, hover = true, colour = HEX("ca202f"), button = "smallpox_tri_1", shadow = true}, nodes={
                        {n=G.UIT.R, config={align = "cm", no_fill = true}, nodes={
                            {n=G.UIT.T, config={text = localize('k_smallpox_tri_1'), scale = 0.5, colour = G.C.WHITE, shadow = true}}
                        }},
                        {n=G.UIT.R, config={align = "cm", no_fill = true}, nodes={
                            {n=G.UIT.T, config={text = localize('k_smallpox_tri_1_desc'), scale = 0.4, colour = G.C.WHITE, shadow = true}}
                        }}
                    }},
                    {n=G.UIT.R, config= {align = "cm", minw = 5, padding = 0.1, r = 0.1, hover = true, colour = HEX("ca202f"), button = "smallpox_tri_2", shadow = true}, nodes={
                        {n=G.UIT.R, config={align = "cm", no_fill = true}, nodes={
                            {n=G.UIT.T, config={text = localize('k_smallpox_tri_2'), scale = 0.5, colour = G.C.WHITE, shadow = true}}
                        }},
                        {n=G.UIT.R, config={align = "cm", no_fill = true}, nodes={
                            {n=G.UIT.T, config={text = localize('k_smallpox_tri_2_desc'), scale = 0.4, colour = G.C.WHITE, shadow = true}}
                        }}
                    }},
                    {n=G.UIT.R, config= {align = "cm", minw = 5, padding = 0.1, r = 0.1, hover = true, colour = HEX("ca202f"), button = "smallpox_tri_3", shadow = true}, nodes={
                        {n=G.UIT.R, config={align = "cm", no_fill = true}, nodes={
                            {n=G.UIT.T, config={text = localize('k_smallpox_tri_3'), scale = 0.5, colour = G.C.WHITE, shadow = true}}
                        }},
                        {n=G.UIT.R, config={align = "cm", no_fill = true}, nodes={
                            {n=G.UIT.T, config={text = localize('k_smallpox_tri_3_desc'), scale = 0.4, colour = G.C.WHITE, shadow = true}}
                        }}
                    }},
                }},
                {n=G.UIT.R, config={id = 'overlay_menu_back_button', align = "cm", minw = 2.5, padding = 0.1, r = 0.1, hover = true, colour = G.C.ORANGE, button = "exit_overlay_menu", shadow = true, focus_args = {nav = 'wide', button = 'b'}}, nodes={
                    {n=G.UIT.R, config={align = "cm", padding = 0, no_fill = true}, nodes={
                        {n=G.UIT.T, config={text = localize('b_skip'), scale = 0.5, colour = G.C.UI.TEXT_LIGHT, shadow = true, func = 'set_button_pip', focus_args = {button = 'b'}}}
                    }}
                }}
            }},
        }},
    }}
end

local function triscendence(cards, effect)
    G.CONTROLLER.locks.frame_set = true
    G.CONTROLLER.locks.frame = true
    G.CONTROLLER:mod_cursor_context_layer(-1000)
    G.OVERLAY_MENU:remove()
    G.OVERLAY_MENU = nil
    G.VIEWING_DECK = nil
    G.SETTINGS.paused = false

    for k, v in ipairs(cards) do
        if effect == 1 and k == 1 then v.ability.extra.threes = 27 end
        if effect == 2 then 
            ease_hands_played(v.ability.extra.restore)
            ease_discard(v.ability.extra.restore)
        end
        if effect == 3 then
            v.ability.extra.mult = v.ability.extra.mult + v.ability.extra.mult_gain
            SMODS.calculate_effect({
                message = localize{type = 'variable', key = 'a_mult', vars = {v.ability.extra.mult_gain}}, 
                colour = G.C.MULT,
            }, v)
        end
    end
end

G.FUNCS.smallpox_tri_1 = function()
    triscendence(SMODS.find_card("j_smallpox_agency"), 1)
end

G.FUNCS.smallpox_tri_2 = function()
    triscendence(SMODS.find_card("j_smallpox_agency"), 2)
end

G.FUNCS.smallpox_tri_3 = function()
    triscendence(SMODS.find_card("j_smallpox_agency"), 3)
end
--#endregion
local function button_ui(card)
  return UIBox {
    definition = {
      n = G.UIT.ROOT,
      config = {
        colour = G.C.CLEAR
      },
      nodes = {
        {
          n = G.UIT.C,
          config = {
            align = 'cm',
            padding = 0.15,
            r = 0.08,
            hover = true,
            shadow = true,
            colour = G.C.MULT,
            button = 'smallpox_breuhh_click',
            func = 'smallpox_breuhh_func',
            ref_table = card,
          },
          nodes = {
            {
              n = G.UIT.R,
              nodes = {
                {
                  n = G.UIT.T,
                  config = {
                    text = "USE",
                    colour = G.C.UI.TEXT_LIGHT, -- color of the button text
                    scale = 0.4,
                  }
                },
                {
                  n = G.UIT.B,
                  config = {
                    w = 1.25,
                    h = 0.6
                  }
                }
              }
            }
          }
        }
      }
    },
    config = {
      align = 'cl',
      major = card,
      parent = card,
      offset = { x = 1.2, y = 0 }
    }
  }
end

G.FUNCS.smallpox_breuhh_click = function(e)
    local card = e.config.ref_table
    card.ability.current_operator = card.ability.operators[math.ceil((pseudorandom("function")*#card.ability.operators + 1) % #card.ability.operators)]
    local operator = card.ability.current_operator
    G.E_MANAGER:add_event(Event({
        trigger = "after",
        func = function()
            SMODS.set_scoring_calculation("smallpox_breuhh_"..operator.key)
            return true
        end
    }))
    card.ability.been_used = true
    card_eval_status_text(card, 'extra', nil, nil, nil, {message = operator.name.."!", colour = operator.colour})
end

G.FUNCS.smallpox_breuhh_func = function(e)
  local card = e.config.ref_table
  local can_use = not card.ability.been_used

  e.config.button = can_use and 'smallpox_breuhh_click' or nil
  e.config.colour = can_use and G.C.MULT or G.C.UI.BACKGROUND_INACTIVE
end

SMODS.DrawStep {
  key = 'breuhh_button',
  order = -30,
  func = function(card, layer)
    if card.children.smallpox_breuhh_button then
      card.children.smallpox_breuhh_button:draw()
    end
  end
}
SMODS.draw_ignore_keys.smallpox_breuhh_button = true

local highlight_ref = Card.highlight
function Card.highlight(self, is_highlighted)
  if is_highlighted and self.config.center.key == "j_smallpox_functions" and self.area == G.jokers then
    self.children.smallpox_breuhh_button = button_ui(self)
  elseif self.children.smallpox_breuhh_button then
    self.children.smallpox_breuhh_button:remove()
    self.children.smallpox_breuhh_button = nil
  end

  return highlight_ref(self, is_highlighted)

end



if SMODS.DynaTextEffect then
	SMODS.DynaTextEffect {
			key = "rainbow_wiggle",
			func = function (dynatext, index, letter)
				letter.colour = SPOX.hsl2rgb(math.fmod((G.TIMERS.REAL + index) * 50, 360), 1, 0.75)
				letter.offset.y = math.cos(G.TIMERS.REAL * 2.95 + index) * 9
				letter.scale = (((math.sin((G.TIMERS.REAL + index)*2.9443) + 1)/2) + 6 )/6
			end
		}
end

if SMODS.DynaTextEffect then
	SMODS.DynaTextEffect {
			key = "rainbow",
			func = function (dynatext, index, letter)
				letter.colour = SPOX.hsl2rgb(math.fmod((G.TIMERS.REAL + index) * 50, 360), 1, 0.75)
			end
		}
end

if SMODS.DynaTextEffect then
	SMODS.DynaTextEffect {
			key = "pink",
			func = function (dynatext, index, letter)
				letter.colour = SPOX.hsl2rgb(293, 1, 0.80)
			end
		}
end

SMODS.Gradient{
    key = "fire",
    colours = {
        HEX("ff7300"),
        HEX("ffd900"),
    },
    cycle = 1
}


function G.FUNCS.close_popup()
    G.FUNCS.exit_overlay_menu()
end

function smallpox_create_Flash_Warning()
    return create_UIBox_generic_options({
        back_func = "exit_overlay_menu", 
        no_back = true,                  
        contents = {
            { n = G.UIT.R, config = { align = "cm", padding = 0.2, T = { w = 15, h = 20 } }, nodes = {
                { n = G.UIT.T, config = { text = localize("spox_flash_warn"), colour = G.C.UI.TEXT_LIGHT, scale = 0.5, shadow = true } }
            }},
            {
              n = G.UIT.R,
              config = { minh = 5 }  
            },
            { n = G.UIT.R, config = { align = "cm", padding = 0.2 }, nodes = {
                { n = G.UIT.C, config = { button = "exit_overlay_menu", colour = G.C.RED, r = 0.1, padding = 0.05, align = "cm" }, nodes = {
                    { n = G.UIT.T, config = { text = "Close", colour = G.C.WHITE, scale = 0.5, shadow = true } }
                }}
            }}
        }
    })
end

--[[
SPOX.Tooltip{
    key = "potw_table",
}
]]
