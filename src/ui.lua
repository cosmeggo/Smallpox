-- please put your ui there :)
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

--[[
SPOX.Tooltip{
    key = "potw_table",
}
]]
