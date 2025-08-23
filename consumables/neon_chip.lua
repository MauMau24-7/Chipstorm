SMODS.Atlas({
    key = "neon_chip",
    path = "neon_chip.png",
    px = 71,
    py = 95
})

SMODS.Consumable{
    key = "neon_chip",
    set = 'cstorm_Tokens',
    atlas = "neon_chip",
    pos = { x = 0, y = 0},
    pixel_size = { w = 71, h = 71 },
    config = { chips = 75, chipsAll = 0, jokerAmount = 0, inBlind = false, active = false },
    unlocked = true,
    discovered = true,
    cost = 6,
    
    calculate = function (self, card, context)
        self.config.jokerAmount = #G.jokers.cards
        self.config.chipsAll = self.config.chips * self.config.jokerAmount
        
        if context.blind then
            self.config.inBlind = true
        end

        if context.final_scoring_step and self.config.active == true then
            return{
                chips = self.config.chipsAll
            }
        end

        if context.after and self.config.active == true then
            self.config.active = false
            SMODS.destroy_cards(card)
        end

        if context.end_of_round then
            self.config.inBlind = false
        end
    end,

    use = function (self, card, area, copier)
        self.config.active = true
    end,
    
    can_use = function (self, card)
        if self.config.inBlind == true and self.config.active == false then
            return true
        end
    end,

    keep_on_use = function (self, card)
        return true
    end,

    loc_vars = function(self, info_queue, card)
        return{ vars = { self.config.chips, self.config.chipsAll, self.config.active }, key = self.key}
    end
}
