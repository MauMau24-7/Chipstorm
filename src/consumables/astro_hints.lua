SMODS.Consumable {
    key = "hint_aries",
    set = "cstorm_astro_hints",
    config = { activated = false },
    atlas = "consumables",
    pos = { x = 4, y = 1 },

    can_use = function(self, card)
        return true
    end,

    use = function(self, card, area, copier)
        self.config.activated = true
    end,

    in_pool = function(self, args)
        if self.config.activated == true then
            return false
        end
        return true
    end,

    --[[update = function (self, card, dt)
        card.children.center:set_sprite_pos({ x = 3 + math.floor(G.TIMERS.REAL * 2) % 2, y = 1 })
    end,]]
}

SMODS.Consumable {
    key = "hint_taurus",
    set = "cstorm_astro_hints",
    atlas = "consumables",
    config = { activated = false },
    pos = { x = 4, y = 1 },

    can_use = function(self, card)
        return true
    end,

    use = function(self, card, area, copier)
        self.config.activated = true
    end,

    in_pool = function(self, args)
        if self.config.activated == true then
            return false
        end
        return true
    end,

    --[[update = function (self, card, dt)
        card.children.center:set_sprite_pos({ x = 3 + math.floor(G.TIMERS.REAL * 2) % 2, y = 1 })
    end,]]
}

SMODS.Consumable {
    key = "hint_gemini",
    set = "cstorm_astro_hints",
    atlas = "consumables",
    config = { activated = false },
    pos = { x = 4, y = 1 },

    can_use = function(self, card)
        return true
    end,

    use = function(self, card, area, copier)
        self.config.activated = true
    end,

    in_pool = function(self, args)
        if self.config.activated == true then
            return false
        end
        return true
    end,

    --[[update = function (self, card, dt)
        card.children.center:set_sprite_pos({ x = 3 + math.floor(G.TIMERS.REAL * 2) % 2, y = 1 })
    end,]]
}

SMODS.Consumable {
    key = "hint_cancer",
    set = "cstorm_astro_hints",
    atlas = "consumables",
    config = { activated = false },
    pos = { x = 4, y = 1 },

    can_use = function(self, card)
        return true
    end,

    use = function(self, card, area, copier)
        self.config.activated = true
    end,

    in_pool = function(self, args)
        if self.config.activated == true then
            return false
        end
        return true
    end,

    --[[update = function (self, card, dt)
        card.children.center:set_sprite_pos({ x = 3 + math.floor(G.TIMERS.REAL * 2) % 2, y = 1 })
    end,]]
}

SMODS.Consumable {
    key = "hint_leo",
    set = "cstorm_astro_hints",
    atlas = "consumables",
    config = { activated = false },
    pos = { x = 4, y = 1 },

    can_use = function(self, card)
        return true
    end,

    use = function(self, card, area, copier)
        self.config.activated = true
    end,

    in_pool = function(self, args)
        if self.config.activated == true then
            return false
        end
        return true
    end,

    --[[update = function (self, card, dt)
        card.children.center:set_sprite_pos({ x = 3 + math.floor(G.TIMERS.REAL * 2) % 2, y = 1 })
    end,]]
}

SMODS.Consumable {
    key = "hint_virgo",
    set = "cstorm_astro_hints",
    atlas = "consumables",
    config = { activated = false },
    pos = { x = 4, y = 1 },

    can_use = function(self, card)
        return true
    end,

    use = function(self, card, area, copier)
        self.config.activated = true
    end,

    in_pool = function(self, args)
        if self.config.activated == true then
            return false
        end
        return true
    end,

    --[[update = function (self, card, dt)
        card.children.center:set_sprite_pos({ x = 3 + math.floor(G.TIMERS.REAL * 2) % 2, y = 1 })
    end,]]
}

SMODS.Consumable {
    key = "hint_libra",
    set = "cstorm_astro_hints",
    atlas = "consumables",
    config = { activated = false },
    pos = { x = 4, y = 1 },

    can_use = function(self, card)
        return true
    end,

    use = function(self, card, area, copier)
        self.config.activated = true
    end,

    in_pool = function(self, args)
        if self.config.activated == true then
            return false
        end
        return true
    end,

    --[[update = function (self, card, dt)
        card.children.center:set_sprite_pos({ x = 3 + math.floor(G.TIMERS.REAL * 2) % 2, y = 1 })
    end,]]
}

SMODS.Consumable {
    key = "hint_scorpio",
    set = "cstorm_astro_hints",
    atlas = "consumables",
    config = { activated = false },
    pos = { x = 4, y = 1 },

    can_use = function(self, card)
        return true
    end,

    use = function(self, card, area, copier)
        self.config.activated = true
    end,

    in_pool = function(self, args)
        if self.config.activated == true then
            return false
        end
        return true
    end,

    --[[update = function (self, card, dt)
        card.children.center:set_sprite_pos({ x = 3 + math.floor(G.TIMERS.REAL * 2) % 2, y = 1 })
    end,]]
}

SMODS.Consumable {
    key = "hint_sagittarius",
    set = "cstorm_astro_hints",
    atlas = "consumables",
    config = { activated = false },
    pos = { x = 4, y = 1 },

    can_use = function(self, card)
        return true
    end,

    use = function(self, card, area, copier)
        self.config.activated = true
    end,

    in_pool = function(self, args)
        if self.config.activated == true then
            return false
        end
        return true
    end,

    --[[update = function (self, card, dt)
        card.children.center:set_sprite_pos({ x = 3 + math.floor(G.TIMERS.REAL * 2) % 2, y = 1 })
    end,]]
}

SMODS.Consumable {
    key = "hint_capricorn",
    set = "cstorm_astro_hints",
    atlas = "consumables",
    config = { activated = false },
    pos = { x = 4, y = 1 },

    can_use = function(self, card)
        return true
    end,

    use = function(self, card, area, copier)
        self.config.activated = true
    end,

    in_pool = function(self, args)
        if self.config.activated == true then
            return false
        end
        return true
    end,

    --[[update = function (self, card, dt)
        card.children.center:set_sprite_pos({ x = 3 + math.floor(G.TIMERS.REAL * 2) % 2, y = 1 })
    end,]]
}

SMODS.Consumable {
    key = "hint_aquarius",
    set = "cstorm_astro_hints",
    atlas = "consumables",
    config = { activated = false },
    pos = { x = 4, y = 1 },

    can_use = function(self, card)
        return true
    end,

    use = function(self, card, area, copier)
        self.config.activated = true
    end,

    in_pool = function(self, args)
        if self.config.activated == true then
            return false
        end
        return true
    end,

    --[[update = function (self, card, dt)
        card.children.center:set_sprite_pos({ x = 3 + math.floor(G.TIMERS.REAL * 2) % 2, y = 1 })
    end,]]
}

SMODS.Consumable {
    key = "hint_pisces",
    set = "cstorm_astro_hints",
    atlas = "consumables",
    config = { activated = false },
    pos = { x = 4, y = 1 },

    can_use = function(self, card)
        return true
    end,

    use = function(self, card, area, copier)
        self.config.activated = true
    end,

    in_pool = function(self, args)
        if self.config.activated == true then
            return false
        end
        return true
    end,

    --[[update = function (self, card, dt)
        card.children.center:set_sprite_pos({ x = 3 + math.floor(G.TIMERS.REAL * 2) % 2, y = 1 })
    end,]]
}
