SMODS.Atlas({
    key = "juggling_jack",
    path = "j_juggling_jack.png",
    px = 71,
    py = 95
})

SMODS.Joker{
    key = "juggling_jack",
    config = { extra = { chips = 5 } },
    pos = { x = 0, y = 0 },
    rarity = 2,
    cost = 5,
    blueprint_compat = true,
    eternal_compat = true,
    unlocked = true,
    discovered = true,
    effect = nil,
    atlas = 'juggling_jack',
    soul_pos = nil,

    calculate = function(self, card, context)
        if context.discard then
            context.other_card.ability.perma_bonus = context.other_card.ability.perma_bonus + card.ability.extra.chips
            return {
                extra = {focus = context.other_card, message = localize('k_upgrade_ex')}
            }
        end
    end,

    loc_vars = function(self, info_queue, card)
        return { vars = { card.ability.extra.chips }, key = self.key }
    end,
}