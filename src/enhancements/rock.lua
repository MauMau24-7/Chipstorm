SMODS.Enhancement{
    key = "rock",
    pos = { x = 0, y = 0 },
    config = { extra = { chipMult = 1.5 } },
    atlas = 'rock',
    discovered = true,
    unlocked = true,
    replace_base_card = true,
    no_rank = true,
    no_suit = true,
    always_scores = true,

    loc_vars = function(self, info_queue, card)
        return { vars = { card.ability.extra.chipMult }, key = self.key }
    end,

    calculate = function(self, card, context)
        if context.main_scoring and context.cardarea == G.play then
            return {
                xchips = card.ability.extra.chipMult
            }
        end
    end

}