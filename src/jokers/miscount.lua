SMODS.Joker{
    key = "miscount",
    config = { extra = { min_chips = 0, max_chips = 200 } },
    pos = { x = 1, y = 0 },
    rarity = 1,
    cost = 4,
    blueprint_compat = true,
    eternal_compat = true,
    unlocked = true,
    discovered = false,
    atlas = 'jokers',

    calculate = function(self, card, context)
        if context.joker_main then
            card.ability.extra.chips = math.floor(pseudorandom("miscount", card.ability.extra.min_chips, card.ability.extra.max_chips))
            return {
                chips = card.ability.extra.chips
            }
        end
    end,

  loc_vars = function(self, info_queue, card)
    return { vars = { card.ability.extra.chips, card.ability.extra.min_chips, card.ability.extra.max_chips }, key  = self.key }
  end,
}