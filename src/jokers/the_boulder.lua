SMODS.Joker{
    key = "the_boulder",
    config = { extra = { chips = 50, stone_card = false } },
    pos = {x = 2, y = 0},
    rarity = 1,
    cost = 3,
    blueprint_compat = true,
    eternal_compat = true,
    unlocked = true,
    discovered = true,
    effect = nil,
    atlas = 'jokers',
    soul_pos = nil,

    calculate = function(self, card, context)

        if context.before and context.cardarea == G.jokers then
            card.ability.extra.stone_card = false

            for _, c in ipairs(context.scoring_hand) do
                if SMODS.has_enhancement(c, 'm_stone') then -- or SMODS.has_enhancement(c, 'cracked_stone')
                    card.ability.extra.stone_card = true
                    break
                end
            end
        end

        if context.joker_main and context.cardarea == G.jokers and card.ability.extra.stone_card == true then
            return{
                chips = card.ability.extra.chips
            }
        end
    end,

    loc_vars = function(self, info_queue, card)
        return { vars = { card.ability.extra.chips }, key = self.key }
    end,
}