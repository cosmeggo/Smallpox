
return {
    misc = {
        dictionary = {
            k_smallpox_rhythm_miss = "Missed." 
        },
    },
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

            j_smallpox_factory_line = {
                name = {
                    "Factory Line",
                    "{s:0.5}created by {C:lily_pink,s:0.5}Lily Felli{}{}",
                },
                text = {
                    "When the counter reaches {C:attention}#1#{},",
                    "create a random {C:rare}Rare{} Joker",
                    "Counter increases by {C:attention}#3#{} for every",
                    "other Joker owned at end of round",
                    "{s:1.2,C:attention}#2#{} / {s:1.2,C:attention}#1#{}",
                    "{C:inactive}(Must have room)",
                }
            },
            j_smallpox_tjetsu_sumi = {
                name = {
                    "Sumi",
                    "{s:0.5}created by {C:tarot,s:0.5}Tje.Tsu{}{}",
                },
                text = {
                    {"Scored {C:hearts}Hearts{} give",
                    "{X:mult,C:white}X#2#{} Mult if scored",
                    "after a {C:spades}Spade{}"},
                    {"Scored {C:spades}Spades{} give",
                    "{X:chips,C:white}X#1#{} Chips if scored",
                    "after a {C:hearts}Heart{}"},
                    {"{C:inactive}(Last scored : {V:1}#3#{}{C:inactive}){}"}
                }
            },
 
            j_smallpox_seethrujoke = {
                name = {
                  'See Through The Joke',
                   "{s:0.5}created by {C:tarot,s:0.5}flynnsaneFellow{}{}",
                },
                text = {
                    "{C:attention}+6 Hand Size{}"
                    "{C:red}-4 card selection limit{}"
                    "{C:inactive}Art and code done by FlynnsaneFellow{}"
                  }
              },
               j_smallpox_zucchiniatlas = {
                name = {
                  "Atlas", 
                  "{s:0.5}created by {C:blue,s:0.5}ABuffZucchini{}{}",
                },
                text = {
                    "{X:mult,C:white}X#1#{} Mult",
                    "This Joker {C:attention}gains{} {X:mult,C:white}X#4#{} Mult",
                    "when using a {C:planet}Planet{} card",
                    "{C:red}Loses{} {X:mult,C:white}X#4#{} Mult at end of round",
             
                    "{s:0.8,C:inactive}(Max of {X:mult,C:white,s:0.8}X#2#{s:0.8,C:inactive}, card destroyed at {X:mult,C:white,s:0.8}X#3#{s:0.8,C:inactive}){}"
                }
            },
            j_smallpox_rhythm = {
                name = {
                        'Amp Up!',
                        '{s:0.5}created by {s:0.5,V:1}M0xes{}',
                },
                text = {
                    "This Joker gains {C:chips}+#1#{} Chips",
					"per {C:attention}consective{} hand played",
					'when "{C:chips}Joker!{}" is lit',
					"{C:inactive}(Currently {C:chips}+#2#{C:inactive} Chips)"
                },
            },
            j_smallpox_puzzlevision = {
                name = {
                    "Puzzlevision",
                    '{s:0.5}created by {s:0.5,C:blue}FireIce421{}',
                },
                text = {
                    {
                    "Gain {C:mult}Mult{} based on the run's {C:attention}Round{}",
                    "Gain {X:mult,C:white}XMult{} based on the run's {C:attention}Ante{}",
                    "Gain {C:money}Money{} based on the amount of owned {C:attention}Jokers{}",
                    "{C:inactive}Currently: {C:mult}+#2# Mult{C:inactive}, {X:mult,C:white}X#1#{C:inactive} XMult, and {C:money}#3#${}",
                    "{s:0.9,C:inactive}Updates when Blind is selected"
                    },{
                        "{s:0.9,C:inactive}It's TV Time; with your friend, Mr. Puzzles!",
                        "{s:0.9,C:inactive}It's TV Time; take a break from your troubles!",
                        "{s:0.9,C:inactive}WTF IS A COPYRIGHT 2023-2026"
                    }
                }
            },
			j_smallpox_missingnumber = {
                name = {
                    "Stained Glass Window",
                    '{s:0.5}created by {s:0.5,C:smallpox_fire}missingnumber{}',
					"{s:0.5}programmed by {s:0.5,C:smallpox_typ0,E:1}SLDTyp0{}{}",
                },
                text = {
                    "Played {C:hearts}Hearts{} cards become {C:attention}Glass{}",
                    "{C:attention}Glass{} {C:hearts}Hearts{} cards grant",
					"{X:blue,C:white}X1.5{} Chips when scored{}",
                }
            },
            j_smallpox_roomtemperaturecarrot = {
                name = {
                    'Room Temperature Carrot',
                    '{s:0.5}created by {s:0.5,C:gold}RainStar{}',
                },
                text = {
                    {
                    "Whenever you gain {C:money}${}, gain {C:attention}+#3#{}",
                    "Carrocoins per {C:money}${}",
                    },
                    {
                    "{C:attention}Carrocoins{} can be used to either {C:attention}upgrade{}",
                    "{X:mult,C:white}XMult{} and {X:chips,C:white}XChips{} by {X:attention,C:white}+X#4#{} per {C:attention}#5#{} Carrocoin",
                    "or can be {C:attention}converted{} into {C:money}${} at a rate of",
                    "{C:money}$1{} per {C:attention}#6#{} Carrocoins",
                    },
                    {
                    "{C:inactive}(Currently {C:attention}#1# Carrocoins{C:inactive}",
                    "{C:inactive}and{} {X:attention,C:white}X#2#{C:inactive}, {X:mult,C:white}XMult{C:inactive} and {X:chips,C:white}XChips{C:inactive})",
                    }
                }
            },
            j_smallpox_nolittering = {
                name = {
                      'No Littering',
                      '{s:0.5}created by {s:0.5,C:white}GhostSalt{}{}',
                },
                text = {
                    "Gains {C:mult}+#1#{} Mult",
                    "if hand is played",
                    "without {C:attention}discards{}",
                    "{C:inactive}(Currently {C:mult}+#2#{C:inactive} Mult){}"
                }
            },
            j_smallpox_settheory = {
                name = {
                      "Set Theory",
                      '{s:0.5}created by {s:0.5,C:dark_edition}IamArta{}',

                },
                text = {
                    "Played cards with a {C:attention}rank{} that",
                    "scored in the {C:attention}last{} played hand",
                    "give {X:mult,C:white}X#1#{} Mult when scored"
                }
            },
            j_smallpox_astro = {
                name = {
                     "Astro",
                     '{s:0.5}created by {s:0.5,C:blue}Astro{}',
                     "{s:0.5}programmed by {s:0.5,C:edition}LasagnaFelidae{}{}"
                },
                text = { 
                    "{C:chips}+#1#{} Chips",
                    "for each {V:1}#2#{} card",
                    "in your deck.",
                    "{s:0.8,C:inactive}(Currently {}{s:0.8,C:chips}+#3#{}{s:0.8,C:inactive} Chips. [#4#])"
                }
            },
            j_smallpox_scales_of_justice = {
                name = {
                  "Scales of Justice", 
                  "{s:0.5}created by {C:purple,s:0.5}Revo{}{}",
                  "{s:0.5}art by {C:blue,s:0.5}Plasma{}{}"
                },
                text = {
                    "{X:mult,C:white}X#1#{} Mult if the {C:attention}sum{} of",
                    "the scored cards' ranks is {C:attention}even{}",
                    "Gives an {C:green}extra{} {X:mult,C:white}X#2#{} Mult if there",
                    "are {C:attention}equal{} amounts of jokers",
                    "to this card's left and right.",
                }
            },

            j_smallpox_sillyzteto = {
                name = {
                      "Kasane Teto",
                      "{s:0.5}created by {C:purple,s:0.5}Sillyz",
                      "{s:0.5}art by {C:blue,s:0.5}Plasma, {C:edition,s:0.5}LasagnaFelidae{}{}{}"
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
                    '{s:0.5}created by {s:0.5,C:blue}Plasma{}{}',
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
                    '{s:0.5}created by {s:0.5,C:green}soulware{}{}',
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
            j_smallpox_egbert = {
                name = {
                    'John Egbert',
                    '{s:0.5}created by {s:0.5,C:spectral}FirstTry{}{}',
                    },    
                text = {
                    "Gain {X:chips,C:white}X#2#{} Chips when",
                    "scoring hands with",
                    "{C:attention}odd{} ranked cards",
                    "{C:inactive}(A, 9, 7, 5, 3)",
                    "{C:inactive}(Currently {C:white,X:chips}X#1#{C:inactive} Chips){}"
                }
            },
            j_smallpox_mys_minty_vaccine = {
                name = {
                    "Vaccine",
                    "{s:0.5}created by {s:0.5,V:2}#2#{}"
                },
                text = {
                    "Debuffs {V:1}#1#{} Jokers",
                    "{C:inactive}Debuffed cards give{} {X:mult,C:white}X#3#{} {C:inactive}Mult{}"
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
                    "Gains {C:chips}+#1#{} Chips ",
                    "if {C:attention}#2#{} or more Suits",
                    "have been played",
                    "{C:inactive}(Currently {}{C:chips}+#3#{}{C:inactive} Chips.)"
                },
            },
       
            j_smallpox_blackjack = {
              name = {
                    "Blackjack",
                    "{s:0.5}created by {s:0.5,C:smallpox_typ0,E:1}SLDTyp0{}{}",
              },
              text = {
                    "If {C:attention}two{} cards are",
                    "{C:attention}played{} that total {C:attention}21{}",
                    "in {C:chips}Chips{}, gain"
              },
            },
            j_smallpox_Tatsu = {
                name = {
                    "Butterfly Effect",
                    "{s:0.5}created by {s:0.5,V:1,E:1}Tatsu{}{}",
                    "{s:0.5}programmed by {s:0.5,C:smallpox_typ0,E:1}SLDTyp0{}{}"
                },
                text = {
                    "Sell this card to {C:attention}destroy{}",
                    "all other Jokers and",
                    "create an {C:attention}equal amount{}",
                    "of {C:rare}Rare{} Jokers",
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
                    "Sell this Joker to create",
                    "a free {C:attention}Food Joker{}"
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
                    "Gain {X:mult,C:white}X0.1{} Mult per hand drawn",
                    "Gained mult {C:attention}halves{} at end of ante.",
                    "{C:inactive,s:0.8}[Currently {X:mult,C:white}X#1#{C:inactive,s:0.8}]"
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
                      'For every {C:rare}Rare{} and {C:legendary}Legendary{} Joker',
                      'retrigger this Joker {C:attention}#6#{} time{C:inactive}(s){}',
                    },
                },
            },
            j_smallpox_spikedball = {
                name = {
                    'Spiked Ball',
                    "{s:0.5}created by {s:0.5,V:1}pi_cubed{}",
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
                    "held consumables"
                },
            },
            j_smallpox_susie = {
                name = {
                      "Susie",
                      "{s:0.5}created by {s:0.5,C:white,E:smallpox_pink}MetaNite64{}{}",
                      "{s:0.5}art by {s:0.5,C:blue}Plasma{}{}",
                    },
                text = {
                    {
                        "Scored {C:attention}8{} and {C:attention}6{} are",
                        "enhanced to {C:attention}Steel{} cards",
                        "when played"
                    },
                    {
                        "Played {C:attention}Steel{} cards give",
                        "{C:chips}+#1#{} Chips when scored"
                    },
                },
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
      mintypox_name = "mys. minty",
      k_steel = "Steel",
    },
  },        
}


