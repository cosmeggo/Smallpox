local debug = false
local counted = false
local count = {}

local debuff = SMODS.current_mod.set_debuff or function (card)
    return nil
end
SMODS.current_mod.set_debuff = function (card)
    if card.config.center.key == "j_smallpox_mys_minty_vaccine" then return "prevent_debuff" end
    if next(SMODS.find_card("j_smallpox_mys_minty_vaccine")) then
        for i,v in ipairs(SMODS.find_card("j_smallpox_mys_minty_vaccine")) do
            local mod = (card.config.center.original_mod or {id = "Vanilla"}).id
            if card.config.center.set == "Joker" and (mod == v.ability.extra.modid) then
                return true
            end
        end
    end
    return debuff(card)
end

SMODS.Atlas({
    key = "mys_minty_vaccine",
    path = "jokers/vaccine (mys. minty).png",
    px = 71,
    py = 95,
    atlas_table = "ASSET_ATLAS"
})

SMODS.Joker {
    key = "mys_minty_vaccine",
    pos = { x = 0, y = 0 },
    rarity = 2,
    blueprint_compat = true,
    cost = 7,
    discovered = true,
    config = {
        extra = {
            modid = "Vanilla",
            xmult = 2
        },
    },
    pools = {["Smallpox"] = true},
    atlas = 'mys_minty_vaccine',

    loc_vars = function(self, info_queue, card)
        local modname = "Vanilla" --todo localizify this?
        local color = G.C.FILTER
        if card.area and card.area.config.collection then
            modname = "a random mod's" --and this?
        elseif card.ability.extra.modid ~= "Vanilla" then
            modname = SMODS.Mods[card.ability.extra.modid] and SMODS.Mods[card.ability.extra.modid].name or "Vanilla"
            color = SMODS.Mods[card.ability.extra.modid].badge_colour
        end

        return {
            vars = {
                modname,
                localize("mintypox_name"),
                card.ability.extra.xmult,
                colours = {
                    color,
                    HEX("CA7CA7")
                }
            }
        }
    end,
    set_ability = function (self, card)
        if not counted then
            for k,v in pairs(G.P_CENTERS) do
                if v.set == "Joker" then
                    local mod = v.original_mod and v.original_mod.id or "Vanilla"
                    count[mod] = (count[mod] or 0) + 1
                end
            end
            for k,v in pairs(count) do
                if v < count.smallpox then k = nil end
            end
            counted = true
        end

        local _,mod = pseudorandom_element(count, "smallpox_vaccine_mod_selection")
        card.ability.extra.modid = mod

        self.smallpox_credits[1].text = "By: " .. localize("mintypox_name")
    end,
    calculate = function(self, card, context)
        if context.other_joker and context.other_joker.debuff then
            return {
                xmult = card.ability.extra.xmult
            }
        end

        if context.initial_scoring_step then
            local triggered = false
            for i,v in ipairs(G.play.cards) do
                if v.debuff then
                    triggered = true
                    SMODS.calculate_effect({xmult = card.ability.extra.xmult, juice_card = v, message_card = v}, card) --Can't use context.other_card, so faking it :V
                end
            end
            if triggered then return nil, true end
        end
    end,
    smallpox_credits = {
		{
			text = "Done in set_ability due to localization",
            color = HEX("CA7CA7"),
		},
	},
}


