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
    apply_to_float = true,

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

SMODS.Edition {
    key = "fractal",
    config = { repetitions = 1 },
    shader = "cstorm_fractalShader",
    in_shop = true,
    weight = 2,
    extra_cost = 5,
    badge_colour = SMODS.Gradients["cstorm_fractalGradient"],
    sound = { sound = "cstorm_fractal1", --[[vol = 0.7]] },

    calculate = function(self, card, context)
        if card.ability.set == "Joker" then
            if context.retrigger_joker_check and context.other_card == card then
                return {
                    repetitions = card.edition.repetitions
                }
            end
        elseif card.ability.set == "Default" or card.ability.set == "Enhanced" then
            if context.repetition then
                return {
                    repetitions = card.edition.repetitions
                }
            end
        end
    end
}

SMODS.Edition {
    key = "glitch",
    config = { odds = 8 },
    shader = "cstorm_glitchShader",
    in_shop = false,
    weight = 2,
    extra_cost = 0,
    badge_colour = SMODS.Gradients["cstorm_glitchGradient"],
    sound = { sound = "cstorm_glitch1", vol = 0.7 },
    apply_to_float = true,

    calculate = function(self, card, context)
        if context.after and SMODS.pseudorandom_probability(card, 'cstorm_glitch', 1, card.edition.odds) then
            return {
                func = function()
                    local destroyed_cards = {}
                    local temp_hand = SMODS.shallow_copy(G.hand.cards)
                    table.sort(temp_hand,
                        function(a, b) return not a.playing_card or not b.playing_card or a.playing_card < b
                            .playing_card end)
                    pseudoshuffle(temp_hand, 'seed')
                    for i = 1, pseudorandom('seed', 1, #G.hand.cards) do table.insert(destroyed_cards, temp_hand[i]) end
                    SMODS.destroy_cards(destroyed_cards)
                end
            }
        end
    end,

    in_pool = function(self, args)
        return false
    end,

    loc_vars = function(self, info_queue, card)
        return { vars = { card.edition.odds }, key = self.key }
    end
}

SMODS.Edition {
    key = "curse",
    config = { mult = 5 },
    shader = "cstorm_curseShader",
    in_shop = false,
    weight = 2,
    extra_cost = 0,
    badge_colour = HEX("8000CC"),
    sound = { sound = "cstorm_curse1", --[[vol = 0.7]] },

    calculate = function(self, card, context)
        if context.post_joker or (context.main_scoring and context.cardarea == G.play) then
            return {
                mult = -card.edition.mult
            }
        end
    end,

    in_pool = function(self, args)
        return false
    end,

    loc_vars = function(self, info_queue, card)
        return { vars = { card.edition.mult }, key = self.key }
    end
}

SMODS.Edition {
    key = "chaotic",
    config = { mult = 5 },
    shader = "cstorm_chaoticShader",
    in_shop = false,
    weight = 2,
    extra_cost = 0,
    badge_colour = HEX("8000CC"),
    disable_base_shader = true,
    sound = { sound = "cstorm_chaotic1", vol = 0.7 },

    calculate = function(self, card, context)
        if context.press_play and card.ability.set == "Joker" then
            local my_pos = nil
            for i = 1, #G.jokers.cards do
                if G.jokers.cards[i] == card then
                    my_pos = i
                    break
                end
            end

            local RNGesus = pseudorandom("cstorm_chaotic", 1, #G.jokers.cards)
            local swapped_joker = G.jokers.cards[RNGesus]
            G.jokers.cards[RNGesus] = G.jokers.cards[my_pos]
            G.jokers.cards[my_pos] = swapped_joker
        end
    end,

    in_pool = function(self, args)
        return false
    end
}

SMODS.Edition {
    key = "void",
    config = {},
    shader = "cstorm_voidShader",
    in_shop = false,
    weight = 2,
    extra_cost = 0,
    badge_colour = HEX("000000"),
    disable_base_shader = true, --needed if form of object needs to be distorted
    disable_shadow = true,
    apply_to_float = true,
    sound = { sound = "cstorm_void1", vol = 0.7 },

    calculate = function(self, card, context)
        if (context.main_scoring and context.cardarea == G.play) or context.pre_joker then
            return { mult_mod = -mult }
        end
    end,

    in_pool = function(self, args)
        return false
    end
}

SMODS.Edition {
    key = "forgotten",
    config = { odds = 60, changedOdds = false },
    shader = "cstorm_forgottenShader",
    in_shop = false,
    weight = 2,
    extra_cost = 0,
    badge_colour = HEX("4B0082"),
    disable_base_shader = true,
    disable_shadow = true,
    apply_to_float = true, --// FIXME: WHY IS IT NOT APPLYING TO FLOATS?! IT'S TRUE!
    sound = { sound = "cstorm_forgotten1", vol = 0.7 },

    calculate = function(self, card, context)
        if context.after then
            card.edition.changedOdds = false
            if SMODS.pseudorandom_probability(card, 'cstorm_forgotten', 1, card.edition.odds) then
                card:remove()
            else
                card.edition.odds = math.floor(card.edition.odds / 2)
            end
        end
        if context.end_of_round and not card.edition.changedOdds then
            card.edition.changedOdds = true
            card.edition.odds = card.edition.odds * math.random(5)
        end
    end,

    in_pool = function(self, args)
        return false
    end,

    on_apply = function (card)
        increase_volume_over_frames(10, 1, 300)
    end
}
