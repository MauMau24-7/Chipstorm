SMODS.Atlas({
    key = "one_hand_wonder",
    path = "Jokers.png",
    px = 71,
    py = 95,
})

SMODS.Joker{
    key = "one_hand_wonder",
    config = { extra = { chips = 30, chipsMod = 30, hands = 0 } },
    pos = { x = 8, y = 0 },
    atlas = "one_hand_wonder",
    blueprint_compat = true,
    discovered = true,
    unlocked = true,
    rarity = 2,
    cost = 5,

    calculate = function (self, card, context)
        if context.blind then
            card.ability.extra.hands = G.GAME.current_round.hands_left
        end

        if context.joker_main then
            return {
                chips = card.ability.extra.chips
            }
        end

        if context.end_of_round and not context.repetition and not context.individual and not context.blueprint_card then
            if card.ability.extra.hands == G.GAME.current_round.hands_left + 1 then
                card.ability.extra.chips = card.ability.extra.chips + card.ability.extra.chipsMod
                return {
                    extra = {focus = context.self, message = localize('k_upgrade_ex')}
                }
            end
        end
    end,

    loc_vars = function(self, info_queue, card)
        return { vars = { card.ability.extra.chips, card.ability.extra.chipsMod }, key = self.key }
    end
}