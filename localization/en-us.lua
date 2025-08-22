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
            j_cstorm_washed_card = {
                name = "{C:chips}Washed Card",
                text = {
                    "{s:1.2}Choose if you want...",
                    "",
                    "{C:chips}+#1# Chips",
                    "or",
                    "{C:mult}+#2# Mult"
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
        },
        Edition = {
            e_cstorm_ionized = {
                name = "Ionized",
                text = {
                    "Ionized"
                }
            },
            e_cstorm_gilded = {
                name = "Gilded",
                text = {
                    "Gilded"
                }
            },
            e_cstorm_anaglyphic = {
                name = "Anaglyphic",
                text = {
                    "Anaglyphic"
                }
            },
            e_cstorm_flipped = {
                name = "Flipped",
                text = {
                    "Flipped"
                }
            },
            e_cstorm_laminated = {
                name = "Laminated",
                text = {
                    "Laminated"
                }
            },
            e_cstorm_fluorescent = {
                name = "Fluorescent",
                text = {
                    "Fluorescent"
                }
            },
            e_cstorm_foil = {
                name = "Foil",
                text = {
                    "Foil"
                }
            },
            e_cstorm_gold = {
                name = "Gold",
                text = {
                    "Gold"
                }
            },
            e_cstorm_greyscale = {
                name = "Greyscale",
                text = {
                    "Greyscale"
                }
            },
            e_cstorm_monochrome = {
                name = "Monochrome",
                text = {
                    "Monochrome"
                }
            },
            e_cstorm_sepia = {
                name = "Sepia",
                text = {
                    "Sepia"
                }
            },
            e_cstorm_overexposed = {
                name = "Overexposed",
                text = {
                    "Overexposed"
                }
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
                    "This is a literal slot machine"
                }
            }
        },
        Tag = {
            tag_cstorm_raccoon = {
                name = "Raccoon",
                text = {
                    "Washes a random Joker",
                }
            },
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
            cstorm_credits = {
                name = " ",
                text = {
                    -- "{C:cstorm_mod}Booster Art:{} IcyEthics",
                    " ",
                    "{C:cstorm_mod}Localization:{}",
                    -- "{C:attention}French:{} Keraloon",
                    -- "{C:attention}Simplified Chinese:{} Alophrine",
                    " ",
                    -- "{C:cstorm_mod}Archetype Ideas:{}",
                    -- "{C:cstorm_link}@Ignister{}: gyro/rina",
                    " ",
                    "Some ideas taken from these mods:",
                    --Add Mod names here
                    " ",
                    "{C:cstorm_mod}Special Thanks{} to the",
                    "{C:attention}Balatro{} Discord server <3"
                }
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

            k_cstorm_github = "Github",
            k_cstorm_credits = "Credits",

            -- "NEW STUFF" Tab thingies
            k_cstorm_new_stuff = "NEW STUFF!",

            --C1
            k_cstorm_jokers = "Jokers",
            k_cstorm_decks = "Decks",
            k_cstorm_vouchers = "Vouchers",
            k_cstorm_consumables = "Consumables",

            --C2
            k_cstorm_enhancements = "Enhanced Cards",
            k_cstorm_seals = "Seals",
            k_cstorm_editions = "Editions",
            k_cstorm_booster_packs = "Booster Packs",
            k_cstorm_tags = "Tags",
            k_cstorm_blinds = "Blinds",
            k_cstorm_others = "Other"

            -- ["$"] = "BOB"
        },
        labels = {
            cstorm_Tokens = "Tokens",

            cstorm_cracked_stone = "Cracked Stone",

            cstorm_death = "Death",
        }
    }
}
