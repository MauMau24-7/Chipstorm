-- Main menu (Stolen from JoyousSpring)
local game_main_menu_ref = Game.main_menu
function Game:main_menu(change_context)
    local ret = game_main_menu_ref(self, change_context)

    if not Chipstorm.config.disable_main_menu then
        local newcard = SMODS.create_card { key = "j_cstorm_final_push", area = G.title_top, no_edition = true }

        self.title_top.T.w = self.title_top.T.w * 1.7675
        self.title_top.T.x = self.title_top.T.x - 0.8

        newcard.T.w = newcard.T.w * 1.1 * 1.2
        newcard.T.h = newcard.T.h * 1.1 * 1.2
        newcard.no_ui = true
        newcard.states.visible = false
        self.title_top:emplace(newcard)
        self.title_top:align_cards()
        G.SPLASH_BACK:define_draw_steps({
            {
                shader = "splash",
                send = {
                    { name = "time",       ref_table = G.TIMERS, ref_value = "REAL_SHADER" },
                    { name = "vort_speed", val = 0.4 },
                    { name = "colour_1",   ref_table = G.C.CSTORM,  ref_value = "MOD" },
                    { name = "colour_2",   ref_table = G.C.CSTORM,      ref_value = "GIT" },
                },
            },
        })
        if change_context == "splash" then
            G.E_MANAGER:add_event(Event({
                trigger = "after",
                delay = 0,
                blockable = false,
                blocking = false,
                func = function()
                    newcard.states.visible = true
                    newcard:start_materialize({ G.C.WHITE, G.C.WHITE }, true, 2.5)
                    return true
                end,
            }))
        else
            G.E_MANAGER:add_event(Event({
                trigger = "after",
                delay = 0,
                blockable = false,
                blocking = false,
                func = function()
                    newcard.states.visible = true
                    newcard:start_materialize({ G.C.WHITE, G.C.WHITE }, nil, 1.2)
                    return true
                end,
            }))
        end
    end

    return ret
end

-- Custom Buttons

--Joker Button
local last_use_and_sell_buttons = G.UIDEF.use_and_sell_buttons
G.UIDEF.use_and_sell_buttons = function(card)
    local t = last_use_and_sell_buttons(card)
    local custom_buttons = card.config.center.config.custom_buttons or {}
    local function create_custom_button(b_t)
        local button_text = b_t.text
        local width = b_t.w or 0.05
        local h = b_t.h or 0.3
        if localize(button_text) ~= "ERROR" then button_text = localize(b_t.text) end
        local custom_button = {
            n = G.UIT.C,
            config = { align = "cr" },
            nodes = {
                {
                    n = G.UIT.C,
                    config = { ref_table = { this_card = card, id = b_t.id, }, align = "cr", maxw = 1.25, padding = 0.1, r = 0.2, minw = 1.25, minh = (card.area and card.area.config.type == 'joker') and 0 or 1, hover = true, shadow = true, colour = b_t.colour or G.C.WHITE, one_press = false, button = 'custom_button' },
                    nodes = {
                        { n = G.UIT.B, config = { w = width, h = h } },
                        { n = G.UIT.T, config = { text = button_text, colour = b_t.text_colour or G.C.BLACK, scale = b_t.text_scale or 0.55, shadow = true } }
                    }
                }
            }
        }
        return custom_button
    end
    if card.area ~= G.pack_cards then
        for i, v in ipairs(custom_buttons) do
            local active = v.active
            if type(active) == "function" then active = active(card, v) end
            if active == nil then active = true end
            if active then
                local this_button = create_custom_button(v)
                local spacing = { n = G.UIT.R, config = { align = 'cl' }, nodes = { this_button }, }
                table.insert(t.nodes[1].nodes, spacing)
            end
        end
    end

    return t
end
