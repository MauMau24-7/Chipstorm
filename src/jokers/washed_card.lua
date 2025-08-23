G.FUNCS.custom_button = function(e)
    local this_card = e.config.ref_table.this_card
    if this_card.highlighted then
        local button_id = e.config.ref_table.id
        SMODS.calculate_context {
            card = this_card,
            custom_button_pressed = true,
            button_id = button_id,
        }
    end
end


SMODS.Joker {
    key = "washed_card",
    config = { extra = { chips = 100, mult = 5, chipsJoker = false, multJoker = false },
        custom_buttons = {
            {
                id = "chips_joker",
                text = "Chips",
                text_colour = G.C.WHITE,
                colour = G.C.CHIPS,
            },
            {
                id = "mult_joker",
                text = "Mult",
                text_colour = G.C.WHITE,
                colour = G.C.MULT,
            }
        }
    },
    pos = { x = 0, y = 1 },
    rarity = 2,
    cost = 5,
    blueprint_compat = true,
    eternal_compat = true,
    unlocked = true,
    discovered = true,
    atlas = "jokers",

    calculate = function(self, card, context)
        if context.joker_main then
            if card.ability.extra.chipsJoker == true then
                return {
                    chips = card.ability.extra.chips
                }
            end
            if card.ability.extra.multJoker == true then
                return {
                    mult = card.ability.extra.mult
                }
            end
        end

        if context.custom_button_pressed and context.button_id == "chips_joker" and context.card == card then
            card.ability.extra.chipsJoker = true
            card.ability.extra.multJoker = false
            card.children.center:set_sprite_pos({ x = 2, y = 1 })
            if not context.blueprint_card then
                return {
                    message = "Chips"
                }
            end
        end

        if context.custom_button_pressed and context.button_id == "mult_joker" and context.card == card then
            card.ability.extra.multJoker = true
            card.ability.extra.chipsJoker = false
            card.children.center:set_sprite_pos({ x = 1, y = 1 })
            if not context.blueprint_card then
                return {
                    message = "Mult"
                }
            end
        end
    end,

    in_pool = function(self, args)
        return false
    end,

    loc_vars = function(self, info_queue, card)
        return { vars = { card.ability.extra.chips, card.ability.extra.mult }, key = self.key }
    end
}
