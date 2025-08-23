SMODS.Atlas({
    key = "cracked_stone",
    path = "cracked_stone.png",
    px = 71,
    py = 95
})

SMODS.Enhancement{
    key = "cracked_stone",
    pos = { x = 0, y = 0 },
    config = { x_chips = 1.2, extra = { odds = 4 } },
    atlas = 'cracked_stone',
    discovered = true,
    unlocked = true,
    replace_base_card = true,
    no_rank = true,
    no_suit = true,
    always_scores = true,

    loc_vars = function(self, info_queue, card)
        local numerator, denominator = SMODS.get_probability_vars(card, 1, card.ability.extra.odds, 'cracked_stone')
        return { vars = { card.ability.x_chips, numerator, denominator }, key = self.key }
    end,

    calculate = function(self, card, context)
        if context.before and SMODS.pseudorandom_probability(card, 'cracked_stone', 1, card.ability.extra.odds) then
            for _,v in ipairs (G.play.cards) do
                -- What goes in here now?
            end
        end
    end

}