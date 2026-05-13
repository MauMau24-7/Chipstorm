SMODS.Joker{
    key = "ethereal_joker",
    config = { extra = { chips = 20 } },
    pos = { x = 8, y = 2 },
    rarity = 2,
    cost = 6,
    blueprint_compat = true,
    eternal_compat = true,
    unlocked = true,
    discovered = false,
    atlas = 'jokers',

    calculate = function (self, card, context)
        if context.joker_main then
            return{
                chips = card.ability.extra.chips
            }
        end
    end,

    loc_vars = function(self, info_queue, card)
        return { vars = { card.ability.extra.chips }, key = self.key }
    end

}