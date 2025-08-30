SMODS.Consumable {
    key = "neon_chip",
    set = 'cstorm_tokens',
    atlas = "tokens",
    pos = { x = 1, y = 0 },
    pixel_size = { w = 71, h = 71 },
    config = { chips = 75, chipsAll = 0, jokerAmount = 0, active = false, },
    unlocked = true,
    discovered = true,
    cost = 6,

    calculate = function(self, card, context)
        self.config.jokerAmount = #G.jokers.cards
        self.config.chipsAll = self.config.chips * self.config.jokerAmount

        if context.joker_main and self.config.active == true then
            return {
                chips = self.config.chipsAll
            }
        end

        if context.after and self.config.active == true then
            self.config.active = false
            SMODS.destroy_cards(card)
        end
    end,

    use = function(self, card, area, copier)
        self.config.active = true
    end,

    can_use = function(self, card)
        if G.GAME.blind.in_blind == true and self.config.active == false then
            return true
        end
    end,

    keep_on_use = function(self, card)
        return true
    end,

    loc_vars = function(self, info_queue, card)
        return { vars = { self.config.chips, self.config.chipsAll, self.config.active }, key = self.key }
    end
}
