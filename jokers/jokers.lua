
-- SMODS.Atlas({
--     key = "sample_wee",
--     path = "j_sample_wee.png",
--     px = 71,
--     py = 95
-- })

-- SMODS.Atlas({
--     key = "sample_obelisk",
--     path = "j_sample_obelisk.png",
--     px = 71,
--     py = 95
-- })

-- SMODS.Atlas({
--     key = "sample_specifichand",
--     path = "j_sample_specifichand.png",
--     px = 71,
--     py = 95
-- })

-- SMODS.Atlas({
--     key = "sample_money",
--     path = "j_sample_money.png",
--     px = 71,
--     py = 95
-- })

-- SMODS.Atlas({
--     key = "sample_roomba",
--     path = "j_sample_roomba.png",
--     px = 71,
--     py = 95
-- })

-- SMODS.Atlas({
--     key = "sample_drunk_juggler",
--     path = "j_sample_drunk_juggler.png",
--     px = 71,
--     py = 95
-- })

-- SMODS.Atlas({
--     key = "sample_hackerman",
--     path = "j_sample_hackerman.png",
--     px = 71,
--     py = 95
-- })

-- SMODS.Atlas({
--     key = "sample_baroness",
--     path = "j_sample_baroness.png",
--     px = 71,
--     py = 95
-- })

-- SMODS.Atlas({
--     key = "sample_rarebaseballcard",
--     path = "j_sample_rarebaseballcard.png",
--     px = 71,
--     py = 95
-- })

-- SMODS.Atlas({
--     key = "sample_multieffect",
--     path = "j_sample_multieffect.png",
--     px = 71,
--     py = 95
-- })

------------------------------------------------------------------------
-- atlas

SMODS.Atlas({
    key = "three",
    path = "j_three.png",
    px = 71,
    py = 95
})

SMODS.Atlas({
    key = "miscount",
    path = "j_miscount.png",
    px = 71,
    py = 95
})

SMODS.Atlas({
    key = "juggling_jack",
    path = "j_juggling_jack.png",
    px = 71,
    py = 95
})

SMODS.Atlas({
    key = "final_push",
    path = "j_final_push.png",
    px = 71,
    py = 95
})

SMODS.Atlas({
    key = "pimp_my_deck",
    path = "j_SPACEHOLDER.png",
    px = 71,
    py = 95
})

SMODS.Atlas({
    key = "slim_starter",
    path = "j_SPACEHOLDER.png",
    px = 71,
    py = 95
})

SMODS.Atlas({
    key = "the_boulder",
    path = "j_the_boulder.png",
    px = 71,
    py = 95
})

SMODS.Atlas({
    key = "booster_bundle",
    path = "j_SPACEHOLDER.png",
    px = 71,
    py = 95
})

-- SMODS.Atlas({
--     key = "foil_factor",
--     path = "j_SPACEHOLDER.png",
--     px = 71,
--     py = 95
-- })

--------------------------------------------------------------------------------------------------------------------

-- sound

SMODS.Sound({
    key = "charge_up1",
    path = "s_charge_up1.ogg"
})

SMODS.Sound({
    key = "charge_up2",
    path = "s_charge_up2.ogg"
})

SMODS.Sound({
    key = "charge_up3",
    path = "s_charge_up3.ogg"
})

SMODS.Sound({
    key = "overcharge",
    path = "s_overcharge.ogg"
})

--------------------------------------------------------------------------------------------------------------------

-- joker

-- SMODS.Joker{
--     key = "sample_wee",                                  --name used by the joker.    
--     config = { extra = { chips = 8, chip_mod = 2 } },    --variables used for abilities and effects.
--     pos = { x = 0, y = 0 },                              --pos in spritesheet 0,0 for single sprites or the first sprite in the spritesheet.
--     rarity = 1,                                          --rarity 1=common, 2=uncommen, 3=rare, 4=legendary
--     cost = 1,                                            --cost to buy the joker in shops.
--     blueprint_compat=true,                               --does joker work with blueprint.
--     eternal_compat=true,                                 --can joker be eternal.
--     unlocked = true,                                     --is joker unlocked by default.
--     discovered = true,                                   --is joker discovered by default.    
--     effect=nil,                                          --you can specify an effect here eg. 'Mult'
--     soul_pos=nil,                                        --pos of a soul sprite.
--     atlas = 'sample_wee',                                --atlas name, single sprites are deprecated.

--     calculate = function(self,card,context)              --define calculate functions here
--         if context.individual and context.cardarea == G.play then -- if we are in card scoring phase, and we are on individual cards
--             if not context.blueprint then -- blueprint/brainstorm don't get to add chips to themselves
--                 if context.other_card:get_id() == 2 then -- played card is a 2 by rank
--                     card.ability.extra.chips = card.ability.extra.chips + card.ability.extra.chip_mod -- add configurable amount of chips to joker
                    
--                     return {                             -- shows a message under the specified card (card) when it triggers, k_upgrade_ex is a key in the localization files of Balatro
--                         extra = {focus = card, message = localize('k_upgrade_ex')},
--                         card = card,
--                         colour = G.C.CHIPS
--                     }
--                 end
--             end
--         end
--         if context.joker_main and context.cardarea == G.jokers then
--             return {                                     -- returns total chips from joker to be used in scoring, no need to show message in joker_main phase, game does it for us.
--                 chips = card.ability.extra.chips, 
--                 colour = G.C.CHIPS
--             }
--         end
--     end,

--     loc_vars = function(self, info_queue, card)          --defines variables to use in the UI. you can use #1# for example to show the chips variable
--         return { vars = { card.ability.extra.chips, card.ability.extra.chip_mod }, key = self.key }
--     end
-- }

-- SMODS.Joker{
--     key = "sample_obelisk",
--     config = { extra = { x_mult = 0.1 } },
--     pos = { x = 0, y = 0 },
--     rarity = 3,
--     cost = 6,
--     blueprint_compat = true,
--     eternal_compat = true,
--     unlocked = true,
--     discovered = true,
--     effect = nil,
--     atlas = 'sample_obelisk',
--     soul_pos = nil,

--     calculate = function(self, card, context)
--         if context.joker_main and context.cardarea == G.jokers and context.scoring_name then
--             local current_hand_times = (G.GAME.hands[context.scoring_name].played or 0) -- how many times has the player played the current type of hand. (pair, two pair. etc..)
--             local current_xmult = 1 + (current_hand_times * card.ability.extra.x_mult)
            
--             return {
--                 message = localize{type='variable',key='a_xmult',vars={current_xmult}},
--                 colour = G.C.RED,
--                 x_mult = current_xmult
--             }

--             -- you could also apply it to the joker, to do it like the sample wee, but then you'd have to reset the card and text every time the previewed hand changes.
--         end
--     end,

--     loc_vars = function(self, info_queue, card)
--         return { vars = { card.ability.extra.x_mult }, key = self.key }
--     end
-- }

-- SMODS.Joker{
--     key = "sample_specifichand",
--     config = { extra = { poker_hand = "Five of a Kind", x_mult = 5 } },
--     pos={ x = 0, y = 0 },
--     rarity = 3,
--     cost = 10,
--     blueprint_compat=true,
--     eternal_compat=true,
--     unlocked = true,
--     discovered = true,
--     effect=nil,
--     soul_pos=nil,
--     atlas = 'sample_specifichand',

--     calculate = function(self,card,context)
--         if context.joker_main and context.cardarea == G.jokers then
--             if context.scoring_name == card.ability.extra.poker_hand then
--                 return {
--                     message = localize{type='variable',key='a_xmult',vars={card.ability.x_mult}},
--                     colour = G.C.RED,
--                     x_mult = card.ability.x_mult
--                 }
--             end
--         end
--     end,

--     loc_vars = function(self, info_queue, card)
--         return { vars = { card.ability.extra.poker_hand, card.ability.extra.x_mult }, key = self.key }
--     end        
-- }

-- SMODS.Joker{
--     key = "sample_money",
--     config={ },
--     pos = { x = 0, y = 0 },
--     rarity = 1,
--     cost = 4,
--     blueprint_compat = true,
--     eternal_compat = true,
--     unlocked = true,
--     discovered = true,
--     effect = nil,
--     atlas = 'sample_money',
--     soul_pos = nil,

--     calculate = function(self, card, context)
--         if context.end_of_round and not (context.individual or context.repetition) then --and not (context.individual or context.repetition) => make sure doesn't activate on every card like gold cards.
--             ease_dollars(G.GAME.round_resets.blind_ante*2) -- ease_dollars adds or removes provided amount of money. (-5 would remove 5 for example)
--         end
--     end,
--     loc_vars = function(self, info_queue, card)
--         return { }
--     end
-- }

-- SMODS.Joker{
--     key = "sample_roomba",
--     config={ },
--     pos = { x = 0, y = 0 },
--     rarity = 2,
--     cost = 4,
--     blueprint_compat = true,
--     eternal_compat = false,
--     unlocked = true,
--     discovered = true,
--     effect = nil,
--     atlas = 'sample_roomba',
--     soul_pos = nil,

--         calculate = function(self, card, context)
--         if context.end_of_round and not (context.individual or context.repetition) then
--             local cleanable_jokers = {}

--             for i = 1, #G.jokers.cards do
--                 if G.jokers.cards[i] ~= self then -- if joker is not itself 
--                     cleanable_jokers[#cleanable_jokers+1] = G.jokers.cards[i] -- add all other jokers into a array
--                 end
--             end

--             local joker_to_clean = #cleanable_jokers > 0 and pseudorandom_element(cleanable_jokers, pseudoseed('clean')) or nil -- pick a random valid joker, or null if no valid jokers

--             if joker_to_clean then -- if we have a valid joker we can bump into
--                 shakecard(joker_to_clean) -- simulate bumping into a card
--                 if(joker_to_clean.edition) then --if joker has an edition
--                     if not joker_to_clean.edition.negative then --if joker is not negative
--                         joker_to_clean:set_edition(nil) -- clean the joker from it's edition
--                     end
--                 end
--             end
--         end
--     end,

--     loc_vars = function(self, info_queue, card)
--         return { }
--     end
-- }

-- SMODS.Joker{
--     key = "sample_drunk_juggler",
--     config = { d_size = 1 }, -- d_size  = discard size, h_size = hand size. (HOWEVER, you can't have both on 1 joker!)
--     pos = { x = 0, y = 0 },
--     rarity = 2,
--     cost = 4,
--     blueprint_compat = true,
--     eternal_compat = false,
--     unlocked = true,
--     discovered = true,
--     effect = nil,
--     atlas = 'sample_drunk_juggler',
--     soul_pos = nil,

--     calculate = function(self, card, context)
--         return nil
--     end,

--     loc_vars = function(self, info_queue, card)
--         return { vars = { card.ability.d_size, localize{type = 'name_text', key = 'tag_double', set = 'Tag'} } }
--     end
-- }

-- SMODS.Joker{
--     key = "sample_hackerman",
--     config = { repetitions = 1 },
--     pos = { x = 0, y = 0 },
--     rarity = 2,
--     cost = 4,
--     blueprint_compat = true,
--     eternal_compat = false,
--     unlocked = true,
--     discovered = true,
--     effect = nil,
--     atlas = 'sample_hackerman',
--     soul_pos = nil,

--     calculate = function(self, card, context)
--         if context.cardarea == G.play and context.repetition and (
--             context.other_card:get_id() == 6 or 
--             context.other_card:get_id() == 7 or 
--             context.other_card:get_id() == 8 or 
--             context.other_card:get_id() == 9) then
--             return {
--                 message = localize('k_again_ex'),
--                 repetitions = card.ability.repetitions,
--                 card = self
--             }
--         end
--     end,

--     loc_vars = function(self, info_queue, card)
--         return { }
--     end
-- }

-- SMODS.Joker{
--     key = "sample_baroness",
--     config = { extra = { x_mult = 1.5 } },
--     pos = { x = 0, y = 0 },
--     rarity = 3,
--     cost = 8,
--     blueprint_compat = true,
--     eternal_compat = false,
--     unlocked = true,
--     discovered = true,
--     effect = nil,
--     atlas = 'sample_baroness',
--     soul_pos = nil,

--     calculate = function(self, card, context)
--         if not context.end_of_round then
--             if context.cardarea == G.hand and context.individual and context.other_card:get_id() == 12 then
--                 if context.other_card.debuff then
--                     return {
--                         message = localize('k_debuffed'),
--                         colour = G.C.RED,
--                         card = self,
--                     }
--                 else
--                     return {
--                         x_mult = card.ability.extra.x_mult,
--                         card = self
--                     }
--                 end
--             end
--         end
--     end,

--     loc_vars = function(self, info_queue, card)
--         return { vars = { card.ability.extra.x_mult } }
--     end
-- }

-- SMODS.Joker{
--     key = "sample_rarebaseballcard",
--     config = { extra = { x_mult = 2 } },
--     pos = { x = 0, y = 0 },
--     rarity = 2,
--     cost = 8,
--     blueprint_compat = true,
--     eternal_compat = false,
--     unlocked = true,
--     discovered = true,
--     effect = nil,
--     atlas = 'sample_rarebaseballcard',
--     soul_pos = nil,

--     calculate = function(self, card, context)
--         if not (context.individual or context.repetition) and context.other_joker and context.other_joker.config.center.rarity == 3 and self ~= context.other_joker then
--             shakecard(context.other_joker)
--             return {
--                 message = localize{type='variable',key='a_xmult',vars={card.ability.extra.x_mult}},
--                 colour = G.C.RED,
--                 x_mult = card.ability.extra.x_mult
--             }
--         end
--     end,

--     loc_vars = function(self, info_queue, card)
--         return { vars = { card.ability.extra.x_mult }, key = self.key}
--     end
-- }

-- SMODS.Joker{
--     key = "sample_multieffect",
--     config = { extra = { chips = 10, mult = 10, x_mult = 2 } },
--     pos = { x = 0, y = 0 },
--     rarity = 2,
--     cost = 4,
--     blueprint_compat = true,
--     eternal_compat = false,
--     unlocked = true,
--     discovered = true,
--     effect = nil,
--     atlas = 'sample_multieffect',
--     soul_pos = nil,

--     calculate = function(self, card, context)
--         if context.individual and context.cardarea == G.play and context.other_card:get_id() == 10 then
--             return {
--                 chips = card.ability.extra.chips,
--                 mult = card.ability.extra.mult,
--                 x_mult = card.ability.extra.x_mult,
--                 card = self
--             }
--         end
--     end,

--     loc_vars = function(self, info_queue, card)
--         return { vars = { card.ability.extra.chips, card.ability.extra.mult }, key = self.key }
--     end
-- }

SMODS.Joker{
    key = "three",
    config = { extra = { chips = 33.3 } },
    pos = { x = 0, y = 0 },
    rarity = 1,
    cost = 3,
    blueprint_compat = true,
    eternal_compat = true,
    unlocked = true,
    discovered = true,
    effect = nil,
    atlas = 'three',
    soul_pos = nil,

    calculate = function(self, card, context)
        if context.individual and context.cardarea == G.play and context.other_card:get_id() == 3 then
            return {
                chips = card.ability.extra.chips
            }
        end
    end,

    loc_vars = function(self, info_queue, card)
        return { vars = { card.ability.extra.chips }, key = self.key }
    end
}

SMODS.Joker{
    key = "miscount",
    config = { extra = { min_chips = 0, max_chips = 200, rand_key = 'miscount' } },
    pos = { x = 0, y = 0 },
    rarity = 1,
    cost = 4,
    blueprint_compat = true,
    eternal_compat = true,
    unlocked = true,
    discovered = true,
    effect = nil,
    atlas = 'miscount',
    soul_pos = nil,

    calculate = function(self, card, context)
        if context.before and context.cardarea == G.jokers then
            card.ability.extra.chips = math.floor(pseudorandom(card.ability.extra.rand_key) * (card.ability.extra.max_chips - card.ability.extra.min_chips + 1)) + card.ability.extra.min_chips
        end

        if context.joker_main and context.cardarea == G.jokers then
            return {
                chips = card.ability.extra.chips
            }
        end
    end,

  loc_vars = function(self, info_queue, card)
    return { vars = { card.ability.extra.chips, card.ability.extra.min_chips, card.ability.extra.max_chips }, key  = self.key }
  end,
}

SMODS.Joker{
    key = "juggling_jack",
    config = { extra = { chips = 5 } },
    pos = { x = 0, y = 0 },
    rarity = 2,
    cost = 5,
    blueprint_compat = true,
    eternal_compat = true,
    unlocked = true,
    discovered = true,
    effect = nil,
    atlas = 'juggling_jack',
    soul_pos = nil,

    calculate = function(self, card, context)
        if context.discard then
            context.other_card.ability.perma_bonus = context.other_card.ability.perma_bonus + card.ability.extra.chips
            return {
                extra = {focus = context.other_card, message = localize('k_upgrade_ex')}
            }
        end
    end,

    loc_vars = function(self, info_queue, card)
        return { vars = { card.ability.extra.chips }, key = self.key }
    end,
}

SMODS.Joker{
    key = "final_push",
    config = { extra = { xchips = 2, hand_count_before = 0 } },
    pos = { x = 0, y = 0 },
    rarity = 3,
    cost = 8,
    blueprint_compat = true,
    eternal_compat = true,
    unlocked = true,
    discovered = true,
    effect = nil,
    atlas = 'final_push',
    soul_pos = nil,

    calculate = function(self, card, context)

        if context.before then
            card.ability.extra.hand_count_before = G.GAME.current_round.hands_left
        end

        if context.joker_main then

            if card.ability.extra.hand_count_before == 3 then
                return { message = not context.blueprint and "Charging...", sound = "cstorm_charge_up1" }
            end
            if card.ability.extra.hand_count_before == 2 then
                return { message = not context.blueprint and "Charging...", sound = "cstorm_charge_up2" }
            end
            if card.ability.extra.hand_count_before == 1 then
                return { message = not context.blueprint and "Fully Charged", sound = "cstorm_charge_up3" }
            end
            -- if card.ability.extra.hand_count_before < 4 then
            --    return { message = "Reset" }
            -- end

            if G.GAME.current_round.hands_left == 0 and context.blueprint then
                return {
                    xchips = card.ability.extra.xchips
                }
            end
            if G.GAME.current_round.hands_left == 0 and not context.blueprint then
                return {
                    message = "Overcharged!",
                    sound = "cstorm_overcharge",
                    remove_default_message = true,
                    xchips = card.ability.extra.xchips
                }
            end
        end
    end,

    loc_vars = function(self, info_queue, card)
        return { vars = { card.ability.extra.xchips }, key = self.key }
    end,

    update = function(self, card, dt)
        if G.GAME.current_round.hands_left >= 4 then
            card.children.center:set_sprite_pos({x = 0, y = 0})
        end
        if G.GAME.current_round.hands_left == 3 then
            card.children.center:set_sprite_pos({x = 1, y = 0})
        end
        if G.GAME.current_round.hands_left == 2 then
            card.children.center:set_sprite_pos({x = 0, y = 1})
        end
        if G.GAME.current_round.hands_left == 1 then
            card.children.center:set_sprite_pos({x = 1, y = 1})
        end
    end,
}

SMODS.Joker{
    key = "pimp_my_deck",
    config = { extra = { chips = 30 } },
    pos = { x = 0, y = 0 },
    rarity = 3,
    cost = 9,
    blueprint_compat = true,
    eternal_compat = true,
    unlocked = true,
    discovered = true,
    effect = nil,
    atlas = 'pimp_my_deck',
    soul_pos = nil,

    calculate = function(self, card, context)
        if not (context.joker_main and context.cardarea == G.jokers) then
          return
        end

        local cards_amount = 0

        -- Check every card: can't be a nil-edition inside
        for _, other in ipairs(context.scoring_hand) do
            if not other.edition then
                return -- no matter what error: Joker stays still
            end
            cards_amount = cards_amount + 1
        end

        -- if every card has an edition then give chips equal to that
        local bonus = card.ability.extra.chips * cards_amount
        return { chips = bonus }
    end,

    loc_vars = function(self, info_queue, card)
        return { vars = { card.ability.extra.chips }, key = self.key }
    end,
}

SMODS.Joker{
    key = "slim_starter",
    config = { extra = { chips = 100, cardMax = 30 } },
    pos = {x = 0, y = 0},
    rarity = 2,
    cost = 6,
    blueprint_compat = true,
    eternal_compat = true,
    unlocked = true,
    discovered = true,
    effect = nil,
    atlas = 'slim_starter',
    soul_pos = nil,

    calculate = function(self, card, context)

        if context.before and context.cardarea == G.jokers then
            card.ability.extra.cards_in_deck = #G.playing_cards
        end

        if context.joker_main and card.ability.extra.cards_in_deck <= card.ability.extra.cardMax then
            return{
                chips = card.ability.extra.chips
            }
        end
    end,

    loc_vars = function(self, info_queue, card)
        return { vars = { card.ability.extra.chips, card.ability.extra.cardMax }, key = self.key }
    end,
}

SMODS.Joker{
    key = "the_boulder",
    config = { extra = { chips = 50, stone_card = false } },
    pos = {x = 0, y = 0},
    rarity = 1,
    cost = 3,
    blueprint_compat = true,
    eternal_compat = true,
    unlocked = true,
    discovered = true,
    effect = nil,
    atlas = 'the_boulder',
    soul_pos = nil,

    calculate = function(self, card, context)

        if context.before and context.cardarea == G.jokers then
            card.ability.extra.stone_card = false

            for _, c in ipairs(context.scoring_hand) do
                if SMODS.has_enhancement(c, 'm_stone') then -- or SMODS.has_enhancement(c, 'cracked_stone')
                    card.ability.extra.stone_card = true
                    break
                end
            end
        end

        if context.joker_main and context.cardarea == G.jokers and card.ability.extra.stone_card == true then
            return{
                chips = card.ability.extra.chips
            }
        end
    end,

    loc_vars = function(self, info_queue, card)
        return { vars = { card.ability.extra.chips }, key = self.key }
    end,
}

SMODS.Joker{
    key = "booster_bundle",
    config = { extra = { chips = 30, chipsMod = 15 } },
    pos = { x = 0, y = 0 },
    rarity = 2,
    cost = 5,
    blueprint_compat = true,
    eternal_compat = true,
    unlocked = true,
    discovered = true,
    effect = nil,
    atlas = 'booster_bundle',
    soul_pos = nil,

    calculate = function (self, card, context)
        if 1 == 1 then
            
        end
    end
}

-- SMODS.Joker{
--     key = "foil_factor",
--     config = { extra = { chips = 15, card_amount = 0 } },
--     pos = { x = 0, y = 0 },
--     rarity = 1,
--     cost = 3,
--     blueprint_compat = true,
--     eternal_compat = true,
--     unlocked = true,
--     discovered = true,
--     effect = nil,
--     atlas = 'foil_factor',
--     soul_pos = nil,
-- 
--     calculate = function(self, card, context)
--         
--         if context.before and context.cardarea == G.jokers then
--             card.ability.extra.card_amount = 0
--         end
-- 
--         if context.individual and context.cardarea == G.jokers then
--             for _, c in ipairs(context.scoring_hand) do
--                 if context.c.edition and context.c.edition.key == "e_foil" then
--                     card.ability.extra.card_amount = card.ability.extra.card_amount + 1
--                 end
--             end
-- 
--             bonus = card.ability.extra.chips * cards_amount
--         end
-- 
-- 
--         if context.joker_main and context.cardarea == G.jokers then
-- 
--             return{
--                 chips = bonus
--             }
--         end
--     end,
-- 
--     loc_vars = function(self, info_queue, card)
--         return { vars = { card.ability.extra.chips }, key = self.key}
--     end,
-- }