return {
    descriptions = {
        Joker = {
            -- j_cstorm_sample_wee = {
            --     name = "Sample Wee",
            --     text = {
            --         "This Joker gains",
            --         "{C:chips}+#2#{} Chips when each",
            --         "played {C:attention}2{} is scored",
            --         "{C:inactive}(Currently {C:chips}+#1#{C:inactive} Chips)",
            --     },
            -- },
            -- j_cstorm_sample_obelisk = {
            --     name = "Sample Obelisk",
            --     text = {
            --         {
            --             "This Joker gives {X:mult,C:white} X#1# {} Mult",
            --             "for each time you've played this {C:attention}hand",
            --         }
            --     },
            -- },
            -- j_cstorm_sample_specifichand = {
            --     name = "Sample Specific Hand",
            --     text = {
            --         {
            --             "If the hand played is #1#,",
            --             "Gives {X:mult,C:white} X#2# {} Mult"
            --         }
            --     },
            -- },
            -- j_cstorm_sample_money = {
            --     name = "Sample Money",
            --     text = {
            --         {
            --             "Earn (Ante x 2) {C:money}${} at",
            --             "end of round, also here's some text effects:",
            --             "{C:money} money{}, {C:chips} chips{}, {C:mult} mult{}, {C:red} red{}, {C:blue} blue{}, {C:green} green{}",
            --             "{C:attention} attention{}, {C:purple} purple{}, {C:inactive} inactive{}",
            --             "{C:spades} spades{}, {C:hearts} hearts{}, {C:clubs} clubs{}, {C:diamonds} diamonds{}",
            --             "{C:tarot} tarot{}, {C:planet} planet{}, {C:spectral} spectral{}",
            --             "{C:edition} edition{}, {C:dark_edition} dark edition{}, {C:legendary} legendary{}, {C:enhanced} enhanced{}",
            --         }
            --     },
            -- },
            -- j_cstorm_sample_roomba = {
            --     name = "Sample Roomba",
            --     text = {
            --         {
            --             "Attempts to remove edition",
            --             "from another Joker",
            --             "at the end of each round",
            --             "{C:inactive}(Foil, Holo, Polychrome)"
            --         }
            --     },
            -- },
            -- j_cstorm_sample_drunk_juggler = {
            --     name = "Sample Drunk Juggler",
            --     text = {
            --         {
            --             "{C:red}+#1#{} discard,",
            --             "also here's some {X:legendary,C:white}text effects{}:",
            --             "{s:0.5} scaled down by 0.5",
            --             "{C:attention,T:tag_double}#2#",
            --         }
            --     },
            -- },
            -- j_cstorm_sample_hackerman = {
            --     name = "Sample Hackerman",
            --     text = {
            --         {
            --             "Retrigger",
            --             "each played",
            --             "{C:attention}6{}, {C:attention}7{}, {C:attention}8{}, or {C:attention}9{}",
            --         }
            --     },
            -- },
            -- j_cstorm_sample_baroness = {
            --     name = "Sample Baroness",
            --     text = {
            --         {
            --             "Each {C:attention}Queen{}",
            --             "held in hand",
            --             "gives {X:mult,C:white} X#1# {} Mult",
            --         }
            --     },
            -- },
            -- j_cstorm_sample_rarebaseballcard = {
            --     name = "Sample Rare Baseball Card",
            --     text = {
            --         {
            --             "{X:mult,C:white}Rare{} Jokers",
            --             "each give {X:mult,C:white} X#1# {} Mult",
            --         }
            --     },
            -- },
            -- j_cstorm_sample_multieffect = {
            --     name = "Sample Multi-Effect",
            --     text = {
            --         {
            --             "Each played {C:attention}10{}",
            --             "gives {C:chips}+#1#{} Chips and",
            --             "{C:mult}+#2#{} Mult when scored",
            --         }
            --     },
            -- },
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
                        "Gives {C:edition}random {C:chips}Chips",
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
                }
            }
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
        Other = {
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

            -- do note that when using messages such as: 
            -- message = localize{type='variable',key='a_xmult',vars={current_xmult}},
            -- that the key 'a_xmult' will use provided values from vars={} in that order to replace #1#, #2# etc... in the localization file.


        dictionary = {
            a_handsize="+#1# Hand Size",
            a_handsize_minus="-#1# Hand Size",
            a_sold_tally="#1#/#2# Sold",

            k_cstorm_Tokens = "Token",
            b_cstorm_Tokens_cards = "Tokens",
        },
        labels = {
            cstorm_Tokens = "Tokens",

            cstorm_cracked_stone = "Cracked Stone",

            cstorm_death = "Death",
        }
    }
}