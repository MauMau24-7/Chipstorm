function level_up_hand_mult(card, hand, instant, amount)
    if (G.GAME.hands[hand].level and G.GAME.hands[hand].mult) then
        amount = amount or 1
        G.GAME.hands[hand].level = math.max(0, G.GAME.hands[hand].level + amount)

        G.GAME.hands[hand].mult = math.max(1, G.GAME.hands[hand].mult + (G.GAME.hands[hand].l_mult * amount * 2))
        if not instant then 
            G.E_MANAGER:add_event(Event({trigger = 'after', delay = 0.2, func = function()
                play_sound('tarot1')
                if card then card:juice_up(0.8, 0.5) end
                G.TAROT_INTERRUPT_PULSE = true
                return true end }))
            update_hand_text({delay = 0}, {mult = G.GAME.hands[hand].mult, StatusText = true})
            G.E_MANAGER:add_event(Event({trigger = 'after', delay = 0.9, func = function()
                play_sound('tarot1')
                if card then card:juice_up(0.8, 0.5) end
                G.TAROT_INTERRUPT_PULSE = nil
                return true end }))
            update_hand_text({sound = 'button', volume = 0.7, pitch = 0.9, delay = 0}, {level=G.GAME.hands[hand].level})
            delay(1.3)
        end
        G.E_MANAGER:add_event(Event({
            trigger = 'immediate',
            func = (function() check_for_unlock{type = 'upgrade_hand', hand = hand, level = G.GAME.hands[hand].level} return true end)
        }))
    end
end

SMODS.Joker {
    key = "suns_power",
    config = { extra = { mult = 2, } },
    pos = { x = 0, y = 0 },
    rarity = "cstorm_chatter",
    cost = 12,
    blueprint_compat = true,
    eternal_compat = true,
    unlocked = true,
    discovered = false,
    atlas = "jokers_SPACEHOLDER",

    calculate = function (self, card, context)
        if G.GAME.current_round.cstorm_suns_power_hand == nil then
            G.GAME.current_round.cstorm_suns_power_hand = pseudorandom_element(G.handlist, 'cstorm_suns_power')
        end

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
            update_hand_text({sound = 'button', volume = 0.7, pitch = 0.8, delay = 0.3}, {handname=localize(G.GAME.current_round.cstorm_suns_power_hand, 'poker_hands'),chips = G.GAME.hands[G.GAME.current_round.cstorm_suns_power_hand].chips, mult = G.GAME.hands[G.GAME.current_round.cstorm_suns_power_hand].l_mult, level=G.GAME.hands[G.GAME.current_round.cstorm_suns_power_hand].level})
            level_up_hand_mult(card, G.GAME.current_round.cstorm_suns_power_hand)
            update_hand_text({sound = 'button', volume = 0.7, pitch = 1.1, delay = 0}, {mult = 0, chips = 0, handname = '', level = ''})
        end
    end,

    loc_vars = function (self, info_queue, card)
        local suns_power_hand = G.GAME.current_round.cstorm_suns_power_hand or "Flush"
        local mult_added = G.GAME.hands[suns_power_hand].l_mult or 2
        info_queue[#info_queue + 1] = { set = "Other", key = "chatter_name", specific_vars = { "suns_powervisionss" } }
        return { vars = { suns_power_hand, mult_added }, key = self.key }
    end
}
