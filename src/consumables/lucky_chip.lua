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
            self.config.inBlind = true
        end

        if context.end_of_round then
            self.config.inBlind = false
            if self.config.active == true then
                self.config.active = false
                G.hand.config.card_limit = G.hand.config.card_limit - self.config.extraHandSize
                SMODS.destroy_cards(card)
            end
        end

    end,

    use = function(self, card, area, copier)
        self.config.active = true

        G.hand.config.card_limit = G.hand.config.card_limit + 2
    end,

    can_use = function(self, card)
        if self.config.inBlind == true and self.config.active == false then
            return true
        end
    end,

    keep_on_use = function(self, card)
        return true
    end,

    loc_vars = function(self, info_queue, card)
        return { vars = { self.config.extraHandSize, self.config.active }, key = self.key }
    end

}