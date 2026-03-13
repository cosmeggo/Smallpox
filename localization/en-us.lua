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
                },
                text = {
                    {
                    "Counter increases by {C:attention}#3#{} for every",
                    "other Joker owned at end of round",
                    "{s:1.2,C:attention}#2#{} / {s:1.2,C:attention}#1#{}",
                    },
                    {
                    "When the counter reaches {C:attention}#1#{},",
                    "create a random {C:rare}Rare{} Joker",
                    "{C:inactive}(Must have room)",
                    },
                }
            },
            j_smallpox_tjetsu_sumi = {
                name = {
                    "Sumi",
                },
                text = {
                    {"Scored {C:hearts}Hearts{} give",
                    "{X:mult,C:white}X#2#{} Mult if scored",
                    "after a {C:spades}Spade{}"},
                    {"Scored {C:spades}Spades{} give",
                    "{X:chips,C:white}X#1#{} Chips if scored",
                    "after a {C:hearts}Heart{}"},
                    {"{C:inactive}(Last scored: {V:1}#3#{}{C:inactive}){}"}
                }
            },
            j_smallpox_iwillnever = {
                    name = {
                        "I Will never use JokerForge to make mods again", 
                        },
                    text = {
                        {
                         "Gives {X:mult,C:white}X3{} Mult if",
                         "{C:green}JokerForge{} sucks"
                        }
                    },
            },
            j_smallpox_eyejoker = {
                name = {
                  'See Through The Joke',
                },
                text = {
                    "{C:attention}+6{} hand size",
                    "{C:red}-4{} card selection limit",
                  }
              },
               j_smallpox_zucchiniatlas = {
                name = {
                  "Atlas", 
                },
                text = {
                    "{X:mult,C:white}X#1#{} Mult",
                    "This Joker {C:attention}gains{} {X:mult,C:white}X#4#{} Mult",
                    "when using a {C:planet}Planet{} card",
                    "{C:red}Loses{} {X:mult,C:white}X#4#{} Mult at end of round",
             
                    "{s:0.8,C:inactive}(Max of {X:mult,C:white,s:0.8}X#2#{s:0.8,C:inactive}, card destroyed at {X:mult,C:white,s:0.8}X#3#{s:0.8,C:inactive}){}"
                }
            },
            j_smallpox_puzzlevision = {
                name = {
                    "Puzzlevision",
                },
                text = {
                    {
                    "When Blind is selected,",
                    "Gives {C:mult}Mult{} for every {C:attention}Round{}",
                    "Gives {X:mult,C:white}XMult{} for every 2 {C:attention}Antes{}",
                    "Gives {C:money}Money{} for every 2 {C:attention}Jokers{} owned",
                    "{C:inactive}Currently {C:mult}+#2#{C:inactive} Mult, {X:mult,C:white}X#1#{C:inactive} Mult, and {C:money}$#3#{}",
                    },
					          {
                        "{s:0.9,C:inactive}It's TV Time; with your friend, Mr. Puzzles!",
                        "{s:0.9,C:inactive}It's TV Time; take a break from your troubles!",
                        "{s:0.9,C:inactive}WTF IS A COPYRIGHT 2023-2026"
                    }
                }
            },
			j_smallpox_missingnumber = {
                name = {
                    "Stained Glass Window",
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
                },
                text = { 
                    "{C:chips}+#1#{} Chips",
                    "for each {V:1}#2#{} card",
                    "in your deck",
                    "{C:inactive}(Currently {}{C:chips}+#3#{}{C:inactive} Chips)"
                }
            },
            j_smallpox_scales_of_justice = {
                name = {
                  "Scales of Justice",
                },
                text = {
                    "{X:mult,C:white}X#1#{} Mult if the {C:attention}sum{} of",
                    "the scored cards' ranks is {C:attention}even{}",
                    "Gains an {C:green}extra{} {X:mult,C:white}X#2#{} Mult if there",
                    "are {C:attention}equal{} amounts of Jokers",
                    "to this card's left and right.",
                }
            },

            j_smallpox_sillyzteto = {
                name = {
                      "Kasane Teto",
                      },
                text = {
                    "This Joker gains {X:mult,C:white}X#1#{} Mult",
                    "for every {C:hearts}Heart{} destroyed",
                    "{C:inactive}(Currently{} {X:mult,C:white}X#2#{} {C:inactive}Mult)",
                },
            },
            j_smallpox_functions = {
                name = {
                    'Functions',
                },
                text = {
                   {
                    "After {C:attention}scoring{} or {C:attention}using{} this Joker",
                    "{C:attention}randomize{} the {C:spectral,E:1}scoring operator{}",
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
                },
                text = {
                    {
                    "{C:green}#2# in #3#{} chance for a",
                    "random Joker to become",
                    "{V:1}infected{} with {C:attention}Smallpox{}",
					"{C:inactive,s:0.8}(Can't infect {C:spades,s:0.8}Disease{C:inactive,s:0.8} Jokers){}"
                    },
                    {
                    "This Joker gains",
                    "{X:mult,C:white}X#4#{} Mult per {V:1}infection{}",
                    "{C:inactive}(Currently {}{X:mult,C:white}X#1#{}{C:inactive} Mult){}"
                    }
                }
            },
            j_smallpox_agency = {
                name = {
                  "The Agency",
                },
                text = {
                    {
                        "When hand starts, roll {C:attention}6 {C:red}D4s",
                        "{C:mult}+#1#{} Mult for every {C:red}3{} rolled",
                    },
                    {
                        "If exactly {C:attention}3 {C:red}3s{} are rolled, pick one:",
                        "- Counts this roll as {C:attention}3^3{} {C:red}3s{} rolled",
                        "- Replenish {C:attention}#3# {C:blue}hands{} and {C:red}discards",
                        "- Permanently increase Mult by {C:mult}#2#",
                    },
                },
            },

             j_smallpox_thecoin = {
                name = {
                  "THE COIN",
                },
                text = {
                    "{C:attention}Flips{} a coin when you need it most."
                },
            },
            j_smallpox_longsocks = {
                name = {
                    "Programmer Socks",
                },
                text = {
                    "Gains {X:mult,C:white}X#1#{} Mult for",
                    "each {C:attention}maid outfit{} you own",
                    "{C:dark_edition,E:1}in real life{}",
                    "{C:inactive}(Currently {X:mult,C:white}X#2#{}{C:inactive}){}{}"
                },
            },
            j_smallpox_fableofthemirrorbreaker = {
                name = {
                    "Fable of the Joke-Maker",
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
                },
                text = {
                    "Retrigger the {C:attention}Joker",
                    "to the right once"
                }
            },
            j_smallpox_lexi_fire_alarm = {
                name = {
                    "Fire Alarm",
                },
                text = {
                    "This Joker gains",
                    "{C:mult}+#2#{} Mult when the",
                    "score catches on fire",
                    "{C:inactive}(Currently {C:mult}+#1# {C:inactive}Mult)"
                },
            },
            j_smallpox_ren_metaldetector = {
                name = {
                  "Metal Detector",
                },
                text = {
                    "{E:1,C:attention}Drag{} this Joker around",
                    "to find {C:money}treasure!{}",
                    "{C:inactive,s:0.9}(Treasure spawns on new round)"
                },
            },
            j_smallpox_rhythm = {
                name = {
                        'Amp Up!',
                },
                text = {
                    "This Joker gains {C:chips}+#1#{} Chips",
                    "per {C:attention}consective{} hand played",
                    'when "{C:chips}Joker!{}" is lit',
                    "{C:inactive}(Currently {C:chips}+#2#{C:inactive} Chips)"
                },
            },
            j_smallpox_claus_dies = {
                name = {
                      "PK Thunder",
                },
                text = {
                    "{C:green}#1# in #4#{} chance to apply {X:red,C:white}X3{} Mult",
                    "and {C:attention}retriggers{} 3 extra times",
                    "{C:green}#3# in #6#{} chance to {C:attention}disable{} Boss Blind",
                    "when {C:attention}triggered{}"
                },
            },
            j_smallpox_osjoker = {
                name = {
                    "os.J{E:smallpox_err}1{}OKER{E:smallpox_err}1{}()",
                },
                text = {
                    {
                    "Playing a {C:chips}hand:",
                    "{C:mult}+#1#{} Mult",
                    "{C:mult}+#2#{} More Mult if scored in {C:attention}Friday{}",
                    "{X:mult,C:white}X#3#{} Mult for each {C:attention}played{} card if scored around {C:attention}4 PM{}",
                    "{X:chips,C:white}X#4#{} Chips for each held {C:attention}Consumable{} if scored in {C:attention}June{}",
                    "{C:chips}+1{} Chips for each unique {C:attention}ASCII{} character in {C:attention}Clipboard{}",
                    "Each {C:rare}Rare{} Joker gives {X:chips,C:white}X#12#{} Chips if {C:attention}CPU > #13# Cores{}",
                    "{C:chips}+#14#{} Chips for every {C:money}$5{} if {C:attention}F{} is pressed while also {C:attention}pressing{} {C:blue}Play Hand{}",
                    "{C:money}$#5#{} for each {C:attention}played{} card if {C:attention}FPS < 30{}",
                    },
                    {
                    "At end of round:",
                    "All Jokers gain {C:money}+$#6#{} value if {C:attention}Music Volume < 10{},",
                    "Gain {C:attention}Double Tag{} if {C:attention}Battery #7#% ~ #8#%{},",
                    "{C:green}#10# in #11#{} chance to create a {C:dark_edition}Negative{} {C:common}Common{} Joker when {C:attention}Blind{} is selected on {C:attention}Linux{},",
                    "{X:money,C:white}X#15#{} Money if {C:legendary,E:1}all conditions{} are met at end of shop"
                    },
                }
            },
            j_smallpox_ins_oro = {
                name = {
                    "Ouroboros",
                },
                text = {
                    "{X:mult,C:white}X#1#{} Mult",
                    "When this card is {C:attention}sold or {C:attention}destroyed",
                    "all copies of {C:attention}Ouroboros{} gain {X:mult,C:white}X#2#{} Mult",
                    "and this card repleaces the next shop slot"
               },
            },
            j_smallpox_antique_chair = {
                name = {
                    "Antique Chair",
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
                },
                text = {
                    "Debuffs {V:1}#1#{} Jokers",
                    "{C:inactive}Debuffed cards give{} {X:mult,C:white}X#3#{} {C:inactive}Mult{}"
                }
            },
            j_smallpox_demon_core = {
                name = {
                    "Demon Core",
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
                },
                text = { 
                    "Gains {C:chips}+#1#{} Chips ",
                    "if {C:attention}#2#{} or more Suits",
                    "have been played",
                    "{C:inactive}(Currently {}{C:chips}+#3#{}{C:inactive} Chips)"
                },
            },
       
            j_smallpox_blackjack = {
              name = {
                    "Blackjack",
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
                },
              text = {
                    "Sell this Joker to create",
                    "a free {C:attention}Food Joker{}"
                }
            },
            j_smallpox_miller = {
                name = {
                    "VOIDWALKER",
                },
                text = {{
                    "When a {C:attention}Blind{} is selected,",
                    "reduce Blind requirements", 
                    "by {C:attention}#1#%{}",
                },
                                              {
                        "{s:0.9,C:inactive}\"One day... You will know",
                        "{s:0.9,C:inactive}the Joy of Creation.\"",
                    }
                }
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
                },
                text = {
                    "Gain {X:mult,C:white}X0.1{} Mult per hand drawn,",
                    "{C:attention}halves{} all gained XMult at end of ante",
                    "{C:inactive}[Currently {X:mult,C:white}X#1#{C:inactive}]"
                },
            },

            j_smallpox_poxofthewild = {
                name = {
                    'The Pox of The Wild',
                },
                text = {
                    {
                      'For every other {C:attention}Smallpox{} Joker:',
                      '{X:common,C:white}+#1#{}/{X:uncommon,C:white}+#2#{}/{X:rare,C:white}+#3#{}/{X:legendary,C:white}+#4#{} xMult',
                      'according to their {C:dark_edition}rarity.{}',
                      '{X:green,C:white}Meme{} and {X:purple,C:white}Disease{} Jokers grant',
                      'an additional {X:mult,C:white}+#5#{} XMult',
                    },
                    {
                      'For every other {C:rare}Rare{} and {C:legendary}Legendary{} Joker',
                      'retrigger this Joker {C:attention}#6#{} time{C:inactive}(s){}',
                    },
                },
            },
            j_smallpox_spikedball = {
                name = {
                    'Spiked Ball',
                },
                text = {
                    {
                        "Adds some {C:attention}obstacles{}",
                        "to the screen during Blinds",
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
                    'Chaotic Polymorphine',
                  },
                text = {
                    "On reroll, {C:attention}randomize{}",
                    "held consumables",
					"{C:inactive,s:0.8}(Cannot create Rare Spectrals){}"
                },
            },
            j_smallpox_susie = {
                name = {
                      "Susie",
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
                },
                text = {
                    "When {C:attention}Blind{} is selected, {C:attention}destroy{}",
                    "Jokers on the left and right",
                    "and permanently add {C:white,X:attention}X#2#{} of",
                    "its sell value to {C:red}Mult",
                    "{C:inactive}(Currently {C:white,X:red}X#1#{C:inactive} Mult)",
                },
            },
            j_smallpox_birthright = {
                name = {
                    "Birthright",
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
                },
                text = {
                    {
                        "Play up to {C:blue}+#1#{}",
                        "extra cards"
                    },
                    {
                        "Scored cards past the first",
                        "{C:attention}4{} are retriggered"
                    }
                }
            },
            j_smallpox_birthright_yellow = {
                name = {
                    "Birthright",
                    "{s:0.8,C:inactive}Money, Money. Money{}",
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
                },
                text = {
                    "Once per ante open",
                    "a {C:red}Customisable{}",
                    "Playing Card shop"
                }
            },
            j_smallpox_birthright_checkered = {
                name = {
                    "Birthright",
                    "{s:0.8,C:inactive}Chromatic Aberration{}",
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
                },
                text = {
                    
                }
            },
             j_smallpox_missingposter = {
                name = {
                  "Missing Poster",
                },
                text = {
                    "When a {C:attention}Joker{} is",
                    "{C:attention}destroyed{}, gain {C:money}$#1#{}"
                }
            },
            j_smallpox_theriantropy = {
                name = {
                    "Theriantropy",
                },
                text = {
                "When a {C:attention}face card{} is {C:attention}scored,",
                "{C:green}#1# in #2#{} chance to make it {C:gold}Wild,",
                "{C:green}#3# in #4#{} chance to destroy this {C:attention}Joker",
                "and create a copy of {C:spectral}Cryptid",
                "{C:inactive}(Must have room)",
                    
                }
            },
            j_smallpox_rhythm = {
                name = {
                        'Amp Up!',
                },
                text = {
                    "This Joker gains {C:chips}+#1#{} Chips",
                    "per {C:attention}consective{} hand played",
                    'when "{C:chips}Joker!{}" is lit',
                    "{C:inactive}(Currently {C:chips}+#2#{C:inactive} Chips)"
                },
            },
            
        },
        Packs = {
            p_smallpox_SPOXPack1 = {
                name = "Smallpox Pack",
                text = { "Pick {C:attention}#1#{} card out",
                "{C:attention}#2#{} {C:dark_edition}Smallpox{} jokers!", }
            },
            p_smallpox_SPOXPack2 = {
                name = "Smallpox Pack",
                text = { "Pick {C:attention}#1#{} card out",
                "{C:attention}#2#{} {C:dark_edition}Smallpox{} jokers!", }
            },
            p_smallpox_SPOXPack3 = {
                name = "Jumbo Smallpox Pack",
                text = { "Pick {C:attention}#1#{} card out",
                "{C:attention}#2#{} {C:dark_edition}Smallpox{} jokers!", }
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
        },
      Other = {
            smallpox_fable_sticker = {
                name = "Treasured",
                text = {
                    "When this {C:attention}Joker{}",
                    "triggers, earn {C:gold}$1"
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
	},
    misc = {
        challenge_names = {
            c_smallpox_pandemic = "Pandemic",
            c_smallpox_bullethell = "Bullet Hell",
        },
        v_text = {
            ch_c_smallpox_bullethell_collision_gameover = { "{C:red}Lose the run{} if your cursor collides with an {C:attention}obstacle{}" },
            ch_c_smallpox_bullethell_reduced_scaling = { "{C:attention}Spiked Ball{}'s 'difficulty' scaling is {C:attention}slower{}" },
            ch_c_smallpox_bullethell_mod_ante = { "Win in Ante {C:attention}6{}" },
        },
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
			spox_flash_warn = "Warning!\n\nThis mod may contain flashing images which\nmay not be suitable for individuals with\nphotosensitive epilepsy.\n\nYou can disable flashing images in the Mod Menu\nby selecting [Config] and clicking [Photosensitive Mode]",
			smallpox_sockscale1 = "Hot Topic delivery for ",
			smallpox_sockscale2 = "Slopazon delivery for ",
			smallpox_sockscale3 = "This is a gift. I hope you like it, ",
			k_smallpox_triscendence = "!!! TRISCENDENCE !!!",
			k_smallpox_select_tri = "Select an additional Triscendence effect:",
			k_smallpox_tri_1 = "All Hands",
			k_smallpox_tri_2 = "Circle Back",
			k_smallpox_tri_3 = "Employee of the Moment",
			k_smallpox_tri_1_desc = "Counts this roll as 3^3 3s rolled",
			k_smallpox_tri_2_desc = "Replenish 3 hands and discards",
			k_smallpox_tri_3_desc = "Permanently increase Mult by 3",
            k_smallpox_breuhhh_use = "USE",
            k_smallpox_breuhhh_useactive = "Use Active",
            k_smallpox_mul = "multiplication",
            k_smallpox_add = "addition",
            k_smallpox_div = "division",
            k_smallpox_sub = "subtraction",
            k_smallpox_mod = "modulo",
            k_smallpox_avg = "average",
            k_smallpox_con = "concatenation",
            k_smallpox_min = "minimum",
            k_smallpox_max = "maximum",
            k_smallpox_com = "complement",
            k_smallpox_pow = "exponentiation",
            k_smallpox_fac = "factorial",
            k_smallpox_bal = "balance",
            k_smallpox_lsh = "leftshift",
            k_smallpox_hye = "hyper-e",
            k_smallpox_ran = "random",
            k_smallpox_non = "none",
            spox_credits_tab_name = "Credits",
            spox_helpers_tab_name = "Project Staff",
            spox_contributers_tab_name = "Contributers",
            spox_helpers = "Plasma, LasagnaFelidae, SLDTyp0, M0xes",
            spox_credits_tab_1 = "Mysthaps M0xes LasagnaFelidae Lexi Edward Robinson PokeRen GhostSalt Nxkoo Jewel CloudzXIII Astro AbuffZucchini SLDTyp0 LilyFelli",
            spox_credits_tab_2 = "ProdByProto Inky IamArta Tje.Tsu pi_cubed Metanite64 soulware mys. minty Ruby Tatsu ThunderEdge Breuuh Sillyz Hunter",
            spox_credits_tab_3 = "isotypical NinjaBanana FireIce421 TigerTHawk Rainstar notmario Plasma Revo FlynnsaneFellow missingnumber Abel FirstTry Tech Lyre",
            Spox_Discord = "Join The Smallpox Discord!",
            Spox_Description = "Smallpox is a collaborative mod where each Joker is made by a different person!"
		},
		labels = {
			smallpox_fable_sticker = "Treasured",
		},

	},        
}






