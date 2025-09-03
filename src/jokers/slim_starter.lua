SMODS.Joker{
    key = "slim_starter",
    config = { extra = { chips = 100, cardMax = 30 } },
    pos = {x = 8, y = 1},
    rarity = 2,
    cost = 6,
    blueprint_compat = true,
    eternal_compat = true,
    unlocked = true,
    discovered = false,
    atlas = 'jokers',

    calculate = function(self, card, context)

        if context.before and context.cardarea == G.jokers then
            card.ability.extra.cards_in_deck = #G.playing_cards
        end

        if context.joker_main and card.ability.extra.cards_in_deck <= card.ability.extra.cardMax then
            return{
                chips = card.ability.extra.chips
            }
        end
    end,

    loc_vars = function(self, info_queue, card)
        return { vars = { card.ability.extra.chips, card.ability.extra.cardMax }, key = self.key }
    end,
}