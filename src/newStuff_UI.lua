CSTORM.NEW.get_UI_definition = function(params)
    params = params or {}
    local width = params.width or 8
    local height = params.height or 6

    return {
        n = G.UIT.ROOT, 
        config = {
            minw = width, minh = height,
            r = 0.1,
            colour = G.C.BLACK
        },
        nodes = {
            {
                n = G.UIT.R, config = {
                    align = "tm",
                    padding = 0.4,
                    h = 0.1,
                    w = 10,
                },
                nodes = {
                    {
                        n = G.UIT.C, config = {
                            align = "cm",
                            padding = 0.1,
                            h = 0.1,
                            w = 10,
                        },
                        nodes = {
                            UIBox_button({
                                colour = G.C.CSTORM.BUTTONS,
                                scale = 0.6,
                                minw = 3.85,
                                minh = 1.5,
                                button = "cstorm_jokers",
                                label = { localize('k_cstorm_jokers') }
                            }),
                            UIBox_button({
                                colour = G.C.CSTORM.BUTTONS,
                                minw = 3.85,
                                minh = 1,
                                button = "cstorm_decks",
                                label = { localize('k_cstorm_decks') }
                            }),
                            UIBox_button({
                                colour = G.C.CSTORM.BUTTONS,
                                minw = 3.85,
                                minh = 1,
                                button = "cstorm_vouchers",
                                label = { localize('k_cstorm_vouchers') }
                            }),
                            {
                                n = G.UIT.R, config = {
                                    align = "cm",
                                    colour = G.C.BLACK,
                                    padding = 0.1,
                                    h = 3,
                                    w = width / 2,
                                },
                                nodes = {
                                    {
                                        n = G.UIT.C, config = {
                                            align = "cm",
                                            h = 0.1,
                                        },
                                        nodes = {
                                            {
                                                n = G.UIT.T, config = {
                                                    text = "CONSUMABLES",
                                                    colour = G.C.RED,
                                                    scale = 0.5,
                                                    vert = true,
                                                },
                                            },
                                        }
                                    },
                                    UIBox_button({
                                        colour = G.C.CSTORM.CON_BUTTON,
                                        minw = 3,
                                        minh = 3,
                                        button = "cstorm_consumables",
                                        label = { localize('k_cstorm_consumables') }
                                    }),
                                }
                            },
                        },
                    },
                    {
                        n = G.UIT.C, config = {
                            align = "tr",
                            padding = 0.1,
                            h = 1,
                            w = width / 2,
                        },
                        nodes = {
                            UIBox_button({
                                colour = G.C.CSTORM.BUTTONS,
                                minw = 3.85,
                                minh = 1,
                                button = "cstorm_enhancements",
                                label = { localize('k_cstorm_enhancements') }
                            }),
                            UIBox_button({
                                colour = G.C.CSTORM.BUTTONS,
                                minw = 3.85,
                                minh = 1,
                                button = "cstorm_seals",
                                label = { localize('k_cstorm_seals') }
                            }),
                            UIBox_button({
                                colour = G.C.CSTORM.BUTTONS,
                                minw = 3.85,
                                minh = 0.8,
                                button = "cstorm_editions",
                                label = { localize('k_cstorm_editions') }
                            }),
                            UIBox_button({
                                colour = G.C.CSTORM.BUTTONS,
                                minw = 3.85,
                                minh = 0.8,
                                button = "cstorm_booster_packs",
                                label = { localize('k_cstorm_booster_packs') }
                            }),
                            UIBox_button({
                                colour = G.C.CSTORM.BUTTONS,
                                minw = 3.85,
                                minh = 0.8,
                                button = "cstorm_tags",
                                label = { localize('k_cstorm_tags') }
                            }),
                            UIBox_button({
                                colour = G.C.CSTORM.BUTTONS,
                                minw = 3.85,
                                minh = 1.7,
                                button = "cstorm_blinds",
                                label = { localize('k_cstorm_blinds') }
                            }),
                            UIBox_button({
                                colour = G.C.CSTORM.BUTTONS,
                                minw = 3.85,
                                minh = 0.8,
                                button = "cstorm_others",
                                label = { localize('k_cstorm_others') }
                            }),
                        },
                    }
                }
            }
        }
    }
end

--C1
function G.FUNCS.cstorm_jokers(e)
    local new_jokers = {
    "j_cstorm_one_hand_wonder", -- put the key for your new cards here
    "j_cstorm_fast_draw",
    "j_cstorm_washed_card",
    "j_cstorm_arcana_hunter",
    }

    local new_pool = {}

    for _, key in ipairs(new_jokers) do
        table.insert(new_pool, G.P_CENTERS[key])
    end

    G.FUNCS.overlay_menu {
        definition = SMODS.card_collection_UIBox(new_pool, {5,5,5}, {
            no_materialize = true, 
            modify_card = function(card, center) card.sticker = get_joker_win_sticker(center) end,
            h_mod = 0.95,
        })
    }
end
function G.FUNCS.cstorm_decks(e)
    local new_decks = {
    "j_cstorm_final_push", -- put the key for your new cards here
    "j_cstorm_juggling_jack",
    }

    local new_pool = {}

    for _, key in ipairs(new_decks) do
        table.insert(new_pool, G.P_CENTERS[key])
    end

    G.FUNCS.overlay_menu {
        definition = SMODS.card_collection_UIBox(new_pool, {5,5,5}, {
            no_materialize = true, 
            modify_card = function(card, center) card.sticker = get_joker_win_sticker(center) end,
            h_mod = 0.95,
        })
    }
    
end
function G.FUNCS.cstorm_vouchers(e)
    local new_vouchers = {
    "j_cstorm_final_push", -- put the key for your new cards here
    "j_cstorm_juggling_jack",
    }

    local new_pool = {}

    for _, key in ipairs(new_vouchers) do
        table.insert(new_pool, G.P_CENTERS[key])
    end

    G.FUNCS.overlay_menu {
        definition = SMODS.card_collection_UIBox(new_pool, {4,4}, {
            area_type = 'voucher',
            modify_card = function(card, center, i, j)
                card.ability.order = i+(j-1)*4
            end,
        })
    }
end
function G.FUNCS.cstorm_consumables(e)
    local new_consumables = {
    "c_cstorm_focus_strike", -- put the key for your new cards here
    "c_cstorm_void_chip",
    "c_cstorm_neon_chip",
    "c_cstorm_lucky_chip",
    }

    local new_pool = {}

    for _, key in ipairs(new_consumables) do
        table.insert(new_pool, G.P_CENTERS[key])
    end

    G.FUNCS.overlay_menu {
        definition = SMODS.card_collection_UIBox(new_pool, {5,5,5}, {
            no_materialize = true, 
            modify_card = function(card, center) card.sticker = get_joker_win_sticker(center) end,
            h_mod = 0.95,
        })
    }
end

--C2
function G.FUNCS.cstorm_enhancements(e)
    local new_enhancements = {
    "m_cstorm_cracked_stone", -- put the key for your new cards here
    }

    local new_pool = {}

    for _, key in ipairs(new_enhancements) do
        table.insert(new_pool, G.P_CENTERS[key])
    end

    G.FUNCS.overlay_menu {
        definition = SMODS.card_collection_UIBox(new_pool, {4,4}, {
            no_materialize = true,
            snap_back = true,
            h_mod = 1.03,
            infotip = localize('ml_edition_seal_enhancement_explanation'),
            hide_single_page = true,
        })
    }
end
function G.FUNCS.cstorm_seals(e) -- Don't work
    local new_seals = {
    "j_cstorm_final_push", -- put the key for your new cards here
    "j_cstorm_juggling_jack",
    }

    local new_pool = {}

    for _, key in ipairs(new_seals) do
        table.insert(new_pool, G.P_CENTERS[key])
    end

    G.FUNCS.overlay_menu {
        definition = SMODS.card_collection_UIBox(new_pool, {5,5}, {
            snap_back = true,
            infotip = localize('ml_edition_seal_enhancement_explanation'),
            hide_single_page = true,
            collapse_single_page = true,
            center = 'c_base',
            h_mod = 1.03,
            modify_card = function(card, center)
                card:set_seal(center.key, true)
            end,
        })
    }
end 
function G.FUNCS.cstorm_editions(e)
    local new_editions = {
    "cstorm_test", -- put the key for your new cards here
    }

    local new_pool = {}

    for _, key in ipairs(new_editions) do
        table.insert(new_pool, G.P_CENTERS[key])
    end

    G.FUNCS.overlay_menu {
        definition = SMODS.card_collection_UIBox(new_pool, {5,5}, {
            snap_back = true,
            h_mod = 1.03,
            infotip = localize('ml_edition_seal_enhancement_explanation'),
            hide_single_page = true,
            collapse_single_page = true,
            modify_card = function(card, center)
                if center.discovered then card:set_edition(center.key, true, true) end
            end,
        })
    }
end
function G.FUNCS.cstorm_booster_packs(e)
    local new_booster_packs = {
    "p_cstorm_chip_stack", -- put the key for your new cards here
    }

    local new_pool = {}

    for _, key in ipairs(new_booster_packs) do
        table.insert(new_pool, G.P_CENTERS[key])
    end

    G.FUNCS.overlay_menu {
        definition = SMODS.card_collection_UIBox(new_pool, {4,4}, {
            h_mod = 1.3,
            w_mod = 1.25, 
            card_scale = 1.27,
        })
    }
end
function G.FUNCS.cstorm_tags(e)
    local new_tags = {
    "tag_cstorm_raccoon", -- put the key for your new cards here
    }

    local new_pool = {}

    for _, key in ipairs(new_tags) do
        table.insert(new_pool, G.P_TAGS[key])
    end

    G.FUNCS.overlay_menu {
        definition = SMODS.card_collection_UIBox(new_pool, {5,5,5}, {
            no_materialize = true, 
            modify_card = function(card, center) card.sticker = get_joker_win_sticker(center) end,
            h_mod = 0.95,
        })
    }
end
function G.FUNCS.cstorm_blinds(e)
    local new_blinds = {
    "bl_cstorm_slots", -- put the key for your new cards here
    "bl_cstorm_green_light_red_light",
    }

    local new_pool = {}

    for _, key in ipairs(new_blinds) do
        table.insert(new_pool, G.P_CENTERS[key])
    end

    G.FUNCS.overlay_menu {
        definition = SMODS.card_collection_UIBox(new_pool, {5,5,5}, {
            no_materialize = true, 
            modify_card = function(card, center) card.sticker = get_joker_win_sticker(center) end,
            h_mod = 0.95,
        })
    }
end
function G.FUNCS.cstorm_others(e)
    local new_others = {
    "cstorm_death", -- put the key for your new cards here
    }

    local new_pool = {}

    for _, key in ipairs(new_others) do
        table.insert(new_pool, G.P_CENTERS[key])
    end

    G.FUNCS.overlay_menu {
        definition = SMODS.card_collection_UIBox(new_pool, {5,5}, {
            snap_back = true,
            hide_single_page = true,
            collapse_single_page = true,
            center = 'c_base',
            h_mod = 1.03,
            back_func = 'your_collection_other_gameobjects',
            modify_card = function(card, center)
                card.ignore_pinned = true
                center:apply(card, true)
            end,
        })
    }
end