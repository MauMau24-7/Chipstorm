
















SMODS.Atlas({
    key = "washed",
    path = "j_SPACEHOLDER.png",
    px = 71,
    py = 95,
})

SMODS.Joker{
    key = "washed",
    config = { extra = { } },
    pos = {x = 0, y = 0},
    rarity = 2,
    cost = 5,
    blueprint_compat = false,
    eternal_compat = true,
    unlocked = true,
    discovered = true,
    atlas = "washed",

    calculate = function (self, card, context)
        
        if context.joker_main then
            
        end
    end
}
