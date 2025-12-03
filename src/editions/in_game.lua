SMODS.Edition {
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

    calculate = function(self, card, context)
        if context.post_joker or (context.main_scoring and context.cardarea == G.play) then
            return {
                x_chips = card.edition.x_chips
            }
        end
    end
}

SMODS.Edition {
    key = "neon",
    config = { x_chips = 0.5, x_mult = 3 },
    shader = "cstorm_neonShader",
    in_shop = true,
    weight = 3,
    extra_cost = 5,
    badge_colour = HEX("ff073a"),
    sound = { sound = "cstorm_neon1", vol = 0.7 },
    loc_vars = function(self, info_queue, card)
        return { vars = { card.edition.x_chips, card.edition.x_mult } }
    end,

    calculate = function(self, card, context)
        if context.post_joker or (context.main_scoring and context.cardarea == G.play) then
            return {
                x_chips = card.edition.x_chips,
                x_mult = card.edition.x_mult
            }
        end
    end
}

SMODS.Edition {
    key = "static",
    shader = "cstorm_staticShader",
    in_shop = true,
    weight = 2.5,
    extra_cost = 5,
    badge_colour = SMODS.Gradients["cstorm_staticGradient"],
    sound = { sound = "cstorm_static1", vol = 0.7 },

    calculate = function(self, card, context)
        if card.debuff then
            SMODS.debuff_card(card, "prevent_debuff", "source")
        end
    end
}

SMODS.Edition {
    key = "mirror",
    shader = "cstorm_mirrorShader",
    in_shop = true,
    weight = 3,
    extra_cost = 5,
    badge_colour = SMODS.Gradients["cstorm_mirrorGradient"],
    sound = { sound = "cstorm_mirror1" },

    calculate = function(self, card, context)
        if card.debuff then
            SMODS.debuff_card(card, false, "mirrorEdition")
            local RNGesus = nil
            if card.ability.set == "Joker" then
                while RNGesus == nil or RNGesus.debuff == true or RNGesus == card do
                    local i = (i or 0) + 1
                    RNGesus = pseudorandom_element(G.jokers.cards, "mirrorReflect")
                    if i >= 10 then break end
                end
            elseif card.ability.consumeable then
                while RNGesus == nil or RNGesus.debuff == true or RNGesus == card do
                    local i = (i or 0) + 1
                    RNGesus = pseudorandom_element(G.consumeables.cards, "mirrorReflect")
                    if i >= 10 then break end
                end
            elseif card.ability.set == "Default" or card.ability.set == "Enhanced" then
                while RNGesus == nil or RNGesus.debuff == true or RNGesus == card do
                    local i = (i or 0) + 1
                    RNGesus = pseudorandom_element(G.hand.cards, "mirrorReflect")
                    if i >= 10 then break end
                end
            end
            SMODS.debuff_card(RNGesus, true, "mirrorEdition")
            RNGesus:juice_up()
            RNGesus.e_cstorm_mirror = true
        end

        --Remove the debuff after the hand scored
        if context.after then
            for _, v in pairs(G.I.CARD) do
                if v.e_cstorm_mirror == true then
                    SMODS.debuff_card(v, false, "mirrorEdition")
                    v.e_cstorm_mirror = false
                end
            end
        end
    end
}

SMODS.Edition{
    key = "fractal",
    config = { repetitions  = 1 },
    shader = "cstorm_fractalShader",
    in_shop = true,
    weight = 2,
    extra_cost = 5,
    badge_colour = SMODS.Gradients["cstorm_fractalGradient"],
    sound = { sound = "cstorm_fractal1", --[[vol = 0.7]] },

    calculate = function (self, card, context)
        if card.ability.set == "Joker" then
            if context.retrigger_joker_check and self then
                return {
                    repetitions = card.edition.repetitions
                }
            end
        elseif card.ability.set == "Default" or card.ability.set == "Enhanced" then
            if context.repetition then
                return{
                    repetitions = card.edition.repetitions
                }
            end
        end
    end
}

SMODS.Edition{
    key = "glitch",
    config = { odds = 4 },
    shader = "cstorm_glitchShader",
    in_shop = true,
    weight = 0,
    extra_cost = 5,
    badge_colour = SMODS.Gradients["cstorm_glitchGradient"],
    sound = { sound = "cstorm_glitch1", vol = 0.7 },

    calculate = function (self, card, context)
        --Add the 1 in 4 to not trigger
    end,

    in_pool = function (self, args)
        return false
    end
}
