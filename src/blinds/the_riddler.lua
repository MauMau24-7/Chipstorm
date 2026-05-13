--========================================================================--
--=================================| UI |=================================--
--========================================================================--

G.FUNCS.riddler_open_overlay = function(e)
    if not current_riddle then
        current_riddle = get_random_riddle("the_riddler")
    end

    print("G.OVERLAY_MENU is " .. (G.OVERLAY_MENU or "nil"))

    if not G.OVERLAY_MENU then
        print("No Menu")
        Chipstorm.display_riddle("riddle_ui", current_riddle)
    end
end

Chipstorm.display_riddle = function(menu_name_input, riddle_input)
    G.OVERLAY_MENU = nil

    G.FUNCS.overlay_menu({
        definition = riddle_overlay(menu_name_input, riddle_input),
        config = { no_esc = true }
    })
end

function riddle_overlay(menu_name, riddle)
    local rows = {}
    answers = answers or {}
    answers.answer = answers.answer or ""

    if riddle and riddle.question then
        for i, text in ipairs(riddle.question) do
            table.insert(rows, {
                n = G.UIT.R,
                config = { align = "cm", padding = 0.1 },
                nodes = {
                    {
                        n = G.UIT.T,
                        config = {
                            text = text,
                            colour = G.C.UI.TEXT_LIGHT,
                            scale = 0.5
                        }
                    }
                }
            })
        end
    else
        table.insert(rows, {
            n = G.UIT.R,
            config = { align = "cm", padding = 0.1 },
            nodes = {
                {
                    n = G.UIT.T,
                    config = {
                        text = "No riddle found",
                        colour = G.C.UI.TEXT_LIGHT,
                        scale = 0.5
                    }
                }
            }
        })
    end

    table.insert(rows, {
        n = G.UIT.R,
        config = { align = "cm", padding = 0.1 },
        nodes = {
            create_text_input {
                max_length = 30,
                all_caps = false,
                ref_table = answers,
                ref_value = "answer",
                align = "cm",
                extended_corpus = true,
                callback = function()
                    if answers.answer and riddle.answer then
                        correct_answer = check_riddle_answer(
                            answers.answer,
                            riddle.answer
                        )
                        print(correct_answer)
                    end
                end
            }
        }
    })

    table.insert(rows, {
        n = G.UIT.R,
        config = { align = "cr", padding = 0.1 },
        nodes = {
            UIBox_button({
                colour = G.C.CSTORM.PURE_RED,
                scale = 0.4,
                minw = 0.5,
                minh = 0.5,
                button = "close_riddle_ui",
                label = { localize('k_close_riddle_ui') }
            }),
        }
    })

    return {
        n = G.UIT.ROOT,
        config = { align = "cm", padding = 0.5, colour = G.C.GREY, r = 0.3 },
        nodes = {
            {
                n = G.UIT.R,
                config = { align = "cm", padding = 0.2 },
                nodes = {
                    {
                        n = G.UIT.C,
                        config = { align = "cm", padding = 0.2 },
                        nodes = rows
                    }
                }
            }

        }
    }
end

--========================================================================--
--================================| HOOK |================================--
--========================================================================--

local can_play_orig = G.FUNCS.can_play

-- When The Riddler, acivate button and colour
G.FUNCS.can_play = function(e)
    if G.GAME
        and G.GAME.blind
        and G.GAME.blind.config
        and G.GAME.blind.config.blind
        and G.GAME.blind.config.blind.key == 'bl_cstorm_the_riddler' then
        e.config.colour = G.C.BLUE
        e.config.button = 'riddler_open_overlay'
    else
        can_play_orig(e)
    end
end

--========================================================================--
--===============================| FUNCS |================================--
--========================================================================--

function G.FUNCS.close_riddle_ui(e)
    if not G.OVERLAY_MENU then return end
    G.OVERLAY_MENU:remove()
    G.OVERLAY_MENU = nil
end

--========================================================================--
--===============================| BLIND |================================--
--========================================================================--

SMODS.Blind {
    key = "the_riddler",
    atlas = "blinds",
    pos = { x = 0, y = 2 },
    dollars = 7,
    mult = 1,
    boss = { min = 1, max = 10 },
    boss_colour = HEX("F3840D"),
    config = { score = nil, riddle = nil },

    calculate = function(self, blind, context)
        if context.setting_blind then
            current_riddle = get_random_riddle("the_riddler")
            print(current_riddle)
        end

        -- Always show buttons
        if not self.buttons and not self.deck_preview then
            self.buttons = UIBox {
                definition = create_UIBox_buttons(),
                config = { align = "bm", offset = { x = 0, y = 0.3 }, major = G.hand, bond = 'Weak' }
            }
        end
        if self.buttons and not self.buttons.states.visible and not self.deck_preview then
            self.buttons.states.visible = true
        end
    end,

    -- Prevent drawing cards by overwriting it temporarily
    set_blind = function(self)
        if G.FUNCS.draw_from_deck_to_hand_original == nil then
            G.FUNCS.draw_from_deck_to_hand_original = G.FUNCS.draw_from_deck_to_hand

            G.FUNCS.draw_from_deck_to_hand = function(e)
                return true
            end
        end
    end,

    -- Back to original
    defeat = function(self)
        if G.FUNCS.draw_from_deck_to_hand_original then
            G.FUNCS.draw_from_deck_to_hand = G.FUNCS.draw_from_deck_to_hand_original
            G.FUNCS.draw_from_deck_to_hand_original = nil
        end
    end,
}

-- ================= UI BASICS (READ BEFORE LOSING SANITY) =================
-- UI in SMODS is built as a TREE of elements (nodes inside nodes).
-- You are NOT drawing UI, you are DESCRIBING a layout structure.

-- Every UI must:
-- 1. Return a ROOT node (G.UIT.ROOT)
-- 2. Contain children via "nodes"

-- Each node ALWAYS has:
-- n = type (G.UIT.R = row, G.UIT.C = column, G.UIT.T = text, etc.)
-- config = appearance / behavior
-- nodes = list of child elements (optional)

-- IMPORTANT:
-- "nodes" MUST ALWAYS be an ARRAY (list), even for ONE element!
-- Correct: nodes = { { ... } }
-- Wrong:   nodes = { ... }

-- Layout rules:
-- - Parent controls child layout
-- - G.UIT.R = horizontal (left to right)
-- - G.UIT.C = vertical (top to bottom)
-- - Alternate R and C to avoid weird layout issues

-- Text:
-- - Use G.UIT.T
-- - config.text = "your text"
-- - config.scale controls size
-- - config.colour = G.C.UI.TEXT_LIGHT (EXAMPLE)

-- Visibility:
-- - UI only appears if passed into a menu (e.g. overlay_menu)
-- - If nothing shows: check ROOT, nodes array, and if menu is opened

-- Common mistakes:
-- - Missing ROOT -> nothing renders
-- - nodes not being a list -> nothing renders
-- - Wrong colour table (G.UI instead of G.C.UI)
-- - UI created but never opened

-- Docs:
-- - https://github.com/Steamodded/smods/wiki/UI-Guide
-- - https://github.com/DivvyCr/Balatro-Preview/blob/main/src/Interface.lua
-- - https://github.com/DivvyCr/Balatro-History/tree/main/src/UI

-- ========================================================================
