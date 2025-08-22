--sounds

SMODS.Sound({
    key = "charge_up1",
    path = "s_charge_up1.ogg"
})

SMODS.Sound({
    key = "charge_up2",
    path = "s_charge_up2.ogg"
})

SMODS.Sound({
    key = "charge_up3",
    path = "s_charge_up3.ogg"
})

SMODS.Sound({
    key = "overcharge",
    path = "s_overcharge.ogg"
})

---------------------------------------------------------------------------------------------------

---joker

SMODS.Joker{
    key = "final_push",
    config = { extra = { xchips = 2, hand_count_before = 0 } },
    pos = { x = 4, y = 0 },
    rarity = 3,
    cost = 8,
    blueprint_compat = true,
    eternal_compat = true,
    unlocked = true,
    discovered = true,
    effect = nil,
    atlas = 'jokers',
    soul_pos = nil,

    calculate = function(self, card, context)

        if context.before then
            card.ability.extra.hand_count_before = G.GAME.current_round.hands_left
        end

        if context.joker_main then

            if card.ability.extra.hand_count_before == 3 then
                return { message = not context.blueprint and "Charging...", colour = G.C.BLUE, sound = "cstorm_charge_up1" }
            end
            if card.ability.extra.hand_count_before == 2 then
                return { message = not context.blueprint and "Charging...", colour = G.C.BLUE, sound = "cstorm_charge_up2" }
            end
            if card.ability.extra.hand_count_before == 1 then
                return { message = not context.blueprint and "Fully Charged", colour = G.C.BLUE, sound = "cstorm_charge_up3" }
            end

            if G.GAME.current_round.hands_left == 0 and context.blueprint then
                return {
                    xchips = card.ability.extra.xchips
                }
            end
            if G.GAME.current_round.hands_left == 0 and not context.blueprint then
                return {
                    message = "Overcharged!",
                    colour = G.C.BLUE,
                    sound = "cstorm_overcharge",
                    remove_default_message = true,
                    xchips = card.ability.extra.xchips
                }
            end
        end
    end,

    loc_vars = function(self, info_queue, card)
        return { vars = { card.ability.extra.xchips }, key = self.key }
    end,

    update = function(self, card, dt)
        if G.GAME.current_round.hands_left >= 4 then
            card.children.center:set_sprite_pos({x = 4, y = 0})
        end
        if G.GAME.current_round.hands_left == 3 then
            card.children.center:set_sprite_pos({x = 5, y = 0})
        end
        if G.GAME.current_round.hands_left == 2 then
            card.children.center:set_sprite_pos({x = 6, y = 0})
        end
        if G.GAME.current_round.hands_left == 1 then
            card.children.center:set_sprite_pos({x = 7, y = 0})
        end
    end,
}