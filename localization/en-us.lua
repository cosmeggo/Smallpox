return {
    descriptions = {
        Back = {
            b_smallpox_showman = {
                name = {
                    "Showman Deck",
                },
                text = {
                    "{C:attention}Joker{}, {C:tarot}Tarot{}, {C:planet}Planet{},",
                    "and {C:spectral}Spectral{} cards may",
                    "appear multiple times",
                    "{s:0.8,C:inactive}Art by Inky",
                },
                unlock = {
                    "{C:attention}Oh, this is the greatest show!",
                    "{C:attention}Oh, this is the greatest show!",
                }
            },
        },
        Joker = {
            Joker = {
                j_smallpox_smallpox = {
                    name = 'Smallpox',
                    text = {
                        "{X:mult,C:white} X#1# {} Mult",
                        "{C:green}#2# in #3#{} chance for a",
                        "random Joker to become",
                        "{V:1}infected{} with {C:attention}Smallpox{}"
                    }
                },
            },
            j_smallpox_spikedball = {
                name = 'Spiked Ball',
                text = {
                    {
                        "Adds some {C:attention}obstacles{}",
                        "to the screen",
                        "{s:0.8,C:inactive}Difficulty increases over time{}"
                    },
                    {
                        "Played cards give {C:money}$#1#{} when scored",
                        "if your {C:attention}cursor{} hasn't collided",
                        "with an obstacle this round",
                    },
                }
            },
        },
    }
}

