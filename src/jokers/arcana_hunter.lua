SMODS.Joker{
    key = "arcana_hunter",
    config = { extra = { chips = 50, chipsMod = 80, tarotsBought = 0, tarotsNeeded = 3 } },
    pos = { x = 0, y = 0 },
    rarity = 2,
    cost = 6,
    blueprint_compat = true,
    eternal_compat = true,
    unlocked = true,
    discovered = true,
    effect = nil,
    atlas = 'jokers_SPACEHOLDER',
    soul_pos = nil,

    calculate = function (self, card, context)
        if context.buying_card and not context.blueprint_card then
            if context.card.ability.set ==  "Tarot" or context.card.ability.set == "Planet" or context.card.ability.set == "Spectral" then
                card.ability.extra.tarotsBought = card.ability.extra.tarotsBought + 1
                if card.ability.extra.tarotsBought == card.ability.extra.tarotsNeeded then
                    card.ability.extra.chips = card.ability.extra.chips + card.ability.extra.chipsMod
                    card.ability.extra.tarotsBought = 0
                    return{
                        extra = {focus = context.self, message = localize('k_upgrade_ex')}
                    }
                elseif context.card.ability.set ==  "Tarot" then
                    return{
                        message = tostring(card.ability.extra.tarotsBought),
                        colour = G.C.PURPLE
                    }
                elseif context.card.ability.set ==  "Planet" then
                    return{
                        message = tostring(card.ability.extra.tarotsBought),
                        colour = G.C.CHIPS
                    }
                elseif context.card.ability.set ==  "Spectral" then
                    return{
                        message = tostring(card.ability.extra.tarotsBought),
                        colour = G.C.DARK_EDITION
                    }
                end
            end
        end

        if context.ending_shop and card.ability.extra.tarotsBought > 0 then
            card.ability.extra.tarotsBought = 0
            return{
                extra = {focus = context.self, message = localize('k_reset')}
            }
        end

        if context.joker_main then
            return{
                chips = card.ability.extra.chips
            }
        end

    end,

    loc_vars = function (self, info_queue, card)
        return { vars = { card.ability.extra.chips, card.ability.extra.chipsMod, card.ability.extra.tarotsNeeded, card.ability.extra.tarotsBought }, key = self.key }
    end
}