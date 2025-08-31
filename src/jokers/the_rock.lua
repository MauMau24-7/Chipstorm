SMODS.Joker {
    key = "the_rock",
    pos = { x = 3, y = 2 },
    rarity = 2,
    cost = 4,
    eternal_compat = true,
    unlocked = true,
    discovered = true,
    atlas = "jokers",

    calculate = function(self, card, context)
        if context.before and context.main_eval and not context.blueprint then
            local stones = 0
            for _, scored_card in ipairs(context.scoring_hand) do
                if SMODS.has_enhancement(scored_card, 'm_stone') then
                    stones = stones + 1
                    scored_card:set_ability('m_cstorm_rock', nil, true)
                    G.E_MANAGER:add_event(Event({
                        func = function()
                            scored_card:juice_up()
                            return true
                        end
                    }))
                end
            end
            if stones > 0 then
                return {
                    message = "ROCK",
                    colour = G.C.GREY
                }
            end
        end
    end,

    loc_vars = function (self, info_queue, card)
        info_queue[#info_queue+1] = {set = "Other", key = "rock_description"}
    end
}