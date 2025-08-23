SMODS.Consumable{
    key = "void_chip",
    set = 'cstorm_tokens',
    atlas = "tokens",
    pos = { x = 0, y = 0},
    pixel_size = { w = 71, h = 71 },
    config = { chips = 200, beforeSelection = 5, maxCardSelection = 1, active = false },
    unlocked = true,
    discovered = true,
    cost = 5,
    
-- TODO: Add +200 chips to the next hand
-- TODO: Maybe make chips last for x Rounds instead of usables

    calculate = function (self, card, context)
        if context.after and self.config.active == true then
            self.config.active = false
            SMODS.change_play_limit(self.config.beforeSelection - 1)

            SMODS.destroy_cards(card)
        end
    end,

    use = function(self, card, area)
        self.config.active = true
        self.config.beforeSelection = G.hand.config.highlighted_limit
        
        self.config.maxCardSelection = G.hand.config.highlighted_limit -1

        SMODS.change_play_limit(-self.config.maxCardSelection)

    end,

    can_use = function (self, card)
        if self.config.active == false then
            return true
        end
    end,

    keep_on_use = function (self, card)
        return true
    end,

    loc_vars = function(self, info_queue, card)
        return{ vars = { self.config.chips, self.config.maxCardSelection }, key = self.key}
    end
}
