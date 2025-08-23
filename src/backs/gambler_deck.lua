SMODS.Back {
    key = "gambler_deck",
    config = { tokenGiven = false },
    pos = { x = 5, y = 0 },
    unlocked = true,
    discovered = true,

    calculate = function(self, back, context)
        if context.end_of_round and context.beat_boss and self.config.tokenGiven == false then
            self.config.tokenGiven = true
            SMODS.add_card({ set = 'cstorm_tokens' })
        end

        if context.setting_blind then
            self.config.tokenGiven = false
        end
    end,
}
