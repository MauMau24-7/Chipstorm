SMODS.Consumable {
    key = "leo",
    config = { emult = 1.05 },
    set = "cstorm_astro",
    atlas = "astro",
    discovered = false,
    unlocked = false,
    pos = { x = 4, y = 0 },

    calculate = function(self, card, context)
        if context.joker_main then
            return{
                message = "^" .. self.config.emult,
                remove_default_message = true,
                mult = my_pow(mult, self.config.emult) - mult
            }
        end
    end,

    in_pool = function(self, args)
        return false
    end,

    loc_vars = function (self, info_queue, card)
        info_queue[#info_queue + 1] = { set = "Other", key = "astro_planets", specific_vars = { "Jupiter & Pluto" } }
        return { vars = { self.config.emult }, key = self.key }
    end,

    locked_loc_vars = function (self, info_queue, card)
        if G.PROFILES[G.SETTINGS.profile].leoHint == true then
            return { key = self.key .. "_hint" }
        end
        return { key = self.key }
    end,

    set_ability = function (self, card, initial, delay_sprites)
        card.states.click.can = false
    end
}