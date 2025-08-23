local ref_blind_load = Blind.load
function Blind:load(blindTable)
    local ret = ref_blind_load(self, blindTable)
    local obj = self.config.blind
    if self.in_blind and obj.cstorm_blind_load and type(obj.cstorm_blind_load) == 'function' then
        obj:cstorm_blind_load(blindTable)
    end
    return ret
end

local ref_blind_save = Blind.save
function Blind:save()
    local ret = ref_blind_save(self)
    local obj = self.config.blind
    if obj.cstorm_blind_save and type(obj.cstorm_blind_save) == 'function' then
        obj:cstorm_blind_save(ret)
    end
    return ret
end

local function queue_toggle_event()
    G.GAME.blind.toggle_event_queued = true
    G.E_MANAGER:add_event(Event({
        trigger = 'after',
        delay = (0.1 + math.random() * 12), -- 8-11 seconds, true randomness
        blocking =false,
        func = function()
            -- Prevent toggling during scoring
            if G.GAME.blind.scoring_in_progress then
                -- Re-queue the event to try again after a short delay
                G.GAME.blind.toggle_event_queued = nil
                G.E_MANAGER:add_event(Event({
                    trigger = 'after',
                    delay = 1, -- Try again in 1 second
                    func = function()
                        if not G.GAME.blind.scoring_in_progress then
                            queue_toggle_event()
                        end
                        return true
                    end
                }))
                return true
            end

            G.GAME.blind.toggle_event_queued = nil
            if not G.GAME.blind or G.GAME.blind.disabled or not G.GAME.blind.config or not next(G.GAME.blind.config.blind) or G.STATE ~= G.STATES.SELECTING_HAND then
                return true
            end
            local obj = G.GAME.blind.config.blind
            if obj.toggle_light_state and type(obj.toggle_light_state) == 'function' then
                obj:toggle_light_state()
            end
            return true
        end
    }))
end

SMODS.Blind({
    key = 'green_light_red_light',
    pos = { x = 0, y = 0 },
    -- atlas = "blind",
    dollars = 5,
    mult = 2,
    boss = { min = 1, max = 10 },
    boss_colour = HEX('39FF14'),

    set_blind = function(self)
        self.boss_colour = HEX('39FF14')
        G.GAME.blind.red_light = false
        queue_toggle_event()
        ease_background_colour_blind(G.STATES.SELECTING_HAND)
    end,

    toggle_light_state = function(self)
        G.GAME.blind.red_light = not G.GAME.blind.red_light
        if G.GAME.blind.red_light then
            self.boss_colour = HEX('FF0000')
        else
            self.boss_colour = HEX('39FF14')
        end
        ease_background_colour_blind(G.STATES.SELECTING_HAND)
        if not G.GAME.blind.toggle_event_queued then
            queue_toggle_event()
        end
    end,

    press_play = function(self)
        G.GAME.blind.scoring_in_progress = true
        if G.GAME.blind.red_light then
            G.STATE = G.STATES.GAME_OVER
            G.STATE_COMPLETE = false
            ease_background_colour(HEX('FF0000'))
            return false
        end
        return true
    end,

    calculate = function(self, card, context)
        if context and context.final_scoring_step then
            G.GAME.blind.scoring_in_progress = nil
            if G.GAME.blind.red_light then
                ease_background_colour(HEX('FF0000'))
            else
                ease_background_colour(HEX('39FF14'))
            end
        end
    end,

    drawn_to_hand = function(self)
        if not G.GAME.blind.toggle_event_queued then
            queue_toggle_event()
        end
    end,

    disable = function(self)
        G.GAME.blind.red_light = false
        self.boss_colour = HEX('39FF14')
        G.GAME.blind.toggle_event_queued = nil
    end,

    defeat = function(self)
        G.GAME.blind.red_light = false
        self.boss_colour = HEX('39FF14')
        G.GAME.blind.toggle_event_queued = nil
    end,

    cstorm_blind_save = function(self, saveTable)
        saveTable.red_light = G.GAME.blind.red_light
        return saveTable
    end,

    cstorm_blind_load = function(self, blindTable)
        G.GAME.blind.red_light = blindTable.red_light
        if G.GAME.blind.red_light then
            self.boss_colour = HEX('FF0000')
        else
            self.boss_colour = HEX('39FF14')
        end
        ease_background_colour_blind(G.STATES.SELECTING_HAND)
        queue_toggle_event()
    end
})
