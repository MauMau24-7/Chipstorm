SMODS.Tag{
    key = "raccoon",
    atlas = "tags",
    pos = { x = 0, y = 0 },
    discovered = true,
    unlocked = true,
    min_ante = 0,

    apply = function (self, tag, context)
        if #G.jokers.cards > 0 then
            local replaceJoker = pseudorandom_element(G.jokers.cards, "replaceJoker")
            SMODS.destroy_cards(replaceJoker)
            SMODS.add_card{key = "j_cstorm_washed_card"}
            tag:yep("Washed", G.C.BLUE)
            tag.triggered = true
        else
            tag:nope()
            tag.triggered = true
        end
    end
}