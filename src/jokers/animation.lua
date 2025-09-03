SMODS.Atlas({
    key = "animation",
    path = "animation.png",
    px = 71,
    py = 95
})

SMODS.Joker{
    key = "animation",
    pos = { x = 0, y = 0},
    atlas = "animation",
    unlocked = true,
    no_collection = true,

    update =function (self, card, dt)
        card.children.center:set_sprite_pos({ x = math.floor(G.TIMERS.REAL * 10) % 50, y = 0 })
    end,

    in_pool = function(self, args)
        return false
    end
}