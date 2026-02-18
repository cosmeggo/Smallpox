SMODS.Atlas({
    key = "Typ0", 
    path = "jokers/Typ0.png", 
    px = 71,
    py = 95,
    atlas_table = "ASSET_ATLAS"
})

SMODS.Gradient {
    key = "Typ0",
    colours = {HEX('A4C2F4'), HEX('a4eaf4')},
    cycle = 8
}

SMODS.Gradient {
    key = "MultChips",
    colours = {G.C.MULT, G.C.CHIPS},
    cycle = 3,
    interpolation = "linear"
}

SMODS.Joker {
    key = "blackjack",
    blueprint_compat = true,
    rarity = 2,
    cost = 4,
    atlas = "Typ0",
    pos = { x = 0, y = 0 },
    pools = {["Smallpox"] = true, ["Typ0Addition"] = true},

    config = { extra = { min = 7, max = 35, moneymin = 1, moneymax = 40, mult_n = 1, mult_d = 2, X_n = 1, X_d = 2} }, --kept throwing errors when i tried to uses mult_n and mult_d directly and X_n and X_d so idk


    loc_vars = function(self, info_queue, card)

        local r_mults = {}
        for i = math.floor(card.ability.extra.min), math.floor(card.ability.extra.max) do
            r_mults[#r_mults + 1] = tostring(i)
        end

        local main_end = {

            {
                n = G.UIT.O,
                config = {
                    object = DynaText({
                        string = {"X", "+"},
                        colours = { G.C.MULT },
                        pop_in_rate = 9999999,
                        silent = true,
                        random_element = true,
                        pop_delay = 0.2011,
                        scale = 0.32,
                        min_cycle_time = 0
                    })
                }
            },

            {
                n = G.UIT.O,
                config = {
                    object = DynaText({
                        string = r_mults,
                        colours = { G.C.MULT },
                        pop_in_rate = 9999999,
                        silent = true,
                        random_element = true,
                        pop_delay = 0.2011,
                        scale = 0.32,
                        min_cycle_time = 0
                    })
                }
            },

            {
                n = G.UIT.O,
                config = {
                    object = DynaText({
                        string = {" Mult", " Chips"},
                        colours = { SMODS.Gradients.smallpox_MultChips },
                        pop_in_rate = 9999999,
                        silent = true,
                        random_element = true,
                        pop_delay = 0.2011,
                        scale = 0.32,
                        min_cycle_time = 0
                    })
                }
            },

            {
                n = G.UIT.T,
                config = {
                    text = " and ",
                    colour = G.C.UI.TEXT_DARK,
                    scale = 0.32
                }
            },

            {
                n = G.UIT.O,
                config = {
                    object = DynaText({
                        string = r_mults,
                        colours = { G.C.MONEY },
                        pop_in_rate = 9999999,
                        silent = true,
                        random_element = true,
                        pop_delay = 0.2011,
                        scale = 0.32,
                        min_cycle_time = 0
                    })
                }
            },

            {
                n = G.UIT.T,
                config = {
                    text = "$",
                    colour = G.C.MONEY,
                    scale = 0.32
                }
            },
        }

        return { main_end = main_end }
    end,

    calculate = function(self, card, context)
        if context.joker_main and context.full_hand then
            local faces = 0
            local aces = 0
            local numbers = 0

            for _, c in ipairs(context.full_hand) do
                if c:get_id() == 11 or c:get_id() == 12 or c:get_id() == 13 or c:get_id() == 10 then
                    faces = faces + 1
                end
                if c:get_id() == 14 then
                    aces = aces + 1
                end
                if c:get_id() < 10 then
                    numbers = numbers + 1
                end
            end

            -- this whole block is so overcomplicated lmao i could do this way better but nested ifs it is
            if faces == 1 and aces == 1 and numbers == 0 then
                if SMODS.pseudorandom_probability(card, "black_spot", 1, 2) then
                    if SMODS.pseudorandom_probability(card, "X_prob", 1, 2) then
                        return {
                            Xmult = pseudorandom('BJrandMult', card.ability.extra.min, card.ability.extra.max),
                            dollars  = math.floor(pseudorandom('BJrandMoney', card.ability.extra.moneymin, card.ability.extra.moneymax) + 0.5),
                            message = "BlackJack!",
                            colour = G.C.MULT
                        }
                    else
                        return {
                            mult = pseudorandom('BJrandMult', card.ability.extra.min, card.ability.extra.max),
                            dollars  = math.floor(pseudorandom('BJrandMoney', card.ability.extra.moneymin, card.ability.extra.moneymax) + 0.5),
                            message = "BlackJack!",
                            colour = G.C.MULT
                        }
                    end
                else 
                    if SMODS.pseudorandom_probability(card, "X_prob", 1, 2) then
                        return {
                            xchips = pseudorandom('BJrandMult', card.ability.extra.min, card.ability.extra.max),
                            dollars  = math.floor(pseudorandom('BJrandMoney', card.ability.extra.moneymin, card.ability.extra.moneymax) + 0.5),
                            message = "BlackJack!",
                            colour = G.C.CHIPS
                        }
                    else
                        return {
                            chips = pseudorandom('BJrandMult', card.ability.extra.min, card.ability.extra.max),
                            dollars  = math.floor(pseudorandom('BJrandMoney', card.ability.extra.moneymin, card.ability.extra.moneymax) + 0.5),
                            message = "BlackJack!",
                            colour = G.C.CHIPS
                        }
                    end
                end
            end
        end
    end
    
}