SMODS.Consumable {
    key = "aquarius",
    config = { percent = 0, multFactor = 10 },
    set = "cstorm_astro",
    atlas = "consumables",
    discovered = false,
    unlocked = false,
    pos = { x = 1, y = 1 },

    calculate = function(self, card, context)
        self.config.percent = #G.jokers.cards * self.config.multFactor

        if self.config.percent > 100 then
            self.config.percent = 100
        end

        if context.joker_main then
            balance_percent(card, (self.config.percent * 0.01))
        end
    end,

    in_pool = function(self, args)
        return false
    end,

    loc_vars = function (self, info_queue, card)
        info_queue[#info_queue + 1] = { set = "Other", key = "astro_planets", specific_vars = { "Uranus & Saturn" } }
        return { vars = { self.config.percent, self.config.multFactor }, key = self.key }
    end,

    locked_loc_vars = function (self, info_queue, card)
        if G.PROFILES[G.SETTINGS.profile].aquariusHint == true then
            return { key = self.key .. "_hint" }
        end
        return { key = self.key }
    end,

    set_ability = function (self, card, initial, delay_sprites)
        card.states.click.can = false
    end
}
