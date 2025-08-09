SMODS.Atlas({
    key = "foil_factor",
    path = "j_SPACEHOLDER.png",
    px = 71,
    py = 95
})

-- This doesn't work!

SMODS.Joker{
    key = "foil_factor",
    config = { extra = { chips = 15, card_amount = 0 } },
    pos = { x = 0, y = 0 },
    rarity = 1,
    cost = 3,
    blueprint_compat = true,
    eternal_compat = true,
    unlocked = true,
    discovered = true,
    effect = nil,
    atlas = 'foil_factor',
    soul_pos = nil,

    calculate = function(self, card, context)
        
        if context.before and context.cardarea == G.jokers then
            card.ability.extra.card_amount = 0
        end

        if context.individual and context.cardarea == G.jokers then
            for _, c in ipairs(context.scoring_hand) do
                if context.c.edition and context.c.edition.key == "e_foil" then
                    card.ability.extra.card_amount = card.ability.extra.card_amount + 1
                end
            end

            bonus = card.ability.extra.chips * cards_amount
        end


        if context.joker_main and context.cardarea == G.jokers then

            return{
                chips = bonus
            }
        end
    end,

    loc_vars = function(self, info_queue, card)
        return { vars = { card.ability.extra.chips }, key = self.key}
    end,
}