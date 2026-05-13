SMODS.Consumable{
    key = "lucky_chip",
    set = 'cstorm_tokens',
    atlas = "tokens",
    pos = { x = 2, y = 0},
    pixel_size = { w = 71, h = 71 },
    config = { extraHandSize = 2, handSize = 0, inBlind = false, active = false },
    unlocked = true,
    discovered = true,
    cost = 3,

    calculate = function (self, card, context)
        if context.blind then
            card.ability.inBlind = true
        end

        if card.ability.active == true then
            card.states.click.can = false
            local eval = function(card) return card.ability.active and not G.RESET_JIGGLES end
            juice_card_until(card, eval, true)
        end

        if context.end_of_round then
            card.ability.inBlind = false
            if card.ability.active == true then
                card.ability.active = false
                G.hand.config.card_limit = G.hand.config.card_limit - card.ability.extraHandSize
                SMODS.destroy_cards(card)
            end
        end

    end,

    use = function(self, card, area, copier)
        card.ability.active = true

        G.hand.config.card_limit = G.hand.config.card_limit + 2
        SMODS.draw_cards(2)
    end,

    can_use = function(self, card)
        if card.ability.inBlind == true and card.ability.active == false then
            return true
        end
    end,

    keep_on_use = function(self, card)
        return true
    end,

    loc_vars = function(self, info_queue, card)
        return { vars = { card.ability.extraHandSize, card.ability.active }, key = self.key }
    end

}