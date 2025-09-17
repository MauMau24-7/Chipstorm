--Credits to All in Jest, I'm bad at coding math
SMODS.Consumable {
    key = "virgo",
    set = "cstorm_astro",
    atlas = "astro",
    discovered = false,
    unlocked = false,
    pos = { x = 5, y = 0 },

    calculate = function(self, card, context)
        if context.joker_main then
            if mult <= 0 then return 1 end
            local power = math.ceil(math.log(mult, 6))
            hand_chips = hand_chips
            Mult = 6 ^ power
            if Mult - mult > 0 then
            return {
                mult = Mult - mult,
                remove_default_message = true,
                message = '=' .. Mult .. ' Mult',
                colour = G.C.RED,
                sound = 'multhit1'
            }
            end
        end
    end,

    in_pool = function(self, args)
        return false
    end,

    loc_vars = function (self, info_queue, card)
        info_queue[#info_queue + 1] = { set = "Other", key = "astro_planets", specific_vars = { "Mercury & Ceres" } }
        return { key = self.key }
    end,

    locked_loc_vars = function (self, info_queue, card)
        if G.PROFILES[G.SETTINGS.profile].virgoHint == true then
            return { key = self.key .. "_hint" }
        end
        return { key = self.key }
    end,

    set_ability = function (self, card, initial, delay_sprites)
        card.states.click.can = false
    end
}