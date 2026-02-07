SMODS.Atlas({
    key = "breuhh", 
    path = "jokers/Breuhh.png", 
    px = 71,
    py = 95,
    atlas_table = "ASSET_ATLAS"
})

SMODS.Joker {
    key = "functions",
    pos = { x = 0, y = 0 },
    rarity = 3,
    blueprint_compat = false,
    cost = 11,
    discovered = true,
    config = {
        operators = {
            {key = "mul", name = "multiplication", colour = G.C.RED},
            {key = "add", name = "addition", colour = G.C.BLUE},
            {key = "div", name = "division", colour = G.C.PURPLE},
            {key = "sub", name = "subtraction", colour = G.C.FILTER},
            {key = "mod", name = "modulo", colour = G.C.GREEN},
            {key = "avg", name = "average", colour = G.C.GREEN},
            {key = "con", name = "concatenation", colour = G.C.BLUE},
            {key = "min", name = "minimum", colour = G.C.FILTER},
            {key = "max", name = "maximum", colour = G.C.FILTER},
            {key = "com", name = "complement", colour = G.C.RED},
            {key = "pow", name = "exponentiation", colour = G.C.GREEN},
            {key = "fac", name = "factorial", colour = G.C.PURPLE},
            {key = "bal", name = "balance", colour = G.C.BLUE},
            {key = "lsh", name = "leftshift", colour = G.C.RED},
            {key = "hye", name = "hyper-e", colour = G.C.GREEN},
            {key = "ran", name = "random", colour = G.C.FILTER}
        },
        current_operator = {name = "none", colour = G.C.UI.TEXT_INACTIVE},
        been_used = false
    },
    atlas = "smallpox_breuhh",

    loc_vars = function(self,ifq,card)
        return {
            vars = {card.ability.current_operator.name, colours = {card.ability.current_operator.colour}}
        }
    end,
    
    calculate = function(self, card, context)
        if context.after and not context.blueprint then
            card.ability.current_operator = card.ability.operators[math.ceil((pseudorandom("function")*#card.ability.operators + 1) % #card.ability.operators)]
            local operator = card.ability.current_operator
            G.E_MANAGER:add_event(Event({
                trigger = "after",
                func = function()
                    SMODS.set_scoring_calculation("smallpox_breuhh_"..operator.key)
                    return true
                end
            }))
            return {
                message = operator.name.."!",
                colour = operator.colour
            }
        end

        if context.setting_blind then 
            if card.ability.been_used then 
                card.ability.been_used = false 
                return {message = "use active!", colour = G.C.RED} 
            end 
        end
    end
}



SMODS.Scoring_Calculation {
    key = "breuhh_mul",
    func = function(self,chips,mult,flames)
        return chips*mult
    end,
    text = "X",
    colour = G.C.RED
}

SMODS.Scoring_Calculation {
    key = "breuhh_add",
    func = function(self,chips,mult,flames)
        return chips+mult
    end,
    text = "+",
    colour = G.C.BLUE
}

SMODS.Scoring_Calculation {
    key = "breuhh_div",
    func = function(self,chips,mult,flames)
        return (chips > mult and chips/mult or mult/chips)
    end,
    text = "/",
    colour = G.C.PURPLE
}

SMODS.Scoring_Calculation {
    key = "breuhh_sub",
    func = function(self,chips,mult,flames)
        return math.abs(chips-mult)
    end,
    text = "-",
    colour = G.C.FILTER
}

SMODS.Scoring_Calculation {
    key = "breuhh_mod",
    func = function(self,chips,mult,flames)
        return (chips > mult and chips%mult or mult%chips)
    end,
    text = "%",
    colour = G.C.GREEN
}

SMODS.Scoring_Calculation {
    key = "breuhh_avg",
    func = function(self,chips,mult,flames)
        return (chips+mult)/2
    end,
    text = "=~",
    colour = G.C.GREEN
}

SMODS.Scoring_Calculation {
    key = "breuhh_con",
    func = function(self,chips,mult,flames)
        return chips*10^math.ceil(math.log(mult,10)) + mult
    end,
    text = "",
    colour = G.C.BLUE
}

SMODS.Scoring_Calculation {
    key = "breuhh_min",
    func = function(self,chips,mult,flames)
        return (chips > mult and mult or chips)
    end,
    text = "<",
    colour = G.C.FILTER
}

SMODS.Scoring_Calculation {
    key = "breuhh_max",
    func = function(self,chips,mult,flames)
        return (chips < mult and mult or chips)
    end,
    text = ">",
    colour = G.C.FILTER
}

SMODS.Scoring_Calculation {
    key = "breuhh_com",
    func = function(self,chips,mult,flames)
        return (-chips-1)*(-mult-1)
    end,
    text = "~",
    colour = G.C.RED
}

SMODS.Scoring_Calculation {
    key = "breuhh_pow",
    func = function(self,chips,mult,flames)
        return chips^math.log((mult > 0 and mult or 1), 8)
    end,
    text = "^",
    colour = G.C.GREEN
}

SMODS.Scoring_Calculation {
    key = "breuhh_fac",
    func = function(self,chips,mult,flames)
        local n = math.log(chips*mult, 4)
        return math.sqrt(2*math.pi*n)*(n/2.718281828)^n
    end,
    text = "!",
    colour = G.C.PURPLE
}

SMODS.Scoring_Calculation {
    key = "breuhh_bal",
    func = function(self,chips,mult,flames)
        return ((chips+mult)/2)^2
    end,
    text = "=",
    colour = G.C.BLUE
}

SMODS.Scoring_Calculation {
    key = "breuhh_lsh",
    func = function(self,chips,mult,flames)
        return chips*2^math.ceil(math.log(mult,2))
    end,
    text = "<<",
    colour = G.C.RED
}

SMODS.Scoring_Calculation {
    key = "breuhh_hye",
    func = function(self,chips,mult,flames)
        return chips*10^math.log(mult,3)
    end,
    text = "e",
    colour = G.C.GREEN
}

SMODS.Scoring_Calculation {
    key = "breuhh_ran",
    func = function(self,chips,mult,flames)
        return math.ceil(pseudorandom("randomscore")*(chips*mult))
    end,
    text = "?",
    colour = G.C.FILTER
}
