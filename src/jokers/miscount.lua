SMODS.Joker{
    key = "miscount",
    config = { extra = { min_chips = 0, max_chips = 200, rand_key = 'miscount' } },
    pos = { x = 1, y = 0 },
    rarity = 1,
    cost = 4,
    blueprint_compat = true,
    eternal_compat = true,
    unlocked = true,
    discovered = true,
    effect = nil,
    atlas = 'jokers',
    soul_pos = nil,

    calculate = function(self, card, context)
        if context.before and context.cardarea == G.jokers then
            card.ability.extra.chips = math.floor(pseudorandom(card.ability.extra.rand_key) * (card.ability.extra.max_chips - card.ability.extra.min_chips + 1)) + card.ability.extra.min_chips
        end

        if context.joker_main and context.cardarea == G.jokers then
            return {
                chips = card.ability.extra.chips
            }
        end
    end,

  loc_vars = function(self, info_queue, card)
    return { vars = { card.ability.extra.chips, card.ability.extra.min_chips, card.ability.extra.max_chips }, key  = self.key }
  end,
}