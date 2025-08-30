SMODS.Tag{
    key = "raccoon",
    atlas = "tags",
    pos = { x = 0, y = 0 },
    discovered = true,
    unlocked = true,
    min_ante = 0,

    apply = function (self, tag, context)
        if #G.jokers.cards > 0 then
            local try = 0
            local replaceJoker = pseudorandom_element(G.jokers.cards, "replaceJoker")

            while replaceJoker.config.center_key == "j_cstorm_washed_card" do
                replaceJoker = pseudorandom_element(G.jokers.cards, "replaceJoker")
                try = try + 1
                if try >= 10 then
                    break
                end
            end
            replaceJoker:set_ability("j_cstorm_washed_card")
            tag.triggered = true
            SMODS.calculate_effect({message = "Washed", colour = G.C.BLUE}, replaceJoker)
            tag:yep("", G.C.CLEAR)
        else
            tag:nope()
            tag.triggered = true
        end
    end
}