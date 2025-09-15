SMODS.Consumable {
    key = "scorpio",
    set = "cstorm_astro",
    atlas = "astro",
    discovered = false,
    pos = { x = 7, y = 0 },

    calculate = function (self, card, context)
        if context.blind then
            local RNGesus = pseudorandom_element(G.P_CENTER_POOLS.Joker, "scorpioJoker")
            card.c_cstorm_scorpio = true
            card:set_ability(RNGesus)
        end
    end,

    in_pool = function(self, args)
        return false
    end,

    loc_vars = function (self, info_queue, card)
        info_queue[#info_queue + 1] = { set = "Other", key = "astro_planets", specific_vars = { "Mars & Pluto" } }
    end,

    set_ability = function (self, card, initial, delay_sprites)
        card.states.click.can = false
    end
}