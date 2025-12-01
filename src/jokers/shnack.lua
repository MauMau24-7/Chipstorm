SMODS.Joker{
    key = "shnack",
    config = { extra = { chips = 0, chipsMod = 0.2 } },
    pos = { x = 0, y = 0 },
    rarity = 1,
    cost = 2,
    blueprint_compat = false,
    eternal_compat = false,
    unlocked = true,
    discovered = false,
    atlas = 'jokers_SPACEHOLDER',

    calculate = function (self, card, context)
        if context.joker_main then
            return {
                chips = card.ability.extra.chips
            }
        end

        if context.end_of_round and not context.repetition and not context.individual then
            card.ability.extra.chips = card.ability.extra.chips + card.ability.extra.chipsMod
            return {
                    extra = {focus = context.self, message = localize('k_upgrade_ex')}
                }
        end
    end,

    loc_vars = function (self, info_queue, card)
        return { vars = { card.ability.extra.chips, card.ability.extra.chipsMod }, key = self.key}
    end
}