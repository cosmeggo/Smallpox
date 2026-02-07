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
            j_smallpox_settheory = {
                name = {
                      "Set Theory",
                      '{s:0.5}created by {s:0.5,C:dark_edition}IamArta{}',

                }
                text = {
                    "Played cards with a {C:attention}rank{} that",
                    "scored in the {C:attention}last{} played hand",
                    "give {X:mult,C:white}X#1#{} Mult when scored"
                }
            }
            j_smallpox_astro = {
                name = {
                     "Astro",
                     '{s:0.5}created by {s:0.5,C:blue}Astro{}',
                     "{s:0.5}programmed by {s:0.5,C:edition}LasagnaFelidae{}{}"
                },
                text = { 
                    "Grants {C:chips}#1#{} Chips",
                    "for each {V:1}#2#{} card",
                    "in your deck.",
                    "{s:0.8,C:inactive}(Currently {}{s:0.8,C:chips}#3#{}{s:0.8,C:inactive} Chips. [#4#])"
                }
            },
            j_smallpox_scales_of_justice = {
                name = {
                  "Scales of Justice", 
                  "{s:0.5}created by {C:purple,s:0.5}Revo",
                  "{s:0.5}art by {C:blue,s:0.5}Plasma"
                },
                text = {
                    "{X:mult,C:white}X#1#{} Mult if the",
                    "{C:attention}sum{} of the scored cards' ranks is even", 
                    "Gives an {C:green}extra{} {X:mult,C:white}X#2#{} Mult",
                    "if there are {C:attention}equal{} amounts of jokers",
                    "to this card's left and right.",
                }
            },

            j_smallpox_sillyzteto = {
                name = {
					"Kasane Teto",
					"{s:0.5}created by {C:purple,s:0.5}Sillyz",
                  	"{s:0.5}art by {C:blue,s:0.5}Plasma,{} {C:edition,s:0.5}LasagnaFelidae{}{}"
					},
                text = {
                    "Gain {X:mult,C:white}X#1#{} Mult for every",
                    "{C:attention}Ace{} of {C:hearts}Hearts{} destroyed",
                    "{C:inactive}(Currently{} {X:mult,C:white}X#2#{} {C:inactive}Mult)",
                },
            },
            j_smallpox_functions = {
                name = {
                    'Functions',
                    '{s:0.5}created by Breuuh',
                },
                text = {
                   {
                    "After {C:attention}scoring{} or {C:attention}use{}",
                    "{C:attention}randomize{} the {C:spectral,E:1}scoring operator{}",
                    "between {C:blue}Chips{} and {C:red}Mult{}",
                    "{C:inactive}(Currently {V:1,E:2}#1#{C:inactive})",
                   },
                   {
                    "Can only be {C:attention}used",
                    "{C:attention}once{} per round",
                   }
                }
            },
            j_smallpox_smallpox = {
                name = {
                    'Smallpox',
                    '{s:0.5}created by {s:0.5,C:blue}Plasma{}',
                },
                text = {
                    "{X:mult,C:white} X#1# {} Mult",
                    "{C:green}#2# in #3#{} chance for a",
                    "random Joker to become",
                    "{V:1}infected{} with {C:attention}Smallpox{}"
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
                    "Debuffs {V:1}#1#{} Jokers",
                    "Debuffed cards give {X:mult,C:white}X#3#{} Mult"
                }
            },
            j_smallpox_demon_core = {
                name = {
                    "Demon Core",
                    '{s:0.5}created by {s:0.5,V:1}ThunderEdge{}',
                },
                text = {
                    "When {C:attention}Blind{} is selected,",
                    "this {C:attention}Joker{} gains {X:mult,C:white}X#1#{} Mult",
                    "and {C:red}destroys{} a random",
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
                    "Gains {C:chips}#1#{} Chips ",
                    "if {C:attention}#2#{} or more Suits",
                    "have been played",
                    "{C:inactive}(Currently {}{C:chips}#3#{}{C:inactive} Chips.)"
                },
            },
       
            j_smallpox_blackjack = {
              name = {
                    "Blackjack",
                    "{s:0.5}created by {s:0.5,C:smallpox_typ0,E:1}SLDTyp0{}{}",
              },
              text = {
                    "If {C:attention}two{} cards",
                    "are {C:attention}played{} that total {C:attention}21{}",
                    "in Chips, gain"
              },
            },
            j_smallpox_Tatsu = {
                name = {
                    "Butterfly Effect",
                    "{s:0.5}created by {s:0.5,V:1,E:1}Tatsu{}{}",
                    "{s:0.5}programmed by {s:0.5,C:smallpox_typ0,E:1}SLDTyp0{}{}"
                },
                text = {
                    "{C:attention}Sell{} this card to",
                    "{C:red}destroy{} all other Jokers",
                    "and create an {C:attention}equal{}",
                    "amount of {C:rare}Rare{} Jokers",
                    "{C:inactive,s:0.8}(Sustains {}{C:dark_edition,s:0.8}Negative{}{C:inactive,s:0.8}){}"
                }
            },
            j_smallpox_Inky = {
              name = {
                    "Restaurant Menu",
                    "{s:0.5}created by {s:0.5,C:green,E:1}Inky{}{}",
                    "{s:0.5}programmed by {s:0.5,C:smallpox_typ0,E:1}SLDTyp0{}{}"
                },
              text = {
                    "When {C:attention}sold,{}",
                    "Create a random",
                    "{C:attention}Food Joker{}"
                }
            },
            j_smallpox_miller = {
                name = {
                    "VOIDWALKER",
                    "{s:0.5}created by Abel",
                },
                text = {
                    "Reduce blind",
                    "requirements by", 
                    "{C:attention}#1#%{}",
                    },
                },
            j_smallpox_examplejoker = {
                name = 'Joker+',
                text = {
                    "{C:mult}+#1#{} Mult",
					"{C:inactive,s:0.8}our lovely chud son"
                }
            },
            j_smallpox_hunter = {
                name = {
                    "Notebook Sketch",
                    "{s:0.5}created by {s:0.5,C:planet,E:1}Hunter{}{}",
                    "{s:0.5}programmed by {s:0.5,C:smallpox_typ0,E:1}SLDTyp0{}{}"
                },
                text = {
                    "Gain {C:mult}X0.1 Mult{}",
                    "Per hand drawn.",
                    "{C:attention}Halves{} at end of ante.",
                    "{C:inactive,s:0.8}[Currently {C:mult}X#1#{C:inactive,s:0.8}]"
                },
            },

            j_smallpox_poxofthewild = {
                name = {
                    'The Pox of The Wild',
                    "{s:0.5}created by {s:0.5,C:spectral,E:smallpox_rainbow}Tech{}{}",
                    "{s:0.5}programmed by {s:0.5,C:edition}LasagnaFelidae{}{}",
					          "{s:0.5}art by {s:0.5,C:blue}Plasma{}{}"
                },
                text = {
                    {
                      'For every {C:attention}Smallpox{} Joker:',
                      '{X:common,C:white}+#1#{}/{X:uncommon,C:white}+#2#{}/{X:rare,C:white}+#3#{}/{X:legendary,C:white}+#4#{} xMult',
                      'according to their {C:dark_edition}rarity.{}',
                      '{X:green,C:white}Meme{} and {X:purple,C:white}Disease{} Jokers grant',
                      'an additional {X:mult,C:white}+#5#{} xMult',
                    },
                    {
                      'For every {C:rare}Rare{} and {C:legendary}Legendary{} Joker:',
                      'retrigger {C:attention}#6#{} time{C:inactive}(s){} this Joker.',
                    },
                },
            },
            j_smallpox_spikedball = {
                name = {
                    'Spiked Ball',
                    "{s:0.5}created by {s:0.5,C:dark_edition}Pi_Cubed{}{}",
                },
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
            j_smallpox_polymorphine = {
                name = {
					'Polymorphine',
					"{s:0.5}created by {s:0.5,C:blue}NinjaBanana{}{}",
					"{s:0.5}art by {s:0.5,C:money,E:smallpox_rainbow}???{}{}",
				},
                text = {
                    "On reroll, {C:attention}randomize{}",
                    "held consumeables"
                }
            },
        },
		tooltips = {
			tt_smallpox_potw_table = {
				name = "Rarity xMults",
				text = {
					'{C:common}Common{}: {X:mult,C:white}X#1#{}',
					'{C:uncommon}Uncommon{}: {X:mult,C:white}X#2#{}',
					'{C:rare}Rare{}: {X:mult,C:white}X#3#{}',
					'{C:legendary}Legendary{}: {X:mult,C:white}X#4#{}',
				},
			},
		},
  },
  misc = {
    dictionary = {
      mintypox_name = "mys. minty"
    },
  },        
}

