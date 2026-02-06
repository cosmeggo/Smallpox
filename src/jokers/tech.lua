SMODS.Atlas({
    key = "Tech", 
    path = "jokers/ExampleJoker.png", 
    px = 71,
    py = 95,
    atlas_table = "ASSET_ATLAS"
})

SMODS.Joker {
    key = "Tech",
    blueprint_compat = true,
    rarity = 4,
    cost = 8,
    atlas = "Tech",
    pos = { x = 0, y = 0 },
    config = { extra = { cxmult = 1.5, uxmult = 2, rxmult = 2.5, lxmult = 3 } },
    loc_vars = function(self, info_queue, card)
        return { vars = { card.ability.extra.cxmult, card.ability.extra.uxmult, card.ability.extra.rxmult } }
    end,
     calculate = function(self, card, context)

        print(SMODS.optional_features.retrigger_joker)

        if context.retrigger_joker_check and not context.retrigger_joker and context.other_card.config.center.mod == SMODS.Mods['smallpox'] and (context.other_card:is_rarity('Rare') or context.other_card:is_rarity('Legendary')) then
            print('work')
            return {
                message = "Again!",
                repetitions = 1,
                card = card
            }
        end

        if context.other_joker and context.other_joker.config.center.pools and context.other_joker.config.center.pools['Smallpox_Pool'] and (context.other_joker.config.center.rarity == 1 or context.other_joker.config.center.rarity == "Common") and not context.retrigger_joker_check  then
            return {
                xmult = card.ability.extra.cxmult
            }
        end
        if context.other_joker and context.other_joker.config.center.pools and context.other_joker.config.center.pools['Smallpox_Pool'] and (context.other_joker.config.center.rarity == 2 or context.other_joker.config.center.rarity == "Uncommon") and not context.retrigger_joker_check then
            return {
                xmult = card.ability.extra.uxmult
            }
        end

        if context.other_joker and context.other_joker.config.center.pools and context.other_joker.config.center.pools['Smallpox_Pool'] and (context.other_joker.config.center.rarity == 3 or context.other_joker.config.center.rarity == "Rare") and not context.retrigger_joker_check  then
            return {
                xmult = card.ability.extra.rxmult
            }
        end
        if context.other_joker and context.other_joker.config.center.pools and context.other_joker.config.center.pools['Smallpox_Pool'] and (context.other_joker.config.center.rarity == 4 or context.other_joker.config.center.rarity == "Legendary") and not context.retrigger_joker_check then
            return {
                xmult = card.ability.extra.lxmult
            }
        end

       
    end,
}