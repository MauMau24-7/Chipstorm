SMODS.Joker {
    key = "cosmic_joker",
    config = { extra = { animation = false, frame = 0, timer = 0 } },
    pos = { x = 0, y = 1 },
    rarity = "cstorm_chatter",
    cost = 20,
    blueprint_compat = true,
    eternal_compat = true,
    unlocked = true,
    discovered = false,
    atlas = 'chatters',

    calculate = function(self, card, context)
        if context.individual and context.cardarea == G.play then
            if context.other_card:get_id() == 13 then
                RNGesus = pseudorandom("cosmicRNG", 1, 100)
                print(RNGesus)

                if RNGesus >= 1 and RNGesus <= 5 then
                    for _, planets in ipairs(G.P_CENTER_POOLS.Planet) do
                        delay(0.15)
                        G.E_MANAGER:add_event(Event({
                            func = function()
                                SMODS.add_card(planets)
                                return true
                            end
                        }))
                    end
                end
            end
        end

        if context.after then
            if RNGesus ~= nil and RNGesus >= 1 and RNGesus <= 5 then
                card.ability.extra.animation = true
                return {
                    extra = { focus = context.self, colour = G.C.CHIPS, message = "Planets appear" },
                }
            end
        end
    end,

    loc_vars = function(self, info_queue, card)
        return { vars = {} }
    end,

    update = function(self, card, dt)
        if card.ability.extra.animation == true then
            if card.ability.extra.frame == 0 then
                card.ability.extra.frame = 1
            end
            
            -- length of one frame
            local frame_duration = 0.0625
            local dt_1x = 0.016694971453443

            -- normalize dt to 1x game speed
            local normalized_dt = dt * (dt_1x / dt)

            -- dt is the time since last frame (comes from engine)
            card.ability.extra.timer = (card.ability.extra.timer or 0) + normalized_dt

            if card.ability.extra.timer >= frame_duration then
                card.ability.extra.frame = card.ability.extra.frame + 1
                card.ability.extra.timer = card.ability.extra.timer - frame_duration
            end

            -- over max frames results in resetting it
            if card.ability.extra.frame > 33 then
                card.ability.extra.frame = 0
            end

            card.children.center:set_sprite_pos({ x = card.ability.extra.frame, y = 1 })

            if card.children.center.sprite_pos.x == 0 then
                card.ability.extra.animation = false
            end
        end
    end,
}
