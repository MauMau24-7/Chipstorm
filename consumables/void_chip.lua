SMODS.ConsumableType{
    key = "cstorm_Tokens",
    collection_rows = { 4, 5 },
    primary_colour = HEX ('000000'),
    secondary_colour = HEX ('ffffff'),
}

SMODS.Atlas({
    key = "void_chip",
    path = "void_chip.png",
    px = 71,
    py = 95
})

SMODS.Consumable{
    key = "void_chip",
    set = 'cstorm_Tokens',
    atlas = "void_chip",
    pos = { x = 0, y = 0},
    pixel_size = { w = 71, h = 71 },
    config = { chips = 200, beforeSelection = 5, active = false },
    unlocked = true,
    discovered = true,
    cost = 5,
    
    
--TODO: Change play limit back to beforeSelection
--TODO: Add +200 chips to the next hand
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
        
        local maxCardSelection = G.hand.config.highlighted_limit -1

        SMODS.change_play_limit(-maxCardSelection)

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
