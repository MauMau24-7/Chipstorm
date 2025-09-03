SMODS.Joker{
    key = "chipy",
    config = { extra = { chips = 50, chipsMod = 25 } },
    pos = { x = 3, y = 1 },
    rarity = 1,
    cost = 4,
    blueprint_compat = true,
    eternal_compat = true,
    unlocked = true,
    discovered = false,
    atlas = 'jokers',

    calculate = function (self, card, context)
        if context.joker_main then
            return {
                chips = card.ability.extra.chips
            }
        end

        if context.buying_card and not context.blueprint_card then
           if context.card.ability.set == "Joker" then
            card.ability.extra.chips = card.ability.extra.chips + card.ability.extra.chipsMod
            return {
                extra = {focus = context.self, colour = G.C.CHIPS, message = localize('k_upgrade_ex')}
            }
           end
        end
    end,

    loc_vars = function (self, info_queue, card)
        return { vars = { card.ability.extra.chips, card.ability.extra.chipsMod}, key = self.key }
    end
}