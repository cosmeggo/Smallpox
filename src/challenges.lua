-- Pandemic
SMODS.Challenge {
    key = 'pandemic',
    jokers = {
        { id = 'j_smallpox_smallpox', eternal = true },
    },
}

-- Bullet Hell
SMODS.Challenge {
    key = 'bullethell',
    jokers = {
        { id = 'j_smallpox_spikedball', eternal = true },
    },
    rules = {
        custom = {
            { id = 'smallpox_bullethell_collision_gameover' },
            { id = 'smallpox_bullethell_reduced_scaling' },
            { id = 'smallpox_bullethell_mod_ante' },
        },
    },
    apply = function(self)
        G.GAME.win_ante = 6
    end,
}


-- Muodonmuutosmestari
SMODS.Challenge {
    key = 'mestari',
    rules = {
        modifiers = {
            { id = 'joker_slots', value = 3 },
            { id = 'consumable_slots', value = 4 },
        }
    },
    jokers = {
        { id = 'j_smallpox_polymorphine', eternal = true },
    },
    consumeables = {
        { id = 'c_emperor' },
        { id = 'c_emperor' },
    },
}
