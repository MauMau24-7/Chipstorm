SMODS.Joker {
    key = "dog",
    config = { extra = { mult = 0, activated = false, multiplier = 20, count = 1 } },
    pos = { x = 0, y = 0 },
    rarity = "cstorm_chatter",
    cost = 20,
    blueprint_compat = true,
    eternal_compat = true,
    unlocked = true,
    discovered = false,
    atlas = 'jokers_SPACEHOLDER',

    calculate = function(self, card, context)
        if context.blind then
            if next(SMODS.find_card("j_cstorm_shnack")) then
                for _, shnack in ipairs(SMODS.find_card("j_cstorm_shnack")) do
                    card.ability.extra.mult = (shnack.ability.extra.chips * card.ability.extra.multiplier) + card.ability.extra.mult
                    SMODS.destroy_cards(shnack)
                end
            end
        end

        if context.joker_main then
            card.ability.extra.count = 1
            return {
                mult = card.ability.extra.mult
            }
        end
    end,

    loc_vars = function(self, info_queue, card)
        info_queue[#info_queue + 1] = { set = "Other", key = "chatter_name", specific_vars = { "TheDogVT" } }
        return { vars = { card.ability.extra.mult, card.ability.extra.multiplier }, key = self.key }
    end
}
