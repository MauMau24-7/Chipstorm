SMODS.Atlas({
    key = "death",
    path = "death.png",
    px = 71,
    py = 95
})

SMODS.DrawStep{
    key = "death_shader",
    order = 25,
    func = function (card, layer)
        if card.ability.cstorm_death and card.facing == 'front' then
            card.children.center:draw_shader("cstorm_smokeDeath", nil, card.ARGS.send_to_shader)
        end
    end
}

SMODS.Sticker {
    key = "death",
    config = { extra = { roundsTillDeath = 3, roundsWithSticker = 0, roundsLeft = 3 } },
    badge_colour = HEX '000000',
    pos = { x = 0, y = 0 },
    sets = { Joker = true },
    default_compat = true,
    rate = 1.0,
    atlas = "death",
    unlocked = true,
    discovered = true,
    should_apply = function (self, card, center, area, bypass_reroll)
        --if in challenge, then apply to all jokers/consumables
        return G.GAME.challenge == "c_cstorm_death_challenge" and not (card.ability.set == 'Default' or card.ability.set == 'Enhanced')
    end,

    calculate = function(self, card, context)
        card.ability.cstorm_death.extra.roundsLeft = card.ability.cstorm_death.extra.roundsTillDeath -
        card.ability.cstorm_death.extra.roundsWithSticker
        if context.end_of_round and not context.repetition and not context.individual then
            card.ability.cstorm_death.extra.roundsWithSticker = card.ability.cstorm_death.extra.roundsWithSticker + 1
            if card.ability.cstorm_death.extra.roundsWithSticker >= card.ability.cstorm_death.extra.roundsTillDeath then
                G.STATE = G.STATES.GAME_OVER
                G.STATE_COMPLETE = false
            end
        end
    end,

    loc_vars = function(self, info_queue, card)
        return { vars = { card.ability.cstorm_death.extra.roundsTillDeath, card.ability.cstorm_death.extra.roundsLeft }, key =
        self.key }
    end
}