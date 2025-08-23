SMODS.Consumable{
    key = "split_chip",
    set = 'cstorm_tokens',
    atlas = "tokens",
    pos = { x = 4, y = 0},
    pixel_size = { w = 71, h = 71 },
    config = { max_highlighted = 1 },
    unlocked = true,
    discovered = true,
    cost = 3,

    use = function (self, card, area, copier)
        print(tostring(G.hand.highlighted[1]:get_id()))

        local rankBefore = G.hand.highlighted[1]:get_id()

        local rankAfter = rankBefore / 2

        SMODS.destroy_cards(G.hand.highlighted)

        SMODS.add_card { set = "Base", rank = math.floor(rankAfter) }
        SMODS.add_card { set = "Base", rank = math.floor(rankAfter) }

        print(tostring(rankAfter))
    end

}