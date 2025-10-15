SMODS.Edition{
    key = "monochrome",
    config = { x_chips = 1.5, },
    shader = "cstorm_monochromeShader",
    in_shop = true,
    weight = 3,
    extra_cost = 5,
    badge_colour = G.C.CSTORM.GREY,
    sound = { sound = "cstorm_monochrome1", per = 1.2, vol = 0.7 },
    loc_vars = function(self, info_queue, card)
        return { vars = { card.edition.x_chips } }
    end,
    get_weight = function(self)
        return (G.GAME.edition_rate - 1) * G.P_CENTERS["e_negative"].weight + G.GAME.edition_rate * self.weight
    end,

    calculate = function (self, card, context)
        if context.post_joker or (context.main_scoring and context.cardarea == G.play) then
            return {
                x_chips = card.edition.x_chips
            }
        end
    end
}

SMODS.Edition{
    key = "neon",
    config = { x_chips = 0.5, x_mult = 3 },
    shader = "cstorm_neonShader",
    in_shop = true,
    weight = 3,
    extra_cost = 5,
    badge_colour = G.C.CSTORM.GREY,
    sound = { sound = "cstorm_neon1", --[[per = 1.2,]]vol = 0.7 },
    loc_vars = function(self, info_queue, card)
        return { vars = { card.edition.x_chips, card.edition.x_mult } }
    end,
    get_weight = function(self)
        return (G.GAME.edition_rate - 1) * G.P_CENTERS["e_negative"].weight + G.GAME.edition_rate * self.weight
    end,

    calculate = function (self, card, context)
        if context.post_joker or (context.main_scoring and context.cardarea == G.play) then
            return {
                x_chips = card.edition.x_chips,
                x_mult = card.edition.x_mult
            }
        end
    end
}