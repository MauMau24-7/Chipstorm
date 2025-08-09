SMODS.Atlas({
    key = "focus_strike",
    path = "j_focus_strike.png",
    px = 71,
    py = 95
})

SMODS.Consumable {
    key = 'focus_strike',
    set = 'Tarot',
    loc_txt = {
        name = 'Focus Strike',
        text = {
            'Next hand gains {C:chips}+500{} chips',
            'and can only play {C:attention}1{} card',
            'Returns to normal after scoring'
        }
    },
    config = {
        extra = {
            bonus_chips = 500
        }
    },
    pos = { x = 0, y = 0 },
    cost = 3,
    atlas = 'focus_strike',
    
    loc_vars = function(self, info_queue, card)
        return { vars = { self.config.extra.bonus_chips } }
    end,
    
    can_use = function(self, card)
        return true
    end,
    
    use = function(self, card, area, copier)
        local original_limit = G.GAME.starting_params.play_limit

        G.GAME.focus_strike_pending = {
            bonus_chips = card.ability.extra.bonus_chips,
            applied = false,
            original_play_limit = original_limit 
        }

        local change_needed = 1 - original_limit
        SMODS.change_play_limit(change_needed)

    end,

    in_pool = function()
        return true
    end
}

-- Hook into when cards are played to apply the play limit restriction
local orig_play_cards = G.FUNCS.play_cards_from_highlighted
G.FUNCS.play_cards_from_highlighted = function(e)
    -- Apply focus strike before playing the hand
    if G.GAME.focus_strike_pending and not G.GAME.focus_strike_pending.applied then
        G.GAME.focus_strike_pending.applied = true
        G.GAME.focus_strike_pending.call_count = 0
    end
    
    -- Call the original function
    return orig_play_cards(e)
end

-- Alternative: Hook into mod_chips directly
local orig_mod_chips = mod_chips
function mod_chips(chips)
    local final_chips = orig_mod_chips(chips)
    
    -- Add focus strike bonus if active
    if G.GAME.focus_strike_pending and G.GAME.focus_strike_pending.applied then
        G.GAME.focus_strike_pending.call_count = G.GAME.focus_strike_pending.call_count + 1
        
        if G.GAME.focus_strike_pending.call_count == 2 then
            print("Focus Strike: Adding " .. G.GAME.focus_strike_pending.bonus_chips .. " to chips (call #" .. G.GAME.focus_strike_pending.call_count .. ")")
            final_chips = final_chips + G.GAME.focus_strike_pending.bonus_chips
        else
            print("Focus Strike: Skipping call #" .. G.GAME.focus_strike_pending.call_count)
        end
    end
    
    return final_chips
end

local orig_evaluate_round = G.FUNCS.evaluate_round
G.FUNCS.evaluate_round = function()

    if G.GAME.focus_strike_pending and G.GAME.focus_strike_pending.applied then
        local current_limit = 1  
        local original_limit = G.GAME.focus_strike_pending.original_play_limit
        local restore_change = original_limit - current_limit
        SMODS.change_play_limit(restore_change)
        print("Focus Strike: Restored limit from", current_limit, "to", original_limit, "by changing", restore_change)
        G.GAME.focus_strike_pending = nil
        
        if G.hand and G.hand.cards and G.hand.cards[1] then
            card_eval_status_text(G.hand.cards[1], 'extra', nil, nil, nil, {
                message = "Hand limit restored to " .. original_limit .. "!",
                colour = G.C.FILTER
            })
        end
    end
    return orig_evaluate_round()
end