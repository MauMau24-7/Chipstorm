SMODS.Joker {
    key = "human_captcha",
    config = { extra = { repetitions = 0, animation = false, inRow = 0, active = false } },
    pos = { x = 0, y = 0 },
    rarity = "cstorm_chatter",
    cost = 15,
    blueprint_compat = true,
    eternal_compat = true,
    unlocked = true,
    discovered = false,
    atlas = "chatters",

    calculate = function(self, card, context)
        if context.repetition and context.cardarea == G.play and
            G.GAME.current_round.cstorm_captcha_card then
            if context.other_card:get_id() == G.GAME.current_round.cstorm_captcha_card.id and
                context.other_card:is_suit(G.GAME.current_round.cstorm_captcha_card.suit) then
                    if card.ability.extra.active == false then
                        card.ability.extra.inRow = card.ability.extra.inRow + 1
                        card.ability.extra.active = true
                    end

                    -- Retriggers = Square Root of right hands played after each other (per hand)
                    card.ability.extra.repetitions = math.floor(math.sqrt(card.ability.extra.inRow))

                    card.ability.extra.animation = true
                    return {
                        repetitions = card.ability.extra.repetitions
                    }
            else
                card.ability.extra.inRow = 0
                card.ability.extra.repetitions = 0
            end
        end

        if context.after and card.ability.extra.active == true then
            card.ability.extra.active = false
        end

        if context.ante_end or G.GAME.current_round.cstorm_captcha_card == nil then
            G.GAME.current_round.cstorm_captcha_card = { rank = 'Ace', suit = 'Spades' }
            local valid_captcha_cards = {}
            for _, playing_card in ipairs(G.playing_cards) do
                if not SMODS.has_no_suit(playing_card) and not SMODS.has_no_rank(playing_card) then
                    valid_captcha_cards[#valid_captcha_cards + 1] = playing_card
                end
            end
            local captcha_card = pseudorandom_element(valid_captcha_cards, 'cstorm_captcha' .. G.GAME.round_resets.ante)
            if captcha_card then
                G.GAME.current_round.cstorm_captcha_card.rank = captcha_card.base.value
                G.GAME.current_round.cstorm_captcha_card.suit = captcha_card.base.suit
                G.GAME.current_round.cstorm_captcha_card.id = captcha_card.base.id
            end
        end
    end,

    loc_vars = function(self, info_queue, card)
        local captcha_card = G.GAME.current_round.cstorm_captcha_card or { rank = 'Ace', suit = 'Spades' }
        info_queue[#info_queue + 1] = { set = "Other", key = "chatter_name", specific_vars = { "human person" } }
        info_queue[#info_queue + 1] = { set = "Other", key = "captcha_retriggers_formula" }
        return { vars = { card.ability.extra.repetitions, localize(captcha_card.rank, 'ranks'), localize(captcha_card.suit, 'suits_plural'), colours = { G.C.SUITS[captcha_card.suit] } } }
    end,

    update = function(self, card, dt)
        if card.ability.extra.animation == true then
            card.children.center:set_sprite_pos({ x = math.floor(G.TIMERS.REAL * 7) % 15, y = 0 })

            if card.children.center.sprite_pos.x == 14 then
                card.ability.extra.animation = false
            end
        end
    end,
}
