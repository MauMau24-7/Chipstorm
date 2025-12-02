return {
    descriptions = {
        Joker = {
            j_cstorm_three = {
                name = "3",
                text = {
                    {
                        "Each played {C:attention}3{}",
                        "gives {C:chips}+#1#{} Chips"
                    }
                },
            },
            j_cstorm_miscount = {
                name = "Miscount",
                text = {
                    {
                        "Gives {X:dark_edition,C:white}random{} Chips",
                        "after every {C:attention}hand",
                        "{C:inactive} (between #2# and #3#)"
                    }
                },
            },
            j_cstorm_juggling_jack = {
                name = "Juggling Jack",
                text = {
                    {
                        "Gives every discarded card",
                        "{C:chips}+#1#{} Chips"
                    }
                },
            },
            j_cstorm_final_push = {
                name = "Final Push",
                text = {
                    {
                        "{X:chips,C:white} X#1#{} the Chips",
                        "when it's your",
                        "{C:red}last hand"
                    }
                },
            },
            j_cstorm_pimp_my_deck = {
                name = "Pimp My Deck",
                text = {
                    {
                        "Gives {C:chips}+#1#{} Chips per",
                        "card with edition when",
                        "{C:red}only{} scoring edition cards"
                    }
                },
            },
            j_cstorm_slim_starter = {
                name = "Slim Starter",
                text = {
                    {
                        "Gives {C:chips}+#1#{} Chips",
                        "if there are {C:attention}#2# or less",
                        "cards in your deck"
                    }
                },
            },
            j_cstorm_the_boulder = {
                name = "The Boulder",
                text = {
                    {
                        "Gives {C:chips}+#1#{} Chips",
                        "for {C:attention}every{} {C:green}Stone Card",
                        "in scoring hand"
                    }
                },
            },
            j_cstorm_booster_bundle = {
                name = "Booster Bundle",
                text = {
                    "Gains {C:chips}+#2#{} Chips for every Booster",
                    "Pack opened with this Joker",
                    "{C:inactive} Currently {C:chips}+#1#"
                },
            },
            j_cstorm_one_hand_wonder = {
                name = "One Hand Wonder",
                text = {
                    "Gains {C:chips}+#2#{} Chips for every Blind",
                    "won in only {C:attention}1 hand",
                    "{C:inactive} Currently {C:chips}+#1#"
                },
            },
            j_cstorm_fast_draw = {
                name = "Fast Draw",
                text = {
                    "Gains {C:chips}+#2#{} Chips for every Blind",
                    "won {C:red}without discarding",
                    "{C:inactive} Currently {C:chips}+#1#"
                },
            },
            j_cstorm_arcana_hunter = {
                name = "{C:purple}Arcana Hunter",
                text = {
                    {
                        "Gains {C:chips}+#2#{} Chips for every",
                        "{C:attention}#3#{} {C:purple}Tarot{}, {C:dark_edition}Spectral{} or {C:chips}Planet{} cards",
                        "bought in the same shop",
                        "{C:inactive}Currently {C:chips}+#1#"
                    },
                    {
                        "{s:0.8}Consumables bought this shop: {C:attention,s:0.8}#4#"
                    }

                },
            },
            j_cstorm_chipy = {
                name = "Chipy",
                text = {
                    "Chipy earns {C:chips}+#2#{} Chips",
                    "every time a {E:1,C:attention}Joker{} is bought in the shop",
                    "{C:inactive}Currently {C:chips}+#1#"
                },
            },
            j_cstorm_second_thoughts = {
                name = "{C:cstorm_pure_red}Second {C:cstorm_pure_black}Thoughts",
                text = {
                    "{C:cstorm_pure_red}Second {C:cstorm_pure_black}Thoughts{} grants half the",
                    "score of the {C:cstorm_pure_red}strongest{} possible hand",
                    "if it is left {C:attention}unplayed{}"
                },
            },
            j_cstorm_human_captcha = {
                name = "Human Captcha",
                text = {
                    {
                        "Each played {C:attention}#2#{}",
                        "gets{C:green} retriggered #1#",
                        "times when scored",
                        "{s:0.8}Card changes every ante",
                    },
                    {
                        "{s:0.8,C:inactive}(Retriggers depend on",
                        "{s:0.8,C:inactive}the amount of times",
                        "{s:0.8,C:inactive}the card is played",
                        "{s:0.8,C:inactive}in a row)"
                    }
                },
            },
            j_cstorm_shnack = {
                name = "Shnack",
                text = {
                    {
                        "Gains {C:chips}+#2# Chips{} at",
                        "the end of every round",
                        "{C:inactive} Currently +#1#",
                    },
                    {
                        "{s:0.8}Dogs like these snacks very much",
                    },
                }
            },
            j_cstorm_dog = {
                name = "Dog",
                text = {
                    "Eats all {C:green}Shnack Jokers",
                    "at the start of a round and",
                    "gains it's chips as {C:attention}#2#x{} Mult",
                    "{C:inactive} Currently #1#",
                },
            },
            j_cstorm_suns_power = {
                name = "The Sun's Power",
                text = {
                    "Levels up the {C:mult}Mult",
                    "of {C:attention}#1#{} by {C:mult}+#2#{} if it is played",
                    "{C:inactive} Poker hand changes every game",
                },
            },
            j_cstorm_cosmic_joker = {
                name = "Cosmic Joker",
                text = {
                    "{C:green}#1# in #2#{} to give all planet",
                    "cards when a {C:attention}King{} is scored",
                },
            },
            j_cstorm_broken_odds = {
                name = "Broken Odds",
                text = {
                    "Adds 1 to all {C:attention}numerators and",
                    "{C:attention}denominators {C:green,E:1,S:1.1}probabilities",
                    "{C:inactive}(ex: {C:green}1 in 3{C:inactive} -> {C:green}2 in 4{C:inactive} = {C:green}1 in 2)",
                },
            },
            j_cstorm_joker_the_riveter = {
                name = "Joker The Riveter",
                text = {
                    {
                        "Makes every {C:attention}scored card",
                        "count as a {C:spades}Spade{}",
                    },
                    {
                        "{s:0.8,C:inactive}Keeps it's suit"
                    }
                },
            },
            j_cstorm_bargain_hunter = {
                name = "Bargain Hunter",
                text = {
                    {
                        "{C:attention}Reduces{} the costs in the",
                        "shop by {C:money}#1#%"
                    },
                },
            },
            j_cstorm_the_converter = {
                name = "The Converter",
                text = {
                    {
                        "Converts {C:mult}#1#{} Mult",
                        "to {C:chips}+#2#{} Chips"
                    },
                },
            },
            j_cstorm_riddle_joker = {
                name = "Riddle Joker",
                text = {
                    {
                        "{s:1.5}Riddle:",
                    },
                    {
                        "Gives either {C:mult}+#1#{} discard",
                        "or {C:chips}+#1#{} hand"
                    },
                },
            },
        },
        Other = {
            cstorm_credits = {
                name = " ",
                text = {
                    "{C:cstorm_mod}Custom Music:{} Myself :3",
                    -- " ",
                    -- "{C:cstorm_mod}Localization:{}",
                    -- "{C:attention}French:{} Keraloon",
                    -- "{C:attention}Simplified Chinese:{} Alophrine",
                    " ",
                    -- "{C:cstorm_mod}Archetype Ideas:{}",
                    -- "{C:cstorm_link}@Ignister{}: gyro/rina",
                    " ",
                    "Some ideas taken from these mods:",
                    --Add Mod names here
                    "{C:attention}All in Jest",
                    " ",
                    "{C:cstorm_mod}Special Thanks{} to the",
                    "{C:attention}Balatro{} Discord server <3"
                }
            },

            idea_credits = {
                name = "Idea:",
                text = {
                    "{C:purple}#1#"
                },
            },
            chatter_name = {
                name = "Chatter:",
                text = {
                    "{C:purple}#1#"
                },
            },
            captcha_retriggers_formula = {
                name = "Formula:",
                text = {
                    "{s:0.8,C:inactive}repetitions = square root of",
                    "{s:0.8,C:inactive}cards in a Row rounded down",
                    "{s:0.8,C:inactive} ",
                    "{s:0.8,C:inactive}repetitions | cards in a row",
                    "{s:0.8,C:inactive}0 | 0",
                    "{s:0.8,C:inactive}1 | 1 through 3",
                    "{s:0.8,C:inactive}2 | 4 through 8",
                    "{s:0.8,C:inactive}3 | 9 through 15",
                    "{s:0.8,C:inactive}and so on"
                }
            },
        },
    },
    misc = {
        dictionary = {
            a_handsize = "+#1# Hand Size",
            a_handsize_minus = "-#1# Hand Size",
            a_sold_tally = "#1#/#2# Sold",

            k_cstorm_github = "Github",
            k_cstorm_credits = "Credits",

            k_cstorm_chatter = "Chatter",

            -- ["$"] = "BOB"

            chipstorm_none = "None",

        },
        labels = {
            cstorm_chatter = "Chatter",
        },
    }
}
