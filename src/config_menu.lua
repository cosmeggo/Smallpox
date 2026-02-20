SPOX_CONFIG = SMODS.current_mod.config

SMODS.current_mod.config_tab = function()
    return {
        n = G.UIT.ROOT,
        config = { align = "cm", padding = 0.05, emboss = 0.05, r = 0.1, colour = G.C.BLACK },
        nodes = {
            {
                n = G.UIT.R,
                config = { align = "cm", minh = 1 },
                nodes = {
                    {
                        n = G.UIT.T,
                        config = { text = "Smallpox Config", colour = G.C.DARK_EDITION, scale = 0.5 }
                    }
                }
            },
            {
                n = G.UIT.R,
                nodes = {
                    {
                        n = G.UIT.C,
                        nodes = {
                            create_toggle {
                                label = "Photosensitive Mode (Requires Restart)",
                                ref_table = SPOX_CONFIG,
                                ref_value = "SPOX_Photosensitivity"
                            },
                            create_toggle {
                                label = "No Jumpscares Mode",
                                ref_table = SPOX_CONFIG,
                                ref_value = "SPOX_Jumpscares"
                            },
                            create_toggle {
                                label = "Renable Startup Message",
                                ref_table = SPOX_CONFIG,
                                ref_value = "SPOX_Startup_Message"
                            },
                        }
                    }
                }
            }
        }
    }
end

local function wrapText(text, maxChars)
    local wrappedText = ""
    local currentLineLength = 0

    for word in text:gmatch("%S+") do
        if currentLineLength + #word <= maxChars then
            wrappedText = wrappedText .. word .. ' '
            currentLineLength = currentLineLength + #word + 1
        else
            wrappedText = wrappedText .. '\n' .. word .. ' '
            currentLineLength = #word + 1
        end
    end

    return wrappedText
end


SMODS.current_mod.extra_tabs = function()
	return {
		{
			label = localize("spox_credits_tab_name"),
			tab_definition_function = function()
				return {
					n = G.UIT.ROOT,
					config = { align = "cm", padding = 0.05 },
					nodes = {
						{
							n = G.UIT.R,
							config = { align = "cm" },
							nodes = {
								{
									n = G.UIT.T,
                                    config = {
                                        text = localize("spox_credits_tab"),
                                        colour = G.C.RED,
                                        scale = 0.5,
                                        wrap = true,
                                        maxw = 6
                                    }
								}
							}
						}
					}
				}
			end
		}
	}
end



SMODS.current_mod.custom_ui = function(mod_nodes)
    mod_nodes = EMPTY(mod_nodes)
    local SpoxDescription = localize("Spox_Description") --shut up about my variable names i dont care
    local SPOXwrappedDescription = wrapText(SpoxDescription, 30)  --rewrap the description cuz we manually doing this
    local node1 =  {
         n = G.UIT.C,
        config = {w = 8, h = 6, align = "tm", padding = 0.2},
        nodes = {
            {
                n = G.UIT.R,
                config = { align = "cm", minh = 1 },
                nodes = {
                    {
                        n = G.UIT.T,
                        config = { text = "Smallpox", colour = G.C.DARK_EDITION, scale = 1 }
                    }
                }
            },
            {
                n = G.UIT.R,
                config = {
                    padding = 0.2,
                    align = "cm"
                },
                nodes = {
                    {
                        n = G.UIT.T,
                        config = {
                            text = SPOXwrappedDescription,
                            shadow = true,
                            scale = 0.75 * 0.5,
                            colour = G.C.UI.TEXT_LIGHT
                        }
                    }
                }
            },
            {
                n = G.UIT.R,
                config = { minh = 2 }, 
                nodes = {}
            },
            {
                n = G.UIT.R,
                config = {align = "cm"},
                nodes = {
                  UIBox_button({
                    colour = HEX('5865F2'), minw = 3.5, minh = 1, padding = 0.1, emboss = 0.2, button = "go_to_spox_discord", label = {localize("Spox_Discord")}
                  })
                }
            },
        }
    }
    table.insert(mod_nodes, node1)
end


G.FUNCS.go_to_spox_discord = function(e)
    love.system.openURL( "https://discord.gg/hGwkjwUV9V" )  --snagged this stuff from aikoyori's
end