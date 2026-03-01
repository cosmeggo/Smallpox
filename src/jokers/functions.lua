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
    discovered = false,
    config = {
        operators = {
            {key = "mul", colour = G.C.RED},
            {key = "add", colour = G.C.BLUE},
            {key = "div", colour = G.C.PURPLE},
            {key = "sub", colour = G.C.FILTER},
            {key = "mod", colour = G.C.GREEN},
            {key = "avg", colour = G.C.GREEN},
            {key = "con", colour = G.C.BLUE},
            {key = "min", colour = G.C.FILTER},
            {key = "max", colour = G.C.FILTER},
            {key = "com", colour = G.C.RED},
            {key = "pow", colour = G.C.GREEN},
            {key = "fac", colour = G.C.PURPLE},
            {key = "bal", colour = G.C.BLUE},
            {key = "lsh", colour = G.C.RED},
            {key = "hye", colour = G.C.GREEN},
            {key = "ran", colour = G.C.FILTER}
        },
        current_operator = {key = "non", colour = G.C.UI.TEXT_INACTIVE},
        been_used = false
    },
    pools = {["Smallpox"] = true, ["Math"] = true},
    atlas = "smallpox_breuhh",

    loc_vars = function(self,ifq,card)
        return {
            vars = {localize("k_smallpox_"..card.ability.current_operator.key), colours = {card.ability.current_operator.colour}}
        }
    end,
    load = function(self, card, card_table, other_card)
        G.E_MANAGER:add_event(Event({
            trigger = "after",
            func = function()
                local operator = card.ability.current_operator
                if operator.key == "non" then
                    return true
                end
                SMODS.set_scoring_calculation("smallpox_breuhh_"..operator.key)
                return true
            end
         }))
    end,
    add_to_deck = function(self, card, from_debuff)
        for _, functions in ipairs(SMODS.find_card("j_smallpox_functions")) do
            if not functions.debuff and functions ~= card then
                card.ability.current_operator = functions.ability.current_operator
                break
            end
        end
        
        local operator = card.ability.current_operator
        if operator.key == "non" then
            return nil
        end
        G.E_MANAGER:add_event(Event({
            trigger = "after",
            func = function()
                SMODS.set_scoring_calculation("smallpox_breuhh_"..operator.key)
                return true
            end
         }))
    end,
    remove_from_deck = function(self, card, from_debuff)
        for _, functions in ipairs(SMODS.find_card("j_smallpox_functions")) do
            if not functions.debuff and functions ~= card then
                return nil
            end
        end
        G.E_MANAGER:add_event(Event({
            trigger = "after",
            func = function()
                SMODS.set_scoring_calculation("multiply")
                return true
            end
        }))
        
    end,
    calculate = function(self, card, context)
        if context.after and not context.blueprint then
            local operator = nil
            local first_function = SMODS.find_card("j_smallpox_functions")[1]
            if first_function == card then
                card.ability.current_operator = card.ability.operators[math.ceil((pseudorandom("function")*#card.ability.operators + 1) % #card.ability.operators)]
                operator = card.ability.current_operator
                G.E_MANAGER:add_event(Event({
                    trigger = "after",
                    func = function()
                        SMODS.set_scoring_calculation("smallpox_breuhh_"..operator.key)
                        return true
                    end
                }))
                return {
                    message = localize("k_smallpox_"..card.ability.current_operator.key).."!",
                    colour = operator.colour
                }
            else
                card.ability.current_operator = first_function.ability.current_operator
            end
        end

        if context.setting_blind then 
            if card.ability.been_used then 
                card.ability.been_used = false 
                return {message = localize("k_smallpox_breuhhh_useactive").."!", colour = G.C.RED} 
            end 
        end
    end,
    smallpox_credits = {
		{
			text = "By: Breuuh"
		},
	},
}

function SPOX.chips_container(args)
    args.type = 'chips'
    args.text = 'chip_text'
    args.align = 'cr'
    args.scale = args.scale*0.4
    return
    {n=G.UIT.C, config={align = 'cm', id = 'hand_chips_container'}, nodes = {
        SMODS.GUI.score_container(args)
    }}
end

function SPOX.operator(args)
    return
    {n=G.UIT.C, config={align = args.align or "cm", id = 'hand_operator_container'}, nodes={
        {n=G.UIT.T, config={text = args.text or "X", lang = G.LANGUAGES['en-us'], scale = (args.scale or  1), colour = args.color or G.C.UI_MULT, shadow = true}},
    }}
end

function SPOX.mult_container(args)
    args.type = 'mult'
    args.scale = args.scale*0.4
    return
    {n=G.UIT.C, config={align = 'cm', id = 'hand_mult_container'}, nodes = {
        SMODS.GUI.score_container(args)
    }}
end

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
        return chips*10^math.floor(math.log(mult,10) + 1) + mult
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
    replace_ui = function(self) 
        local multbox = SPOX.mult_container({scale=0.5, w=2*0.5, h=0.5})
        multbox.config.align = "tl"
        return {n=G.UIT.R, config={align = "cm", minh = 1, padding = 0.1}, nodes={
                SMODS.GUI.chips_container(1),
                SPOX.operator({align="tm", text="log8", scale=0.5, color = G.C.GREEN}),
                multbox
            }}
    end,
}

SMODS.Scoring_Calculation {
    key = "breuhh_fac",
    func = function(self,chips,mult,flames)
        local n = math.log(chips*mult, 4)
        return math.sqrt(2*math.pi*n)*(n/2.718281828)^n
    end,
    replace_ui = function(self) 
        local scale = 0.6
        return {n=G.UIT.R, config={align = "cm", minh = 1, padding = 0.1}, nodes={
                SPOX.operator({text="log2(", scale=scale, color = G.C.PURPLE}),
                SPOX.chips_container({scale=scale, w=2*scale, h=scale}),
                SPOX.operator({text="X", scale=scale, color = G.C.PURPLE}),
                SPOX.mult_container({scale=scale, w=2*scale, h=scale}),
                SPOX.operator({text=")!", scale=scale, color = G.C.PURPLE}),
            }}
    end,
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
    replace_ui = function(self) 
        local scale = 0.7
        return {n=G.UIT.R, config={align = "cm", minh = 1, padding = 0.1}, nodes={
                SPOX.chips_container({scale=scale, w=2*scale, h=scale}),
                SPOX.operator({text="<< log2", scale=0.5, color = G.C.RED}),
                SPOX.mult_container({scale=scale, w=2*scale, h=scale}),
            }}
    end,
    colour = G.C.RED
}

SMODS.Scoring_Calculation {
    key = "breuhh_hye",
    func = function(self,chips,mult,flames)
        return chips*10^math.log(mult,3)
    end,
    replace_ui = function(self) 
        local scale = 0.7
        return {n=G.UIT.R, config={align = "cm", minh = 1, padding = 0.1}, nodes={
                SPOX.chips_container({scale=scale, w=2*scale, h=scale}),
                SPOX.operator({text="e log3", scale=0.5, color = G.C.GREEN}),
                SPOX.mult_container({scale=scale, w=2*scale, h=scale}),
            }}
    end,
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
