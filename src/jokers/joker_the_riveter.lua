local card_is_suit_ref = Card.is_suit
function Card:is_suit(suit, bypass_debuff, flush_calc)

    -- Code before

    local ret = card_is_suit_ref(self, suit, bypass_debuff, flush_calc)

    -- Code after
    if self.base.suit and suit == "Spades"  ---- suit = function argument (e.g. "Spades"), suit == "Spades" only overrides checks for Spades,
    and next(SMODS.find_card("j_cstorm_joker_the_riveter")) and not SMODS.has_no_suit(self) then

        return true
    end

    return ret
end

SMODS.Joker {
    key = "joker_the_riveter",
    pos = { x = 0, y = 3 },
    rarity = 4,
    cost = 10,
    blueprint_compat = false,
    eternal_compat = true,
    unlocked = true,
    discovered = false,
    atlas = "chatters",

    -- This Joker literally doesn't need anything like calculate because of the hook xD

    loc_vars = function (self, info_queue, card)
        info_queue[#info_queue + 1] = { set = "Other", key = "chatter_name", specific_vars = { "PuddleInk" } }
    end
}
