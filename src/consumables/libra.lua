SMODS.Consumable {
    key = "libra",
    config = { multiplier = 2 },
    set = "cstorm_astro",
    atlas = "consumables",
    discovered = false,
    unlocked = false,
    pos = { x = 6, y = 0 },

    calculate = function(self, card, context)
        if context.joker_main then
            local libraDecision = pseudorandom("libraDecision", 1, 2)

            --xChips
            if libraDecision == 1 then
                return { xchips = self.config.multiplier }
            
            --xMult
            elseif libraDecision == 2 then
                return { xmult = self.config.multiplier }
            end
        end
    end,

    in_pool = function(self, args)
        return false
    end,

    loc_vars = function (self, info_queue, card)
        info_queue[#info_queue + 1] = { set = "Other", key = "astro_planets", specific_vars = { "Venus & Saturn" } }
        return { vars = { self.config.multiplier }, key = self.key }
    end,

    locked_loc_vars = function (self, info_queue, card)
        if G.PROFILES[G.SETTINGS.profile].libraHint == true then
            return { key = self.key .. "_hint" }
        end
        return { key = self.key }
    end,

    set_ability = function (self, card, initial, delay_sprites)
        card.states.click.can = false
    end
}