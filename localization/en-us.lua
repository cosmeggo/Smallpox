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
            j_smallpox_smallpox = {
                name = {
                  "Smallpox", 
                  "{s:0.5}created by {C:blue,s:0.5}Plasma{}{}",
                  "{s:0.5}art by {C:blue,s:0.5}Plasma{}{}"
                },
                text = {
                    "{X:mult,C:white} X#1# {} Mult",
                    "{C:green}#2# in #3#{} chance for a",
                    "random Joker to become",
                    "{V:1}infected{} with {C:attention}Smallpox{}"
                }
            },
            j_smallpox_fableofthemirrorbreaker = {
                name = {
                    "Fable of the Joke-Maker", 
                    "{s:0.5}created by {V:1,s:0.5}notmario{}{}"
                },
                text = {
                    {
                        "{E:1,C:spectral}Saga",
                        "{s:0.9,C:inactive}(As this joker is bought or created, and",
                        "{s:0.9,C:inactive}at the end of each round, trigger each",
                        "{s:0.9,C:inactive}Chapter ability in order, starting at I)"
                    },
                    {
                        "{B:2,C:white} I {} {f:6,s:0.8}—{} Create a copy of {C:attention}Joker{}.",
                        "Put a {C:spectral}Sticker{} on it with {C:inactive}\"{}When",
                        "this {C:attention}Joker{} triggers, earn {C:gold}$1{}{C:inactive}\"{}"
                    },
                    {
                        "{B:3,C:white} II {} {f:6,s:0.8}—{} This {C:attention}Joker{} gains +2 {C:red}Discard{}",
                        "selection limit until end of round"
                    },
                    {
                        "{B:4,C:white} III {} {f:6,s:0.8}—{} Flip this {C:attention}Joker{} into",
                        "{C:attention}Reflection of Jimbo{} {C:inactive}(It's a {C:rare}Rare{C:inactive}",
                        "{C:attention}Joker{C:inactive} with \"Retrigger the {C:attention}Joker{C:inactive}",
                        "{C:inactive}to the right once\")"
                    }
                }
            },
            j_smallpox_fableofthemirrorbreaker_back = {
                name = {
                    "Reflection of Jimbo", 
                    "{s:0.5}created by {V:1,s:0.5}notmario{}{}"
                },
                text = {
                    "Retrigger the {C:attention}Joker",
                    "to the right once"
                }
            },
        },
        Other = {
            smallpox_fable_sticker = {
                name = "Treasured",
                text = {
                    "When this {C:attention}Joker{}",
                    "triggers, earn {C:gold}$1"
                },
            },
        },
    },
    misc = {
        labels = {
            smallpox_fable_sticker = "Treasured",
        },
    }
}


