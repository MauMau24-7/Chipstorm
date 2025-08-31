SMODS.Joker {
    key = "second_thoughts",
    config = { extra = { chips = 0, text = "", poker_hand_cards = '' } },
    pos = { x = 0, y = 2 },
    rarity = 4,
    cost = 20,
    blueprint_compat = true,
    eternal_compat = true,
    unlocked = true,
    discovered = true,
    atlas = 'jokers',
    soul_pos = {
        x = 2, y = 2,
        draw = function(card, scale_mod, rotate_mod)
            card.children.floating_sprite:draw_shader('dissolve', nil, nil, nil,
                card.children.center, 5 * scale_mod, 10 * rotate_mod)
        end
    },

    calculate = function(self, card, context)
        if context.press_play and not context.hook then
            card.ability.extra.text, _, _, card.ability.extra.poker_hand_cards = G.FUNCS.get_poker_hand_info(G.hand.cards)
            card.ability.extra.chips = G.GAME.hands[card.ability.extra.text].chips * G.GAME.hands[card.ability.extra.text].mult / 2
        end

        if context.joker_main then
            local playedHand = nil
            playedHand, _, _, _, _ = G.FUNCS.get_poker_hand_info(context.scoring_hand)
            if playedHand ~= 'NULL' then
                local strongestHand = nil
                local playedPokerHand = nil
                local position = 1
                while strongestHand == nil or playedPokerHand == nil do
                    if G.handlist[position] == card.ability.extra.text then
                        strongestHand = position
                    end
                    if G.handlist[position] == playedHand then
                        playedPokerHand = position
                    end
                    position = position + 1
                end
                card.ability.extra.chips = G.GAME.hands[G.handlist[strongestHand]].chips * G.GAME.hands[G.handlist[strongestHand]].mult / 2
                if not context.blueprint_card then
                    if playedPokerHand > strongestHand then
                        return {
                            extra = { focus = context.self, colour = G.C.RED, message = "for " .. G.handlist[strongestHand] },
                            chips = card.ability.extra.chips
                        }
                    else
                        return {
                            extra = { focus = context.self, colour = G.C.BLACK, message = "Played best hand"}
                        }
                    end
                elseif context.blueprint_card then
                    if playedPokerHand > strongestHand then
                        return {
                            extra = { focus = context.self, colour = G.C.RED, message = "What Second Thoughts said..."},
                            chips = card.ability.extra.chips
                        }
                    end
                end
            end
        end

        if context.after then
            local highlighted = {}

            for _, card in ipairs(card.ability.extra.poker_hand_cards) do
                G.E_MANAGER:add_event(Event({
                    func = function()
                        G.hand:add_to_highlighted(card)
                        card:juice_up()
                        return true
                    end
                }))
                table.insert(highlighted, card)
                delay(0.5)
                if #highlighted > 2 then
                    local old = table.remove(highlighted, 1)
                    G.E_MANAGER:add_event(Event({
                    func = function()
                        G.hand:remove_from_highlighted(old)
                        return true
                    end
                }))
                end
            end
            for _, card in ipairs(highlighted) do
                delay(0.5)
                G.E_MANAGER:add_event(Event({
                    func = function()
                        G.hand:remove_from_highlighted(card)
                        return true
                    end
                }))
            end
            -- for _, card in ipairs(card.ability.extra.poker_hand_cards) do
            -- end 
            -- for _, card in ipairs(card.ability.extra.poker_hand_cards) do
            --     G.hand:add_to_highlighted(card)
            --     G.hand:remove_from_highlighted(card)
            -- end

            -- for _, card in ipairs(card.ability.extra.poker_hand_cards) do
            --     G.E_MANAGER:add_event(Event({
            --         func = function()
            --             card:juice_up(0.2, 0.2)
            --             return true
            --         end
            --     }))
            -- end
        end

        --How do I get the cards for the poker hand that `G.FUNCS.get_poker_hand_info(G.hand.cards)` detected?

        -- I wasted 2 hours of my life on this just to find out it exists as a function already TwT
        -- if not self.deck then
        --     local suits = { "hearts", "diamonds", "clubs", "spades" }
        --     local ranks = { "two", "three", "four", "five", "six", "seven", "eight", "nine", "ten", "jack", "queen", "king", "ace" }
        --     self.deck = {}
        --     for _, s in ipairs(suits) do
        --         self.deck[s] = {}
        --         for _, r in ipairs(ranks) do
        --             self.deck[s][r] = 0
        --         end
        --     end
        -- end

        -- local id_to_rank = {
        --     [2] = "two",
        --     [3] = "three",
        --     [4] = "four",
        --     [5] = "five",
        --     [6] = "six",
        --     [7] = "seven",
        --     [8] = "eight",
        --     [9] = "nine",
        --     [10] = "ten",
        --     [11] = "jack",
        --     [12] = "queen",
        --     [13] = "king",
        --     [14] = "ace"
        -- }

        -- local handRankings = {
        --     ["High Card"]       = 1,
        --     ["Pair"]            = 2,
        --     ["Two Pair"]        = 3,
        --     ["Three of a Kind"] = 4,
        --     ["Straight"]        = 5,
        --     ["Flush"]           = 6,
        --     ["Full House"]      = 7,
        --     ["Four of a Kind"]  = 8,
        --     ["Straight Flush"]  = 9,
        --     ["Royal Flush"]     = 10,
        --     ["Five of a Kind"]  = 11,
        --     ["Flush House"]     = 12,
        --     ["Flush Five"]      = 13,
        -- }
        
        -- if context.joker_main then
        --     if not context.blueprint_card then
        --         if handRankings[self.pokerHand] > handRankings[context.scoring_name] then
        --             return {
        --                 extra = { focus = context.self, colour = G.C.RED, message = "for " .. tostring(self.pokerHand)},
        --                 chips = card.ability.extra.chips
        --             }
        --         else
        --             return {
        --                 extra = { focus = context.self, colour = G.C.BLACK, message = "Played best hand"}
        --             }
        --         end
        --     elseif context.blueprint_card then
        --         return {
        --             extra = { focus = context.self, colour = G.C.RED, message = "What Second Thoughts said..."},
        --             chips = card.ability.extra.chips
        --         }
        --     end
        -- end
        
        -- if context.press_play then
        --     -- Reset deck
        --     for suit, ranks_table in pairs(self.deck) do
        --         for rank, _ in pairs(ranks_table) do
        --             ranks_table[rank] = 0
        --         end
        --     end

        --     -- Get Cards
        --     local counts = {}      -- rank -> count
        --     local suitCounts = {}  -- suit -> count
        --     local cardsInHand = {}

        --     for _, c in ipairs(G.hand.cards) do
        --         local rank = id_to_rank[c:get_id()]
        --         local suit = c.base.suit:lower()
        --         if rank then
        --             self.deck[suit][rank] = (self.deck[suit][rank] or 0) + 1
        --             counts[rank] = (counts[rank] or 0) + 1
        --             suitCounts[suit] = (suitCounts[suit] or 0) + 1
        --             table.insert(cardsInHand, {rank = c:get_id(), suit = suit})
        --         end
        --     end

        --     -- Check
        --     local isFlush = false
        --     for suit, c in pairs(suitCounts) do
        --         if c >= 5 then isFlush = true end
        --     end

        --     -- Sort ranks
        --     table.sort(cardsInHand, function(a, b) return a.rank < b.rank end)

        --     local function isStraight(cards)
        --         local streak = 1
        --         for i = 2, #cards do
        --             if cards[i].rank == cards[i-1].rank + 1 then
        --                 streak = streak + 1
        --                 if streak >= 5 then return true end
        --             elseif cards[i].rank ~= cards[i-1].rank then
        --                 streak = 1
        --             end
        --         end
        --         return false
        --     end

        --     local hasStraight = isStraight(cardsInHand)

        --     -- Combos
        --     local pair, trips, quads, five_of_kind = 0,0,0, 0
        --     for _, cnt in pairs(counts) do
        --         if cnt == 5 then five_of_kind = five_of_kind + 1 end
        --         if cnt == 4 then quads = quads + 1 end
        --         if cnt == 3 then trips = trips + 1 end
        --         if cnt == 2 then pair = pair + 1 end
        --     end

        --     local totalAces = 0
        --     for suit, ranks_table in pairs(self.deck) do
        --         totalAces = totalAces + (ranks_table["ace"] or 0)
        --     end

        --     -- Check strongest handRanking
        --     if isFlush and five_of_kind > 0 then
        --         self.pokerHand = "Flush Five"
        --         card.ability.extra.chips = G.GAME.hands[self.pokerHand].chips * G.GAME.hands[self.pokerHand].mult / 2
        --         print(tostring(self.pokerHand))
        --     elseif isFlush and pair > 0 and trips > 0 then
        --         self.pokerHand = "Flush House"
        --         card.ability.extra.chips = G.GAME.hands[self.pokerHand].chips * G.GAME.hands[self.pokerHand].mult / 2
        --         print(tostring(self.pokerHand))
        --     elseif five_of_kind > 0 then
        --         self.pokerHand = "Five of a Kind"
        --         card.ability.extra.chips = G.GAME.hands[self.pokerHand].chips * G.GAME.hands[self.pokerHand].mult / 2
        --         print(tostring(self.pokerHand))
        --     elseif isFlush and hasStraight and totalAces > 1 then
        --         self.pokerHand = "Royal Flush"
        --         card.ability.extra.chips = G.GAME.hands[self.pokerHand].chips * G.GAME.hands[self.pokerHand].mult / 2
        --         print(tostring(self.pokerHand))
        --     elseif isFlush and hasStraight then
        --         self.pokerHand = "Straight Flush"
        --         card.ability.extra.chips = G.GAME.hands[self.pokerHand].chips * G.GAME.hands[self.pokerHand].mult / 2
        --         print(tostring(self.pokerHand))
        --     elseif quads > 0 then
        --         self.pokerHand = "Four of a Kind"
        --         card.ability.extra.chips = G.GAME.hands[self.pokerHand].chips * G.GAME.hands[self.pokerHand].mult / 2
        --         print(tostring(self.pokerHand))
        --     elseif trips > 0 and pair > 0 then
        --         self.pokerHand = "Full House"
        --         card.ability.extra.chips = G.GAME.hands[self.pokerHand].chips * G.GAME.hands[self.pokerHand].mult / 2
        --         print(tostring(self.pokerHand))
        --     elseif isFlush then
        --         self.pokerHand = "Flush"
        --         card.ability.extra.chips = G.GAME.hands[self.pokerHand].chips * G.GAME.hands[self.pokerHand].mult / 2
        --         print(tostring(self.pokerHand))
        --     elseif hasStraight then
        --         self.pokerHand = "Straight"
        --         card.ability.extra.chips = G.GAME.hands[self.pokerHand].chips * G.GAME.hands[self.pokerHand].mult / 2
        --         print(tostring(self.pokerHand))
        --     elseif trips > 0 then
        --         self.pokerHand = "Three of a Kind"
        --         card.ability.extra.chips = G.GAME.hands[self.pokerHand].chips * G.GAME.hands[self.pokerHand].mult / 2
        --         print(tostring(self.pokerHand))
        --     elseif pair >= 2 then
        --         self.pokerHand = "Two Pair"
        --         card.ability.extra.chips = G.GAME.hands[self.pokerHand].chips * G.GAME.hands[self.pokerHand].mult / 2
        --         print(tostring(self.pokerHand))
        --     elseif pair == 1 then
        --         self.pokerHand = "Pair"
        --         card.ability.extra.chips = G.GAME.hands[self.pokerHand].chips * G.GAME.hands[self.pokerHand].mult / 2
        --         print(tostring(self.pokerHand))
        --     else
        --         self.pokerHand = "High Card"
        --         card.ability.extra.chips = G.GAME.hands[self.pokerHand].chips * G.GAME.hands[self.pokerHand].mult / 2
        --         print(tostring(self.pokerHand))
        --     end
        -- end
    end,

    loc_vars = function(self, info_queue, card)
        info_queue[#info_queue+1] = {set = "Other", key = "idea_credits"}
        return { vars = { card.ability.extra.chips }, key = self.key }
    end,

    update =function (self, card, dt)
        card.children.center:set_sprite_pos({ x = math.floor(G.TIMERS.REAL * 2) % 2, y = 2 })
    end,
}
