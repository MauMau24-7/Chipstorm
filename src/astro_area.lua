Chipstorm.create_UIBox_astro_cards = function()
    local t = {
        n = G.UIT.ROOT,
        config = { align = 'cm', r = 0.1, colour = G.C.CLEAR, padding = 0.2 },
        nodes = {
            {
                n = G.UIT.O,
                config = {
                    object = Chipstorm.astro_cards_area,
                    draw_layer = 1
                }
            },
        }
    }
    return t
end

local game_start_run_ref = Game.start_run
function Game:start_run(args)
    self.cstorm_astro_card_area = CardArea(
        0,
        0,
        (self.CARD_W or 71) * 1.2,
        (self.CARD_H or 95) * 1.2,
        {
            card_limit = 1,
            type = 'joker',
            highlight_limit = 1,
        }
    )
    Chipstorm.astro_card_area = G.cstorm_astro_card_area
    if Chipstorm.hide_ui then Chipstorm.astro_card_area.states.visible = false end

    game_start_run_ref(self, args)

    Chipstorm.astro_card_area.T.x = G.consumeables.T.x + 2.3
    Chipstorm.astro_card_area.T.y = G.consumeables.T.y + 3
end