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