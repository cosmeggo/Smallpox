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
            j_smallpox_examplejoker = {
                name = 'Joker+',
                text = {
                    "{C:mult}+#1#{} Mult"
                }
            },
            j_smallpox_grinch = {
                name = {
                    'The Grinch',
                    '{s:0.5}created by {s:0.5,C:green}soulware{}',
                },
                text = {
                   {
                    "{X:mult,C:white}+#1#{} to all {C:mult}+Mult{}",
                    "{X:mult,C:white}+#2#{} to all {X:mult,C:white}XMult{}",
                    "{X:mult,C:white}+(#2#/N){} to all {C:attention}higher-operation{} Mult",
                    "{C:inactive,s:0.9}N being 10^ the used operation{}"
                   },
                   {
                    "{X:mult,C:white}-#3#{} {C:attention}Base{} per round played",
                    "{C:inactive}(Base: #1#)"
                   }
                }
            },
            j_smallpox_mys_minty_vaccine = {
                name = {
                    "Vaccine",
                    "{s:0.5}created by {s:0.5,V:2}#2#{}"
                },
                text = {
                    "{X:dark_edition}^#1#{} Mult if all",
                    "other Jokers are",
                    "from other mods"
                }
            },
            j_smallpox_mys_minty_vaccine_alt = {
                name = {
                    "Vaccine",
                    "{s:0.5}created by {s:0.5,V:2}#2#{}"
                },
                text = {
                    "{X:dark_edition}^#1#{} Mult if",
                    "no other Jokers",
                    "are from {V:1}Smallpox"
                }
            },
            j_smallpox_demon_core = {
                name = {
                    "Demon Core",
                    '{s:0.5}created by {s:0.5,C:white}ThunderEdge{}',
                },
                text = {
                    "When {C:attention}Blind{} is selected,",
                    "this {C:attention}Joker{} gains {X:mult,C:white}X#1#{} Mult",
                    "and {C:attention}destroys{} a random",
                    "card in deck",
                    "{C:inactive}(Currently {X:mult,C:white}X#2#{C:inactive} Mult)",
                },
            },

            j_smallpox_bliss = {
                name = {
                    'Bliss',
                    '{s:0.5}created by {s:0.5,C:edition}LasagnaFelidae{}',
                },
                text = { 
                  "Gains {C:chips}#1#{} Chips if {C:attention}#2#{} suits or",
                  "more have been played.",
                  "{C:inactive}(Currently {}{C:chips}#3#{}{C:inactive} Chips.)"
                },
            },
       
            j_smallpox_blackjack = {
              name = {
                "Blackjack",
                "{s:0.5}created by {s:0.5,C:smallpox_typ0,E:1}SLDTyp0{}{}",
              },
              text = {
                "If you {C:attention}play{} two",
                "cards that total {C:attention}21{},",
              },
            },
            j_smallpox_Tatsu = {
            name = {
              "Butterfly Effect",
              "{s:0.5}created by {s:0.5,C:legendary,E:1}Tatsu{}{}",
              "{s:0.3}programmed by {s:0.3,C:smallpox_typ0,E:1}SLDTyp0{}{}"
            },
            text = {
              "{C:attention}Sell this card{} to",
              "{C:red}destroy all other Jokers{}",
              "and create an {C:attention}equal{}",
              "amount of {C:rare}Rare{} Jokers",
              "{C:inactive,s:0.8}(Sustains {}{C:dark_edition,s:0.8}Negative{}{C:inactive,s:0.8}){}"
              }
            },
            j_smallpox_Inky = {
              name = {
                "Restaurant Menu",
                "{s:0.5}created by {s:0.5,C:green,E:1}Inky{}{}",
                "{s:0.3}programmed by {s:0.3,C:smallpox_typ0,E:1}SLDTyp0{}{}"
                },
              text = {
                "{C:attention}When Sold,{}",
                "Create a random",
                "{C:attention}Food Joker{}"
                }
            },
        },
  },
  misc = {
    dictionary = {
      mintypox_name = "mys. minty"
    },
  },        
}
