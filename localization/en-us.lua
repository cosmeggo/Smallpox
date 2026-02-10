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
            j_smallpox_birthright = {
                name = {
                    "Birthright",
                    "{s:0.5}created & art by {IMG:smallpox_ruby_paw,s:0.35}a{}{s:0.35} {}{C:red,s:0.5}Ruby{}",
                },
                text = {
                    "Has a different effect",
                    "based on the {C:attention}Selected{} Deck"
                }
            },
            j_smallpox_birthright_red = {
                name = {
                    "Birthright",
                    "{s:0.8,C:inactive}Venemous Slander{}",
                    "{s:0.5}created & art by {IMG:smallpox_ruby_paw,s:0.35}a{}{s:0.35} {}{s:0.35} {}{C:red,s:0.5}Ruby{}",
                },
                text = {
                    {
                        "Always draw {C:attention}one{}",
                        "more card than the number",
                        "of {C:attention}selected{} cards",
                        "when {C:red}discarding{}"
                    },
                }
            },
            j_smallpox_birthright_blue = {
                name = {
                    "Birthright",
                    "{s:0.8,C:inactive}Conjoined{}",
                    "{s:0.5}created & art by {IMG:smallpox_ruby_paw,s:0.35}a{}{s:0.35} {}{C:red,s:0.5}Ruby{}",
                },
                text = {
                    {
                        "Play up to {C:blue}+#1#{}",
                        "extra cards"
                    },
                    {
                        "Score cards past the first",
                        "{C:attention}4{} are retriggered"
                    }
                }
            },
            j_smallpox_birthright_yellow = {
                name = {
                    "Birthright",
                    "{s:0.8,C:inactive}Money, Money. Money{}",
                    "{s:0.5}created & art by {IMG:smallpox_ruby_paw,s:0.35}a{}{s:0.35} {}{C:red,s:0.5}Ruby{}",
                },
                text = {
                    {
                        "Use This Joker to",
                        "open the {C:attention}Stock Market{}"
                    },
                    {
                        "{C:attention}Stocks{} progress after",
                        "a hand is played"
                    }
                }
            },
            j_smallpox_birthright_green = {
                name = {
                    "Birthright",
                    "{s:0.8,C:inactive}Regurgitate{}",
                    "{s:0.5}created & art by {IMG:smallpox_ruby_paw,s:0.35}a{}{s:0.35} {}{C:red,s:0.5}Ruby{}",
                },
                text = {
                    {
                        "Unused {C:blue}Hands{} and {C:red}Discards{}",
                        "are carried over until the",
                        "end of the current ante"
                    },
                }
            },
            j_smallpox_birthright_black = {
                name = {
                    "Birthright",
                    "{s:0.8,C:inactive}Make her a member{}",
                    "{s:0.8,C:inactive}of the Midnight Crew{}"
                },
                text = {
                    {
                        "Spawns a {C:dark_edition}Negative{}",
                        "{C:attention}Eternal{} Joker on pickup"
                    },
                    {
                        "Use this Joker for {C:money}$#1#{}",
                        "to reroll all {C:attention}selected{}",
                        "{C:dark_edition}Negative{} Jokers"
                    }
                }
            },
            j_smallpox_birthright_magic = {
                name = {
                    "Birthright",
                    "{s:0.8,C:inactive}Samsara{}{s:0.35} {}",
                    "{s:0.5}created & art by {IMG:smallpox_ruby_paw,s:0.35}a{}{s:0.35} {}{C:red,s:0.5}Ruby{}",
                },
                text = {
                    {
                        "{C:attention}Arcana Packs{} always",
                        "contain {C:purple}The Fool{}"
                    },
                    {
                        "If {C:purple}The Fool{} tries to copy",
                        "{C:purple}The Fool{}, instead create",
                        "a random {C:spectral}Spectral{} card"
                    }
                }
            },
            j_smallpox_birthright_nebula = {
                name = {
                    "Birthright",
                    "{s:0.8,C:inactive}Interstellar{}",
                    "{s:0.5}created & art by {IMG:smallpox_ruby_paw,s:0.35}a{}{s:0.35} {}{C:red,s:0.5}Ruby{}",
                },
                text = {
                    "Using a Planet card",
                    "provides its {C:red}Mult{} per level",
                    "and {C:blue}Chips{} per level",
                    "to all hands for the",
                    "remainder of the current ante"
                }
            },
            j_smallpox_birthright_abandoned = {
                name = {
                    "Birthright",
                    "{s:0.8,C:inactive}Make Your Destiny{}",
                    "{s:0.5}created & art by {IMG:smallpox_ruby_paw,s:0.35}a{}{s:0.35} {}{C:red,s:0.5}Ruby{}",
                },
                text = {
                    "Once per ante open",
                    "a {C:red}Customiseable{}",
                    "Playing Card shop"
                }
            },
            j_smallpox_birthright_checkered = {
                name = {
                    "Birthright",
                    "{s:0.8,C:inactive}Chromatic Aberration{}",
                    "{s:0.5}created & art by {IMG:smallpox_ruby_paw,s:0.35}a{}{s:0.35} {}{C:red,s:0.5}Ruby{}",
                },
                text = {
                    {
                        "All Suit based effects",
                        "now check for {V:1}#1#{}"
                    },
                    {
                        "Changes {C:attention}suit{} based on",
                        "used suit changing {C:purple}Tarots{}"
                    }
                }
            },
            j_smallpox_birthright_zodiac = {
                name = {
                    "Birthright",
                    "{s:0.8,C:inactive}Dominion, Attuned{}",
                    "{s:0.5}created & art by {IMG:smallpox_ruby_paw,s:0.35}a{}{s:0.35} {}{C:red,s:0.5}Ruby{}",
                },
                text = {
                    {
                        "Changes effect based on",
                        "whether {C:purple}Tarots{}",
                        "{C:planet}Planets{} or {C:spectral}Spectrals{} were",
                        "the last used consumable type"
                    },
                }
            },
            j_smallpox_birthright_zodiac_Spectral = {
                name = {
                    "Birthright",
                    "{s:0.8,C:inactive}Dominion, Attuned{}",
                    "{s:0.5}created & art by {IMG:smallpox_ruby_paw,s:0.35}a{}{s:0.35} {}{C:red,s:0.5}Ruby{}",
                },
                text = {
                    {
                        "If played hand has exactly",
                        "{C:attention}2{} cards apply",
                        "a random {C:attention}Edition{}",
                        "to a random played card"
                    },
                    {
                        "Changes effect based on",
                        "whether {C:purple}Tarots{}",
                        "{C:planet}Planets{} or {C:spectral}Spectrals{} were",
                        "the last used consumable type"
                    },
                }
            },
            j_smallpox_birthright_zodiac_Planet = {
                name = {
                    "Birthright",
                    "{s:0.8,C:inactive}Dominion, Attuned{}",
                    "{s:0.5}created & art by {IMG:smallpox_ruby_paw,s:0.35}a{}{s:0.35} {}{C:red,s:0.5}Ruby{}",
                },
                text = {
                    {
                        "Gives the base {C:red}Mult{} and {C:blue}Chips{}",
                        "of the played hand"
                    },
                    {
                        "Changes effect based on",
                        "whether {C:purple}Tarots{}",
                        "{C:planet}Planets{} or {C:spectral}Spectrals{} were",
                        "the last used consumable type"
                    },
                }
            },
            j_smallpox_birthright_zodiac_Tarot = {
                name = {
                    "Birthright",
                    "{s:0.8,C:inactive}Dominion, Attuned{}",
                    "{s:0.5}created & art by {IMG:smallpox_ruby_paw,s:0.35}a{}{s:0.35} {}{C:red,s:0.5}Ruby{}",
                },
                text = {
                    {
                        "Retrigger all scored",
                        "{C:attention}enhanced{} cards"
                    },
                    {
                        "Changes effect based on",
                        "whether {C:purple}Tarots{}",
                        "{C:planet}Planets{} or {C:spectral}Spectrals{} were",
                        "the last used consumable type"
                    },
                }
            },
            j_smallpox_birthright_painted = {
                name = {
                    "Birthright",
                    "{s:0.8,C:inactive}The World looks White{}",
                    "{s:0.8,C:inactive}The World looks Red{}",
                    "{s:0.5}created & art by {IMG:smallpox_ruby_paw,s:0.35}a{}{s:0.35} {}{C:red,s:0.5}Ruby{}",
                },
                text = {
                    {
                        "Cards {C:attention}held in hand{} are",
                        "scored as if played",
                        "{C:attention}two{} times"
                    },
                }
            },
            j_smallpox_birthright_anaglyph = {
                name = {
                    "Birthright",
                    "{s:0.8,C:inactive}Bifurcated{}",
                    "{s:0.5}created & art by {IMG:smallpox_ruby_paw,s:0.35}a{}{s:0.35} {}{C:red,s:0.5}Ruby{}",
                },
                text = {
                    {
                        "You can hold a maximum",
                        "of {C:red}10{} Tags"
                    },
                    {
                        "{C:attention}Double Tags{} now create",
                        "an additional {C:dark_edition}Negative{} copy",
                        "of copied Tags"
                    }
                }
            },
            j_smallpox_birthright_plasma = {
                name = {
                    "Birthright",
                    "{s:0.8,C:inactive}REACTOR MELTDOWN IMMINENT{}",
                    "{s:0.5}created & art by {IMG:smallpox_ruby_paw,s:0.35}a{}{s:0.35} {}{C:red,s:0.5}Ruby{}",
                },
                text = {
                    {
                        "Scoring Operator set to",
                        "{C:blue}Chips{} ^ {C:red}2{}"
                    },
                    {
                        "{C:red}Mult{} operations instead",
                        "affect {C:blue}Chips{}"
                    },
                    {
                        "Balancing no longer occurs"
                    }
                }
            },
            j_smallpox_birthright_erratic = {
                name = {
                    "Birthright",
                    "{s:0.8,C:inactive}Absolute Entropy{}",
                    "{s:0.5}created & art by {IMG:smallpox_ruby_paw,s:0.35}a{}{s:0.35} {}{C:red,s:0.5}Ruby{}",
                },
                text = {
                    
                }
            }
        },
        --not actually an edition, used on tags
        Edition = {
            e_negative_tag = {
                name = "Negative",
                text = {
                    "{C:dark_edition}+#1#{} Tag Slot"
                }
            }
        },
        --ditto Edition, only used in localization
        Tag = {
            ["tag_smallpox_ruby_High Card"] = {
                name = "Pluto",
                text = { { "{C:red}+#1#{} Mult", "{C:blue}+#2#{} Chips" }, { "{C:red}Removed{} at the", "end of ante"} }
            },
            ["tag_smallpox_ruby_Pair"] = {
                name = "Mercury",
                text = { { "{C:red}+#1#{} Mult", "{C:blue}+#2#{} Chips" }, { "{C:red}Removed{} at the", "end of ante"} }
            },
            ["tag_smallpox_ruby_Three of a Kind"] = {
                name = "Venus",
                text = { { "{C:red}+#1#{} Mult", "{C:blue}+#2#{} Chips" }, { "{C:red}Removed{} at the", "end of ante"} }
            },
            ["tag_smallpox_ruby_Full House"] = {
                name = "Earth",
                text = { { "{C:red}+#1#{} Mult", "{C:blue}+#2#{} Chips" }, { "{C:red}Removed{} at the", "end of ante"} }
            },
            ["tag_smallpox_ruby_Four of a Kind"] = {
                name = "Mars",
                text = { { "{C:red}+#1#{} Mult", "{C:blue}+#2#{} Chips" }, { "{C:red}Removed{} at the", "end of ante"} }
            },
            ["tag_smallpox_ruby_Flush"] = {
                name = "Jupiter",
                text = { { "{C:red}+#1#{} Mult", "{C:blue}+#2#{} Chips" }, { "{C:red}Removed{} at the", "end of ante"} }
            },
            ["tag_smallpox_ruby_Straight"] = {
                name = "Saturn",
                text = { { "{C:red}+#1#{} Mult", "{C:blue}+#2#{} Chips" }, { "{C:red}Removed{} at the", "end of ante"} }
            },
            ["tag_smallpox_ruby_Two Pair"] = {
                name = "Uranus",
                text = { { "{C:red}+#1#{} Mult", "{C:blue}+#2#{} Chips" }, { "{C:red}Removed{} at the", "end of ante"} }
            },
            ["tag_smallpox_ruby_Straight Flush"] = {
                name = "Neptune",
                text = { { "{C:red}+#1#{} Mult", "{C:blue}+#2#{} Chips" }, { "{C:red}Removed{} at the", "end of ante"} }
            },
            ["tag_smallpox_ruby_Five of a Kind"] = {
                name = "Planet X",
                text = { { "{C:red}+#1#{} Mult", "{C:blue}+#2#{} Chips" }, { "{C:red}Removed{} at the", "end of ante"} }
            },
            ["tag_smallpox_ruby_Flush House"] = {
                name = "Ceres",
                text = { { "{C:red}+#1#{} Mult", "{C:blue}+#2#{} Chips" }, { "{C:red}Removed{} at the", "end of ante"} }
            },
            ["tag_smallpox_ruby_Flush Five"] = {
                name = "Eris",
                text = { { "{C:red}+#1#{} Mult", "{C:blue}+#2#{} Chips" }, { "{C:red}Removed{} at the", "end of ante"} }
            },
        }
    },
    misc = {
        dictionary = {
            k_switch_ex = "Switch!",
            k_last_change = "Last Change",
            k_sell_all = "Sell All",
            k_buy = "Buy",
            k_currently_invested = "Currently Invested",

            k_cycle = "Cycle",
            k_cycle_edition = "Cycle Edition",
            k_cycle_rank = "Cycle Rank",
            k_cycle_seal = "Cycle Seal",
            k_cycle_suit = "Cycle Suit",
            k_enhancement = "Enhancement",
            k_buy_card = "Buy Card"
        }
    }
}


