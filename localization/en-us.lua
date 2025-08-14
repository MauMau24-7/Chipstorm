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
                        "Gives {X:dark_edition,C:white}random{} {C:chips}Chips",
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
                        "{X:chips,C:white} X#1# {} the {C:chips}Chips",
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
                        "{C:red}only {C:black}scoring edition cards"
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
                        "if there is at least",
                        "{C:green}1 Stone Card{} in scoring hand"
                    }
                },
            },
            j_cstorm_foil_factor = {
                name = "Foil Factor",
                text = {
                    {
                        "Gives {C:chips}+#1#{} Chips",
                        "for every foil card played"
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
        },
        Enhanced = {
            m_cstorm_cracked_stone = {
                name = "Cracked Stone",
                text = {
                    "Gives {X:chips,C:white} X#1# {}",
                    "when scored"
                }
            }
        },
        cstorm_Tokens = {
            c_cstorm_void_chip = {
                name = "Void Chip",
                text = {
                    "{C:attention}Next hand{} gives",
                    "{C:chips}+#1#{} but you can",
                    "only play #2# card"
                }
            }
        },
        Blind = {
            bl_cstorm_green_light_red_light = {
                name = "TESTING",
                text = {
                    "TESTING"
                }
            },
            bl_cstorm_slots = {
                name = "Slots",
                text = {
                    "This is a litteral slot machine"
                }
            }
        },
        Other = {
            p_cstorm_chip_stack = {
                name = "Chip Stack",
                text = {
                    "Choose {C:attention}#1#{} of up to",
                    "{C:attention}#2#{} {C:purple}Tokens",
                    "{C:inactive}(Doesn't get used immediately)"
                }
            },
            cstorm_death = {
                name = "Death",
                text = {

                    "If you still have this card",
                    "after #1# rounds, immediately lose",
                    "{C:red}#2# rounds left..."
                },
            },
        },
    },
    misc = {
        dictionary = {
            a_handsize = "+#1# Hand Size",
            a_handsize_minus = "-#1# Hand Size",
            a_sold_tally = "#1#/#2# Sold",

            k_cstorm_Tokens = "Token",
            b_cstorm_Tokens_cards = "Tokens",

            k_chip_stack = "Gambler's Thing",

            -- ["$"] = "BOB"
        },
        labels = {
            cstorm_Tokens = "Tokens",

            cstorm_cracked_stone = "Cracked Stone",

            cstorm_death = "Death",
        }
    }
}
