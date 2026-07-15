SMODS.Consumable {
    key = "capricorn",
    config = { extra = { startMult = 30, minusMult = 2 } },
    set = "cstorm_astro",
    atlas = "consumables",
    discovered = false,
    unlocked = false,
    pos = { x = 0, y = 1 },

    calculate = function(self, card, context)
        if context.joker_main then
            return{
                mult = card.ability.extra.startMult
            }
        end
        if context.after then
            card.ability.extra.startMult = card.ability.extra.startMult - card.ability.extra.minusMult
            return {
                message = localize { type = 'variable', key = 'a_mult_minus', vars = { card.ability.extra.minusMult } },
                colour = G.C.MULT
            }
        end
    end,

    in_pool = function(self, args)
        return false
    end,

    loc_vars = function (self, info_queue, card)
        info_queue[#info_queue + 1] = { set = "Other", key = "astro_planets", specific_vars = { "Earth & Saturn" } }
        return { vars = { card.ability.extra.startMult, card.ability.extra.minusMult }, key = self.key }
    end,

    locked_loc_vars = function (self, info_queue, card)
        if G.PROFILES[G.SETTINGS.profile].capricornHint == true then
            return { key = self.key .. "_hint" }
        end
        return { key = self.key }
    end,

    set_ability = function (self, card, initial, delay_sprites)
        card.states.click.can = false
    end
}