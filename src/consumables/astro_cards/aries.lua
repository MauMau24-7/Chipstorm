SMODS.Consumable {
    key = "aries",
    set = "cstorm_astro",
    atlas = "consumables",
    discovered = false,
    unlocked = false,
    pos = { x = 0, y = 0 },

    calculate = function(self, card, context)
        if context.end_of_round and context.game_over and context.main_eval then
            if G.GAME.chips < G.GAME.blind.chips then
                if #G.jokers.cards > 0 then
                    local jokerTarget = pseudorandom_element(G.jokers.cards, "ariesJoker")
                    G.E_MANAGER:add_event(Event({
                        func = function()
                            G.hand_text_area.blind_chips:juice_up()
                            G.hand_text_area.game_chips:juice_up()
                            play_sound('tarot1')
                            jokerTarget:start_dissolve()
                            return true
                        end
                    }))
                    return {
                        message = localize('k_saved_ex'),
                        saved = 'ph_cstorm_aries',
                        colour = G.C.RED
                    }
                end
            end
        end
    end,

    in_pool = function(self, args)
        return false
    end,

    loc_vars = function (self, info_queue, card)
        info_queue[#info_queue + 1] = { set = "Other", key = "astro_planets", specific_vars = { "Mars & Eris" } }
        return { key = self.key }
    end,

    locked_loc_vars = function (self, info_queue, card)
        if G.PROFILES[G.SETTINGS.profile].ariesHint == true then
            return { key = self.key .. "_hint" }
        end
        return { key = self.key }
    end,

    set_ability = function (self, card, initial, delay_sprites)
        card.states.click.can = false
    end
}