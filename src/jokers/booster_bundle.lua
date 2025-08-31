SMODS.Joker {
    key = "booster_bundle",
    config = { extra = { chips = 30, chipsMod = 15 } },
    pos = { x = 5, y = 1 },
    rarity = 2,
    cost = 5,
    blueprint_compat = true,
    eternal_compat = true,
    unlocked = true,
    discovered = true,
    effect = nil,
    atlas = 'jokers',
    soul_pos = nil,

    calculate = function(self, card, context)
        if context.open_booster then
            card.ability.extra.chips = card.ability.extra.chips + card.ability.extra.chipsMod
            return {
                extra = {focus = context.self, message = localize('k_upgrade_ex')}
            }
        end

        if context.joker_main then
            return {
                chips = card.ability.extra.chips
            }
        end
    end,

    loc_vars = function(self, info_queue, card)
        return { vars = { card.ability.extra.chips, card.ability.extra.chipsMod }, key = self.key }
    end
}
