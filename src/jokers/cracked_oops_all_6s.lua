SMODS.Joker {
    key = "broken_odds",
    config = { extra = { chips = 30 } },
    pos = { x = 4, y = 2 },
    rarity = 1,
    cost = 4,
    blueprint_compat = true,
    eternal_compat = true,
    unlocked = true,
    discovered = false,
    atlas = 'jokers',

    calculate = function(self, card, context)
        if context.mod_probability and not context.blueprint then
            return {
                numerator = context.numerator + 1,
                denominator = context.denominator + 1
            }
        end

        -- if context.joker_main then
        --     return {
        --         chips = card.ability.extra.chips
        --     }
        -- end
    end,

    loc_vars = function(self, info_queue, card)
        return { vars = { card.ability.extra.chips }, key = self.key }
    end
}
