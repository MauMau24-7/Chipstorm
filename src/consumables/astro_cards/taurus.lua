SMODS.Consumable {
    key = "taurus",
    config = { extra = { dollars = 1, timer = 0, elapsed_time = 0, reset_timer = 10, moneyEarned = 0 } },
    set = "cstorm_astro",
    atlas = "consumables",
    discovered = false,
    unlocked = false,
    pos = { x = 1, y = 0 },

    in_pool = function(self, args)
        return false
    end,

    loc_vars = function (self, info_queue, card)
        info_queue[#info_queue + 1] = { set = "Other", key = "astro_planets", specific_vars = { "Venus & Earth" } }
        return { vars = { card.ability.extra.dollars, card.ability.extra.reset_timer, card.ability.extra.moneyEarned }, key = self.key }
    end,

    locked_loc_vars = function (self, info_queue, card)
        if G.PROFILES[G.SETTINGS.profile].taurusHint == true then
            return { key = self.key .. "_hint" }
        end
        return { key = self.key }
    end,

    set_ability = function (self, card, initial, delay_sprites)
        card.states.click.can = false
    end,

    update = function (self, card, dt)
        --delta time at 1x game speed
        local dt_1x = 0.016694971453443

        if card.ability.extra.timer >= card.ability.extra.reset_timer then
            card.ability.extra.timer = 0
            ease_dollars(card.ability.extra.dollars)
            card.ability.extra.moneyEarned = card.ability.extra.moneyEarned + 1
        end

        if not G.SETTINGS.paused == true then
            card.ability.extra.elapsed_time = card.ability.extra.elapsed_time + dt_1x

            if card.ability.extra.elapsed_time >= 1 then
                card.ability.extra.elapsed_time = card.ability.extra.elapsed_time - 1
                card.ability.extra.timer = card.ability.extra.timer + 1
            end
        end
    end
}