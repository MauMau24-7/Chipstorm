SMODS.Joker{
    key = "the_boulder",
    config = { extra = { chips = 50, allChips = 0, stone_card = 0, stone = false } },
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
            card.ability.extra.stone_card = 0
            card.ability.extra.chips = 50
            card.ability.extra.allChips = 50
            card.ability.extra.stone = false

            for _, c in ipairs(context.scoring_hand) do
                if SMODS.has_enhancement(c, 'm_stone') or SMODS.has_enhancement(c, 'm_cstorm_rock') then
                    card.ability.extra.stone_card = card.ability.extra.stone_card + 1
                    card.ability.extra.stone = true
                end
            end

            card.ability.extra.allChips = card.ability.extra.chips * card.ability.extra.stone_card
        end

        if context.joker_main and context.cardarea == G.jokers and card.ability.extra.stone_card > 0 and card.ability.extra.stone == true then
            return{
                chips = card.ability.extra.allChips
            }
        end
    end,

    loc_vars = function(self, info_queue, card)
        return { vars = { card.ability.extra.chips }, key = self.key }
    end,
}