SMODS.Atlas({
    key = "one_hand_wonder",
    path = "Jokers.png",
    px = 71,
    py = 95,
})

SMODS.Joker{
    key = "one_hand_wonder",
    config = { extra = { chips = 30, chipsMod = 30 } },
    pos = { x = 8, y = 0 },
    atlas = "one_hand_wonder",
    discovered = true,
    unlocked = true,
    rarity = 2,
    cost = 5,

    calculate = function (self, card, context)
        
    end
}