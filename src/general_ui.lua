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
