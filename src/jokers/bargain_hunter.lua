-- Credits to Tangents
SMODS.Joker{
    key = "bargain_hunter",
    config = { extra = { discount_percent = 50 } },
    pos = { x = 0, y = 0 },
    rarity = 3,
    cost = 8,
    blueprint_compat = false,
    eternal_compat = true,
    unlocked = true,
    discovered = false,
    atlas = 'jokers_SPACEHOLDER',

    calculate = function (self, card, context)
        if (context.dollars_modified or context.first_hand_drawn) and not context.blueprint then
            G.GAME.discount_percent = card.ability.extra.discount_percent
            
            G.E_MANAGER:add_event(Event({
                func = function()
                    for _, v in pairs(G.I.CARD) do
                        if v.set_cost then v:set_cost() end
                    end
                    return true
                end
            }))
        end

        if context.starting_shop and not context.blueprint then
            card:juice_up(0.5, 0.5)
        end
    end,

    remove_from_deck = function(self, card)
        G.GAME.discount_percent = 0
        for _, v in pairs(G.I.CARD) do
            if v.set_cost then v:set_cost() end
        end
    end,

    loc_vars = function (self, info_queue, card)
        return { vars = { card.ability.extra.discount_percent }, key = self.key }
    end
}