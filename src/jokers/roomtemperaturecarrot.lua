local upgrading = false
local converting = false

SMODS.Atlas({
    key = "carrot", 
    path = "jokers/RoomTemperatureCarrot.png", 
    px = 71,
    py = 95,
    atlas_table = "ASSET_ATLAS"
})

SMODS.Joker {
    key = "roomtemperaturecarrot",
    atlas = 'carrot',
    pos = { x = 0, y = 0 },
    rarity = 3,
    cost = 10,
    pools = {["Smallpox"] = true, ["Food"] = true},
    blueprint_compat = true,
    discovered = true,
    unlocked = true,
    config = { extra = { carrocoins = 0, xchips_xmult = 1, carrocoins_mod = 0.2, xchips_xmult_mod = 0.1, carrocoins_upgrade_cost = 1, carrocoins_conversion_rate = 0.5 }, },
    pronouns = "it_its",
    loc_vars = function(self, info_queue, card)
        return { vars = { card.ability.extra.carrocoins, card.ability.extra.xchips_xmult, card.ability.extra.carrocoins_mod, card.ability.extra.xchips_xmult_mod, card.ability.extra.carrocoins_upgrade_cost, card.ability.extra.carrocoins_conversion_rate } }
    end,
    
    calculate = function(self, card, context)
        if context.joker_main then
            return {
                xmult = card.ability.extra.xchips_xmult,
                extra = {
                    xchips = card.ability.extra.xchips_xmult
                }
            }
        end
        if context.money_altered and context.amount > 0 and not converting then
            card.ability.extra.carrocoins = math.max(0,card.ability.extra.carrocoins + (context.amount * card.ability.extra.carrocoins_mod))
            return {
                message = "+" .. context.amount * card.ability.extra.carrocoins_mod .. " Carrocoins"
            }
        end
    end,
    smallpox_credits = {
    	{
    		text = "By: RainStar",
            color = G.C.GOLD
    	},
    },
}

-- buttons
local G_UIDEF_use_and_sell_buttons_ref = G.UIDEF.use_and_sell_buttons
function G.UIDEF.use_and_sell_buttons(card)
    local abc = G_UIDEF_use_and_sell_buttons_ref(card)
    if (card.area == G.jokers and G.jokers and card.config.center.key == "j_smallpox_roomtemperaturecarrot") and not card.debuff then
        sell = {
            n = G.UIT.C,
            config = { align = "cr" },
            nodes = {
                {
                    n = G.UIT.C,
                    config = {
                        ref_table = card,
                        align = "cr",
                        padding = 0.1,
                        r = 0.08,
                        minw = 1.25,
                        hover = true,
                        shadow = true,
                        colour = G.C.UI.BACKGROUND_INACTIVE,
                        one_press = true,
                        button = "sell_card",
                        func = "can_sell_card",
                        handy_insta_action = "sell",
                    },
                    nodes = {
                        { n = G.UIT.B, config = { w = 0.1, h = 0.6 } },
                        {
                            n = G.UIT.C,
                            config = { align = "tm" },
                            nodes = {
                                {
                                    n = G.UIT.R,
                                    config = { align = "cm", maxw = 1.25 },
                                    nodes = {
                                        {
                                            n = G.UIT.T,
                                            config = {
                                                text = localize("b_sell"),
                                                colour = G.C.UI.TEXT_LIGHT,
                                                scale = 0.4,
                                                shadow = true,
                                            },
                                        },
                                    },
                                },
                                {
                                    n = G.UIT.R,
                                    config = { align = "cm" },
                                    nodes = {
                                        {
                                            n = G.UIT.T,
                                            config = {
                                                text = localize("$"),
                                                colour = G.C.WHITE,
                                                scale = 0.4,
                                                shadow = true,
                                            },
                                        },
                                        {
                                            n = G.UIT.T,
                                            config = {
                                                ref_table = card,
                                                ref_value = "sell_cost_label",
                                                colour = G.C.WHITE,
                                                scale = 0.55,
                                                shadow = true,
                                            },
                                        },
                                    },
                                },
                            },
                        },
                    },
                },
            },
        }
        upgradebutton = { -- for upgrading the joker
            n = G.UIT.C,
            config = { align = "cl" },
            nodes = {
                {
                    n = G.UIT.C,
                    config = {
                        ref_table = card,
                        align = "cl",
                        padding = 0.1,
                        r = 0.08,
                        minw = 1.25,
                        hover = true,
                        shadow = true,
                        colour = G.C.UI.BACKGROUND_INACTIVE,
                        button = "upgrade",
                        func = "can_upgrade",
                    },
                    nodes = {
                        { n = G.UIT.B, config = { w = 0.1, h = 0.6 } },
                        {
                            n = G.UIT.C,
                            config = { align = "tm" },
                            nodes = {
                                {
                                    n = G.UIT.R,
                                    config = { align = "cm", maxw = 1.25 },
                                    nodes = {
                                        {
                                            n = G.UIT.T,
                                            config = {
                                                text = "Upgrade",
                                                colour = G.C.UI.TEXT_LIGHT,
                                                scale = 0.4,
                                                shadow = true,
                                            },
                                        },
                                    },
                                },
                                {
                                    n = G.UIT.R,
                                    config = { align = "cm" },
                                    nodes = {
                                        {
                                            n = G.UIT.T,
                                            config = {
                                                text = "C",
                                                colour = G.C.WHITE,
                                                scale = 0.4,
                                                shadow = true,
                                            },
                                        },
                                        {
                                            n = G.UIT.T,
                                            config = {
                                                ref_table = card.ability.extra,
                                                ref_value = "carrocoins_upgrade_cost",
                                                colour = G.C.WHITE,
                                                scale = 0.55,
                                                shadow = true,
                                            },
                                        },
                                    },
                                },
                            },
                        },
                    },
                },
            },
        }
        convertbutton = { -- for currency conversion
            n = G.UIT.C,
            config = { align = "cl" },
            nodes = {
                {
                    n = G.UIT.C,
                    config = {
                        ref_table = card,
                        align = "cl",
                        padding = 0.1,
                        r = 0.08,
                        minw = -1.25,
                        hover = true,
                        shadow = true,
                        colour = G.C.UI.BACKGROUND_INACTIVE,
                        button = "convert",
                        func = "can_convert",
                    },
                    nodes = {
                        { n = G.UIT.B, config = { w = 0.1, h = 0.6 } },
                        {
                            n = G.UIT.C,
                            config = { align = "tm" },
                            nodes = {
                                {
                                    n = G.UIT.R,
                                    config = { align = "cm", maxw = 1.25 },
                                    nodes = {
                                        {
                                            n = G.UIT.T,
                                            config = {
                                                text = "Convert",
                                                colour = G.C.UI.TEXT_LIGHT,
                                                scale = 0.4,
                                                shadow = true,
                                            },
                                        },
                                    },
                                },
                                {
                                    n = G.UIT.R,
                                    config = { align = "cm" },
                                    nodes = {
                                        {
                                            n = G.UIT.T,
                                            config = {
                                                text = "C",
                                                colour = G.C.WHITE,
                                                scale = 0.4,
                                                shadow = true,
                                            },
                                        },
                                        {
                                            n = G.UIT.T,
                                            config = {
                                                ref_table = card.ability.extra,
                                                ref_value = "carrocoins_conversion_rate",
                                                colour = G.C.WHITE,
                                                scale = 0.55,
                                                shadow = true,
                                            },
                                        },
                                    },
                                },
                            },
                        },
                    },
                },
            },
        }
        return {
            n = G.UIT.ROOT,
            config = { padding = 0, colour = G.C.CLEAR },
            nodes = {
                {
                    n = G.UIT.C,
                    config = { padding = 0, align = "cl" },
                    nodes = {
                        { n = G.UIT.R, config = { align = "cl" }, nodes = {
                            sell,
                        } },
                    },
                },
                {
                    n = G.UIT.C,
                    config = { padding = 0, align = "cl" },
                    nodes = {
                        { n = G.UIT.R, config = { align = "cr" }, nodes = {
                            upgradebutton,
                        } },
                        {
                            n = G.UIT.R,
                            config = { align = "cr" },
                            nodes = {
                                convertbutton,
                            },
                        },
                    }
                },
            },
        }
    end
    return abc
end

G.FUNCS.can_upgrade = function(e)
    if e.config.ref_table.ability.extra.carrocoins >= e.config.ref_table.ability.extra.carrocoins_upgrade_cost and not upgrading then
        e.config.colour = G.C.GREEN
        e.config.button = "upgrade"
    else
        e.config.colour = G.C.UI.BACKGROUND_INACTIVE
        e.config.button = nil
    end
end

G.FUNCS.upgrade = function(e)
    upgrading = true
    e.config.ref_table.ability.extra.carrocoins = math.max(0,e.config.ref_table.ability.extra.carrocoins - e.config.ref_table.ability.extra.carrocoins_upgrade_cost)
    e.config.ref_table.ability.extra.xchips_xmult = e.config.ref_table.ability.extra.xchips_xmult + e.config.ref_table.ability.extra.xchips_xmult_mod
    upgrading = false
    card_eval_status_text(G.jokers.highlighted[1], "extra", nil, nil, nil, { message = "Upgraded!" }
    )
end

G.FUNCS.can_convert = function(e)
    if e.config.ref_table.ability.extra.carrocoins >= 0.5 and not converting then
        e.config.colour = G.C.GREEN
        e.config.button = "convert"
    else
        e.config.colour = G.C.UI.BACKGROUND_INACTIVE
        e.config.button = nil
    end
end

G.FUNCS.convert = function(e)
    converting = true
    e.config.ref_table.ability.extra.carrocoins = math.max(0,e.config.ref_table.ability.extra.carrocoins - e.config.ref_table.ability.extra.carrocoins_conversion_rate)
    ease_dollars(1)
    converting = false
end
