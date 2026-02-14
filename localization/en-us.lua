
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
 
            j_smallpox_eyejoker = {
                name = {
                  'See Through The Joke',
                   "{s:0.5}created by {C:tarot,s:0.5}flynnsaneFellow{}{}",
                },
                text = {
                    "{C:attention}+6 Hand Size{}",
                    "{C:red}-4 card selection limit{}",
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

            j_smallpox_ins_oro = {
                name = {
                    "Ouroboros",
                    "{s:0.5}created by {C:blue,s:0.5}candycanearter",
                },
                text = {
                    "{X:mult,C:white}X#1#{} Mult",
                    "When this card is {C:attention}sold or {C:attention}destroyed",
                    "create a copy in the next shop",
                    "with an extra {X:mult,C:white}X#2#{} Mult"
              },
            },
            j_smallpox_antique_chair = {
                name = {
                    "Antique Chair",
                    "{s:0.5}created by {C:gold,s:0.5}cloudzXIII{}{}",
                },
                text = {
                    "This Joker gains {C:white,X:mult}X#2#{} Mult",
                    "when {C:dark_edition}swapped{} with",
                    "a card in the shop",
                    "{s:0.8}Gains {C:money,s:0.8}$1{} {s:0.8}of {C:attention,s:0.8}buy value{} {s:0.8}every {C:dark_edition,s:0.8}SWAP{}",
                    "{C:inactive}(Currently {C:white,X:mult}X#1#{}{C:inactive} Mult)"
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
            j_smallpox_gun = {
                name = {
                    "Rock Singer",
                    "{s:0.5}created by {s:0.5,E:smallpox_pink}TigerTHawk{}{}",
                    "{s:0.5}programmed by {s:0.5,C:smallpox_typ0,E:1}SLDTyp0{}{}"
                },
                text = {
                    "When {C:attention}Blind{} is selected,",
                    "destroy Joker to left and the right",
                    "and permanently add {C:attention}#2#x of {}",
                    "its sell value to this {C:red}Mult",
                    "{C:inactive}(Currently {C:white,X:red}x#1#{C:inactive} Mult)",
                },
            },
            j_smallpox_birthright = {
                name = {
                    "Birthright",
                    "{s:0.5}created {IMG:smallpox_ruby_paw,s:0.35}a{}{s:0.35} {}{C:red,s:0.5}Ruby{}",
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
                    "{s:0.5}created by {IMG:smallpox_ruby_paw,s:0.35}a{}{s:0.35} {}{s:0.35} {}{C:red,s:0.5}Ruby{}",
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
                    "{s:0.5}created by {IMG:smallpox_ruby_paw,s:0.35}a{}{s:0.35} {}{C:red,s:0.5}Ruby{}",
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
                    "{s:0.5}created by {IMG:smallpox_ruby_paw,s:0.35}a{}{s:0.35} {}{C:red,s:0.5}Ruby{}",
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
                    "{s:0.5}created by {IMG:smallpox_ruby_paw,s:0.35}a{}{s:0.35} {}{C:red,s:0.5}Ruby{}",
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
                    "{s:0.5}created by {IMG:smallpox_ruby_paw,s:0.35}a{}{s:0.35} {}{C:red,s:0.5}Ruby{}",
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
                    "{s:0.5}created by {IMG:smallpox_ruby_paw,s:0.35}a{}{s:0.35} {}{C:red,s:0.5}Ruby{}",
                },
                text = {
                    "Using a Planet card",
                    "provides its {C:red}Mult{} per level",
                    "and {C:blue}Chips{} per level",
                    "to all hands for the",
                    "remainder of the current ante"
                }
            },
            j_smallpox_birthright_ghost = {
                name = {
                    "Birthright",
                    "{s:0.8,C:inactive}Better Destiny{}",
                    "{s:0.5}created by {IMG:smallpox_ruby_paw,s:0.35}a{}{s:0.35} {}{C:red,s:0.5}Ruby{}",
                },
                text = {
                    {
                        "Shop contains an extra",
                        "{C:spectral}Spectral{} card slot",
                        "that can be rerolled"
                    }
                }
            },
            j_smallpox_birthright_nebula = {
                name = {
                    "Birthright",
                    "{s:0.8,C:inactive}Interstellar{}",
                    "{s:0.5}created by {IMG:smallpox_ruby_paw,s:0.35}a{}{s:0.35} {}{C:red,s:0.5}Ruby{}",
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
                    "{s:0.5}created by {IMG:smallpox_ruby_paw,s:0.35}a{}{s:0.35} {}{C:red,s:0.5}Ruby{}",
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
                    "{s:0.5}created by {IMG:smallpox_ruby_paw,s:0.35}a{}{s:0.35} {}{C:red,s:0.5}Ruby{}",
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
                    "{s:0.5}created by {IMG:smallpox_ruby_paw,s:0.35}a{}{s:0.35} {}{C:red,s:0.5}Ruby{}",
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
                    "{s:0.5}created by {IMG:smallpox_ruby_paw,s:0.35}a{}{s:0.35} {}{C:red,s:0.5}Ruby{}",
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
                    "{s:0.5}created by {IMG:smallpox_ruby_paw,s:0.35}a{}{s:0.35} {}{C:red,s:0.5}Ruby{}",
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
                    "{s:0.5}created by {IMG:smallpox_ruby_paw,s:0.35}a{}{s:0.35} {}{C:red,s:0.5}Ruby{}",
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
                    "{s:0.5}created by {IMG:smallpox_ruby_paw,s:0.35}a{}{s:0.35} {}{C:red,s:0.5}Ruby{}",
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
                    "{s:0.5}created by {IMG:smallpox_ruby_paw,s:0.35}a{}{s:0.35} {}{C:red,s:0.5}Ruby{}",
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
                    "{s:0.5}created by {IMG:smallpox_ruby_paw,s:0.35}a{}{s:0.35} {}{C:red,s:0.5}Ruby{}",
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
                    "{s:0.5}created by {IMG:smallpox_ruby_paw,s:0.35}a{}{s:0.35} {}{C:red,s:0.5}Ruby{}",
                },
                text = {
                    
                }
            },
             j_smallpox_missingposter = {
                name = {
                  "Missing Poster", 
                  "{s:0.5}created by {C:blue,s:0.5}LFMoth{}{}",
                  "{s:0.5}art by {C:blue,s:0.5}LFMoth{}{}"
                },
                text = {
                    "When a {C:attention}Joker{} is {C:attention}destroyed{}",
                    "gain {C:money}$#1#{}"
                }
            },
            j_smallpox_theriantropy = {
                name = {
                    "Theriantropy",
                    "{s:0.5}created by Jewel",
                },
                text = {
                "When a {C:attention}face card{} is {C:attention}scored,",
                "{C:green}1 in 2{} chance to make it {C:gold}Wild,",
                "{C:green}1 in 10{} chance to destroy this {C:attention}Joker",
                "and create a copy of {C:spectral}The Cryptid", 
                "{s:0.8,C:inactive}(Must have room)",
                    
                }
            },
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
      k_buy_card = "Buy Card",
      k_smallpox_rhythm_miss = "Missed." ,
      spox_flash_warn = 
            "Welcome to Smallpox!\nThis mod was made by 45 developers and artists\nover the course of just under 3 weeks.\n\nPlease note that some jokers utilise\nFlashing lights.\nThere is a config option for this\nIf it effects you.\n\nEnjoy the mod! -Smallpox Team"
      
    },
  },        

}
