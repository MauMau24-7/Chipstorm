
SMODS.Atlas({
    key = "modicon",
    path = "icon.png",
    px = 32,
    py = 32
})

SMODS.current_mod.description_loc_vars = function()
    return { background_colour = G.C.CLEAR, text_colour = G.C.WHITE, scale = 1.2 }
end

SMODS.current_mod.custom_ui = function(modNodes)
    modNodes[1].nodes[1].config.colour = G.C.CSTORM.MOD

    G.cstorm_desc_area = CardArea(
        G.ROOM.T.x + 0.2 * G.ROOM.T.w / 2, G.ROOM.T.h,
        4.25 * G.CARD_W,
        0.95 * G.CARD_H,
        { card_limit = 5, type = 'title', highlight_limit = 0, collection = true }
    )
    G.cstorm_desc_area.cstorm_demo_area = true
    for i, key in ipairs({ "j_cstorm_final_push", "j_cstorm_miscount", "j_cstorm_juggling_jack" }) do
        local card = Card(G.cstorm_desc_area.T.x + G.cstorm_desc_area.T.w / 2, G.cstorm_desc_area.T.y,
            G.CARD_W, G.CARD_H, G.P_CARDS.empty,
            G.P_CENTERS[key])
        -- Chipstorm.set_back_sprite(nil, card)
        G.cstorm_desc_area:emplace(card)
        card:flip()
        G.E_MANAGER:add_event(Event({
            blocking = false,
            trigger = "after",
            delay = 0.4 * i,
            func = function()
                play_sound("card1")
                card:flip()
                return true
            end,
        }))
    end

    modNodes[#modNodes + 1] = {
        n = G.UIT.R,
        config = { align = "cm", padding = 0.07, no_fill = true },
        nodes = {
            { n = G.UIT.O, config = { object = G.cstorm_desc_area } }
        }
    }

    modNodes[#modNodes + 1] = {
        n = G.UIT.R,
        config = {
            padding = 0.2,
            align = "cm",
        },
        nodes = {
            {
                n = G.UIT.C,
                config = {
                    padding = 0.2,
                    align = "cm",
                },
                nodes = {
                    UIBox_button({
                        colour = G.C.CSTORM.GIT,
                        minw = 3.85,
                        button = "cstorm_github",
                        label = { localize('k_cstorm_github') }
                    })
                }
            },
        }
    }
end

function G.FUNCS.cstorm_github(e)
    love.system.openURL("https://github.com/MauMau24-7/Chipstorm")
end

SMODS.current_mod.ui_config = {
    colour = G.C.CSTORM.XYZ,
    bg_colour = { G.C.CSTORM.MOD[1], G.C.CSTORM.MOD[2], G.C.CSTORM.MOD[3], 0.6 },
    back_colour = darken(G.C.CSTORM.MOD, 0.3),
    tab_button_colour = darken(G.C.CSTORM.MOD, 0.2),
    collection_option_cycle_colour = darken(G.C.CSTORM.MOD, 0.2),
}

SMODS.current_mod.extra_tabs = function()
    return {
        {
            label = localize("k_cstorm_credits"),
            tab_definition_function = function()
                local modNodes = {}

                modNodes[#modNodes + 1] = {}
                local loc_vars = { background_colour = G.C.CLEAR, text_colour = G.C.WHITE, scale = 1.4 }
                localize { type = 'descriptions', key = "cstorm_credits", set = 'Other', nodes = modNodes[#modNodes], vars = loc_vars.vars, scale = loc_vars.scale, text_colour = loc_vars.text_colour, shadow = loc_vars.shadow }
                modNodes[#modNodes] = desc_from_rows(modNodes[#modNodes])
                modNodes[#modNodes].config.colour = loc_vars.background_colour or modNodes[#modNodes].config.colour

                return {
                    n = G.UIT.ROOT,
                    config = {
                        emboss = 0.05,
                        minh = 6,
                        r = 0.1,
                        minw = 6,
                        align = "tm",
                        padding = 0.2,
                        colour = G.C.BLACK
                    },
                    nodes = modNodes
                }
            end
        },
        {
            label = localize("k_cstorm_new_stuff"),
            tab_definition_function = CSTORM.NEW.get_UI_definition
        },
    }
end
