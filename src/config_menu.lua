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