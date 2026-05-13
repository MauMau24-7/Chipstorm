SMODS.Consumable {
    key = "taurus",
    config = { dollars = 1, timer = 0, elapsed_time = 0, reset_timer = 10, moneyEarned = 0 },
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
        return { vars = { self.config.dollars, self.config.reset_timer, self.config.moneyEarned }, key = self.key }
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

        if self.config.timer >= self.config.reset_timer then
            self.config.timer = 0
            ease_dollars(self.config.dollars)
            self.config.moneyEarned = self.config.moneyEarned + 1
        end

        if not G.SETTINGS.paused == true then
            self.config.elapsed_time = self.config.elapsed_time + dt_1x

            if self.config.elapsed_time >= 1 then
                self.config.elapsed_time = self.config.elapsed_time - 1
                self.config.timer = self.config.timer + 1
            end
        end
    end
}