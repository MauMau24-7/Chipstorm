SMODS.Joker{
    key = "fast_draw",
    config = { extra = { chips = 50, chipsMod = 25, discards = 0 } },
    pos = { x = 6, y = 1 },
    atlas = "jokers",
    blueprint_compat = true,
    discovered = true,
    unlocked = true,
    rarity = 2,
    cost = 5,

    calculate = function (self, card, context)
        if context.blind then
            card.ability.extra.discards = G.GAME.current_round.discards_left
        end

        if context.joker_main then
            return {
                chips = card.ability.extra.chips
            }
        end

        if context.end_of_round and not context.repetition and not context.individual and not context.blueprint_card then
            if card.ability.extra.discards == G.GAME.current_round.discards_left then
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