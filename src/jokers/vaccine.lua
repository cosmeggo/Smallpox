local debug = false
local talisman = not not next(SMODS.find_mod("Talisman"))
local spcol = SMODS.current_mod.badge_colour
local modcount = 0
for k,v in pairs(SMODS.Mods) do
    if v.can_load then modcount = modcount + 1 end
end

SMODS.Atlas({
    key = "mys_minty_vaccine",
    path = "jokers/vaccine (mys. minty).png",
    px = 71,
    py = 95,
    atlas_table = "ASSET_ATLAS"
})

SMODS.Sound{
    key = "emult_replacement", --Copied right from Talisman, lol
    path = "ExponentialMult.wav"
}

SMODS.Joker {
    key = "mys_minty_vaccine",
    pos = { x = 0, y = 0 },
    rarity = 3,
    blueprint_compat = true,
    cost = 9,
    discovered = true,
    config = { extra = { emult = 2 }, },
    atlas = 'examplejoker',

    loc_vars = function(self, info_queue, card)
        local key = self.key
        if modcount > 10 or debug then key = key.."_alt" end
        return {
            key = key,
            vars = {
                card.ability.extra.emult,
                colours = {
                    spcol
                }
            }
        }
    end,
    calculate = function(self, card, context)
        if context.joker_main then
            local check = true
            for i,v in ipairs(G.jokers.cards) do
                if v ~= card then
                    local mod = v.original_mod and v.original_mod.id or "vanilla"
                    check = mod ~= "smallpox" and (mod ~= "vanilla" or (modcount < 10 and not debug))
                    if not check then break end
                end
            end
            if check then
                if talisman then
                    return {
                        emult = card.ability.extra.emult,
                        colour = G.C.SET.Spectral
                    }
                else
                    mult = mod_mult(mult^card.ability.extra.emult)
                    return {
                        message = "^"..card.ability.extra.emult.." Mult",
                        sound = "smallpox_emult_replacement",
                        colour = G.C.SET.Spectral
                    }
                end
            end
        end
    end
}


