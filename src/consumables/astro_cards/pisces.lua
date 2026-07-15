SMODS.Consumable {
    key = "pisces",
    config = { extra = { dollars = 0, limit = 15 } },
    set = "cstorm_astro",
    atlas = "consumables",
    discovered = false,
    unlocked = false,
    pos = { x = 2, y = 1 },

    calculate = function(self, card, context)
        local difference = card.ability.extra.limit - G.GAME.dollars
        card.ability.extra.dollars = math.max(0, difference)

        if context.starting_shop and G.GAME.dollars < card.ability.extra.limit then
            return{
                dollars = card.ability.extra.dollars
            }
        end
    end,

    in_pool = function(self, args)
        return false
    end,

    loc_vars = function (self, info_queue, card)
        info_queue[#info_queue + 1] = { set = "Other", key = "astro_planets", specific_vars = { "Jupiter & Neptune" } }
        return { vars = { card.ability.extra.dollars, card.ability.extra.limit }, key = self.key }
    end,

    locked_loc_vars = function (self, info_queue, card)
        if G.PROFILES[G.SETTINGS.profile].piscesHint == true then
            return { key = self.key .. "_hint" }
        end
        return { key = self.key }
    end,

    set_ability = function (self, card, initial, delay_sprites)
        card.states.click.can = false
    end
}