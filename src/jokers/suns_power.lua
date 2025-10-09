SMODS.Joker {
    key = "suns_power",
    config = { extra = { mult = 2, } },
    pos = { x = 0, y = 2 },
    rarity = "cstorm_chatter",
    cost = 12,
    blueprint_compat = true,
    eternal_compat = true,
    unlocked = true,
    discovered = false,
    atlas = "chatters",

    calculate = function(self, card, context)

        if context.joker_main then
            PlayedHand = nil
            PlayedHand, _, _, _, _ = G.FUNCS.get_poker_hand_info(context.scoring_hand)
            if PlayedHand ~= 'NULL' then
                local playedPokerHand = nil
                local position = 1
                while playedPokerHand == nil do
                    if G.handlist[position] == PlayedHand then
                        playedPokerHand = position
                    end
                    position = position + 1
                end
                if PlayedHand == G.GAME.current_round.cstorm_suns_power_hand then
                    return {
                        extra = { focus = context.self, colour = G.C.GREEN, message = "Played " .. G.handlist[playedPokerHand] },
                    }
                end
            end
        end

        if context.after and PlayedHand == G.GAME.current_round.cstorm_suns_power_hand then
            update_hand_text({ sound = 'button', volume = 0.7, pitch = 0.8, delay = 0.3 },
                { handname = localize(G.GAME.current_round.cstorm_suns_power_hand, 'poker_hands'), chips = G.GAME.hands
                [G.GAME.current_round.cstorm_suns_power_hand].chips, mult = G.GAME.hands
                [G.GAME.current_round.cstorm_suns_power_hand].l_mult, level = G.GAME.hands
                [G.GAME.current_round.cstorm_suns_power_hand].level })
            level_up_hand_mult(card, G.GAME.current_round.cstorm_suns_power_hand)
            update_hand_text({ sound = 'button', volume = 0.7, pitch = 1.1, delay = 0 },
                { mult = 0, chips = 0, handname = '', level = '' })
        end
    end,

    loc_vars = function(self, info_queue, card)
        local suns_power_hand = G.GAME.current_round.cstorm_suns_power_hand or "Flush"
        local mult_added = G.GAME.hands[suns_power_hand].l_mult or 2
        info_queue[#info_queue + 1] = { set = "Other", key = "chatter_name", specific_vars = { "oculusvisionss" } }
        return { vars = { suns_power_hand, mult_added }, key = self.key }
    end,

    update = function (self, card, dt)
        if G.GAME.current_round.cstorm_suns_power_hand == nil then
            G.GAME.current_round.cstorm_suns_power_hand = pseudorandom_element(G.handlist, 'cstorm_suns_power')
        end
    end
}
