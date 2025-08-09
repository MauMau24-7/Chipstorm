SMODS.Atlas({
    key = "pimp_my_deck",
    path = "j_SPACEHOLDER.png",
    px = 71,
    py = 95
})

SMODS.Joker{
    key = "pimp_my_deck",
    config = { extra = { chips = 30 } },
    pos = { x = 0, y = 0 },
    rarity = 3,
    cost = 9,
    blueprint_compat = true,
    eternal_compat = true,
    unlocked = true,
    discovered = true,
    effect = nil,
    atlas = 'pimp_my_deck',
    soul_pos = nil,

    calculate = function(self, card, context)
        if not (context.joker_main and context.cardarea == G.jokers) then
          return
        end

        local cards_amount = 0

        -- Check every card: can't be a nil-edition inside
        for _, other in ipairs(context.scoring_hand) do
            if not other.edition then
                return -- no matter what error: Joker stays still
            end
            cards_amount = cards_amount + 1
        end

        -- if every card has an edition then give chips equal to that
        local bonus = card.ability.extra.chips * cards_amount
        return { chips = bonus }
    end,

    loc_vars = function(self, info_queue, card)
        return { vars = { card.ability.extra.chips }, key = self.key }
    end,
}