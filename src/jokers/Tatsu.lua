SMODS.Atlas({
    key = "tatsu", 
    path = "jokers/Tatsu.png", 
    px = 71,
    py = 95,
    atlas_table = "ASSET_ATLAS"
})


SMODS.Sound({key = "tatsusfx", path = "tatsu.mp3", sync = true,})

SMODS.Joker{
    key = "Tatsu",

    rarity = 3,
    cost = 9,
    atlas = "tatsu",
    pos = { x = 0, y = 0 },

    blueprint_compat = false,
    eternal_compat = false,
    perishable_compat = false,

    

    remove_from_deck = function(self, card, from_debuff)
        if from_debuff then return end
        if not G.jokers or not G.jokers.cards then return end


        local joker_count = 0
        for _, j in ipairs(G.jokers.cards) do
            if j ~= card then
                joker_count = joker_count + 1
            end
        end

        local editions = {}
        for _, j in ipairs(G.jokers.cards) do
            if j ~= card then
                editions[#editions + 1] = j.edition
            end
        end

        for i = #G.jokers.cards, 1, -1 do
            local j = G.jokers.cards[i]
            if j ~= card then
                j:start_dissolve()
                G.jokers:remove_card(j)
            end
        end

        play_sound('smallpox_tatsusfx', 0.9 + math.random()*0.1, 0.8)

        for i = 1, joker_count do
            local pool = {}

            for _, center in pairs(G.P_CENTER_POOLS.Joker) do
                if center.rarity == 3 
                and not center.demo
                and center.key ~= card.config.center.key
                then
                    pool[#pool + 1] = center
                end
            end

            if #pool > 0 then
                local center = pseudorandom_element(
                    pool,
                    pseudoseed('pivot_rare_' .. i)
                )

                local new_joker = SMODS.create_card{
                    key = center.key,
                    area = G.jokers,
                    skip_materialize = true
                }

                G.jokers:emplace(new_joker)
                if editions[i] and editions[i].negative then
                    new_joker:set_edition(editions[i], true)
                end
                new_joker:start_materialize()
                play_sound('generic1', 0.9 + math.random()*0.1, 0.8)
            end
        end
    end

}