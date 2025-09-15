SMODS.Consumable {
    key = "capricorn",
    config = { startMult = 30, minusMult = 2 },
    set = "cstorm_astro",
    atlas = "astro",
    discovered = false,
    pos = { x = 0, y = 1 },

    calculate = function(self, card, context)
        if context.joker_main then
            return{
                mult = self.config.startMult
            }
        end
        if context.after then
            self.config.startMult = self.config.startMult - self.config.minusMult
            return {
                message = localize { type = 'variable', key = 'a_mult_minus', vars = { self.config.minusMult } },
                colour = G.C.MULT
            }
        end
    end,

    in_pool = function(self, args)
        return false
    end,

    loc_vars = function (self, info_queue, card)
        info_queue[#info_queue + 1] = { set = "Other", key = "astro_planets", specific_vars = { "Earth & Saturn" } }
        return { vars = { self.config.startMult, self.config.minusMult }, key = self.key }
    end,

    set_ability = function (self, card, initial, delay_sprites)
        card.states.click.can = false
    end
}