SMODS.Joker{
    key = "the_converter",
    config = { extra = { mult = 10, chips = 500 } },
    pos = { x = 7, y = 2 },
    rarity = 3,
    cost = 8,
    blueprint_compat = true,
    eternal_compat = true,
    unlocked = true,
    discovered = false,
    atlas = 'jokers',

    calculate = function (self, card, context)
        if context.joker_main then
            return{
                mult = -card.ability.extra.mult,
                chips = card.ability.extra.chips
            }
        end
    end,

    loc_vars = function (self, info_queue, card)
        return { vars = { card.ability.extra.mult, card.ability.extra.chips }, key = self.key }
    end
}