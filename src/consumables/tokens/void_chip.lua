-- SMODS.Consumable{
--     key = "void_chip",
--     set = 'cstorm_tokens',
--     atlas = "tokens",
--     pos = { x = 0, y = 0},
--     pixel_size = { w = 71, h = 71 },
--     config = { extra = { chips = 200, beforeSelection = 5, maxCardSelection = 1, active = false } },
--     unlocked = true,
--     discovered = true,
--     cost = 5,
    
-- -- TODO: Add +200 chips to the next hand
-- -- TODO: Maybe make chips last for x Rounds instead of usables

--     calculate = function (self, card, context)
--         if context.after and card.ability.extra.active == true then
--             card.ability.extra.active = false
--             SMODS.change_play_limit(card.ability.extra.beforeSelection - 1)

--             SMODS.destroy_cards(card)
--         end
--     end,

--     use = function(self, card, area)
--         card.ability.extra.active = true
--         card.ability.extra.beforeSelection = G.hand.config.highlighted_limit
        
--         card.ability.extra.maxCardSelection = G.hand.config.highlighted_limit -1

--         SMODS.change_play_limit(-card.ability.extra.maxCardSelection)

--     end,

--     can_use = function (self, card)
--         if card.ability.extra.active == false then
--             return true
--         end
--     end,

--     keep_on_use = function (self, card)
--         return true
--     end,

--     loc_vars = function(self, info_queue, card)
--         return{ vars = { card.ability.extra.chips, card.ability.extra.maxCardSelection }, key = self.key}
--     end
-- }
