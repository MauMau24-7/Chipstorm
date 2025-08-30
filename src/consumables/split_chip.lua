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
        local rankBefore = G.hand.highlighted[1]:get_id()
        local rankAce = false

        print(rankBefore)

        -- Handling Aces, Kings, Queens, Jacks
        if rankBefore == 14 or ( rankBefore >= 11 and rankBefore <= 13) then
            rankBefore = 10
        end

        local rankAfter = rankBefore / 2

        if math.floor(rankAfter) == 1 then
            rankAce = true
        end

        print(rankAfter)

        SMODS.destroy_cards(G.hand.highlighted)
        if rankAce == false then
            SMODS.add_card { set = "Base", rank = math.floor(rankAfter) }
            SMODS.add_card { set = "Base", rank = math.floor(rankAfter) }
        else
            SMODS.add_card { set = "Base", rank = "Ace" }
            SMODS.add_card { set = "Base", rank = "Ace" }
        end
    end,

    loc_vars = function (self, info_queue, card)
        return { vars = { self.config.max_highlighted }, key = self.key}
    end

}