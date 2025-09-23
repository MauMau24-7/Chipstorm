SMODS.Consumable {
    key = "cancer",
    set = "cstorm_astro",
    atlas = "consumables",
    discovered = false,
    unlocked = false,
    pos = { x = 3, y = 0 },

    calculate = function(self, card, context)
        if context.end_of_round and not context.game_over and context.main_eval then
            if G.GAME.chips / G.GAME.blind.chips <= 1.03 then
                local addSlot = pseudorandom("cancer_addSlot", 1, 4)

                if addSlot == 1 then
                    G.jokers.config.card_limit = G.jokers.config.card_limit + 1
                    return { message = not context.blueprint and "+1 Joker slot", colour = G.C.GREEN }
                elseif addSlot >= 2 then
                    G.consumeables.config.card_limit = G.consumeables.config.card_limit + 1
                    return { message = not context.blueprint and "+1 Consumable slot", colour = G.C.GREEN }
                end
            end
        end
    end,

    in_pool = function(self, args)
        return false
    end,

    loc_vars = function (self, info_queue, card)
        info_queue[#info_queue + 1] = { set = "Other", key = "astro_planets", specific_vars = { "Ceres & Neptune" } }
        return { key = self.key }
    end,

    locked_loc_vars = function (self, info_queue, card)
        if G.PROFILES[G.SETTINGS.profile].cancerHint == true then
            return { key = self.key .. "_hint" }
        end
        return { key = self.key }
    end,

    set_ability = function (self, card, initial, delay_sprites)
        card.states.click.can = false
    end
}