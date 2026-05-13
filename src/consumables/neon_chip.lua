SMODS.Consumable {
    key = "neon_chip",
    set = 'cstorm_tokens',
    atlas = "tokens",
    pos = { x = 1, y = 0 },
    pixel_size = { w = 71, h = 71 },
    config = { chips = 30, chipsAll = 0, jokerAmount = 0, active = false, },
    unlocked = true,
    discovered = true,
    cost = 6,

    calculate = function(self, card, context)
        card.ability.jokerAmount = #G.jokers.cards
        card.ability.chipsAll = card.ability.chips * card.ability.jokerAmount

        if card.ability.active == true then
            card.states.click.can = false
            local eval = function(card) return card.ability.active and not G.RESET_JIGGLES end
            juice_card_until(card, eval, true)

            if context.joker_main then
                return {
                    chips = card.ability.chipsAll
                }
            end

            if context.after then
                card.ability.active = false
                SMODS.destroy_cards(card)
            end
        end
    end,

    use = function(self, card, area, copier)
        card.ability.active = true
    end,

    can_use = function(self, card)
        if G.GAME.blind.in_blind == true and card.ability.active == false then
            return true
        end
    end,

    keep_on_use = function(self, card)
        return true
    end,

    loc_vars = function(self, info_queue, card)
        return { vars = { card.ability.chips, card.ability.chipsAll, card.ability.active }, key = self.key }
    end
}
