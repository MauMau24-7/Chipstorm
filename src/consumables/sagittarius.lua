SMODS.Consumable {
    key = "sagittarius",
    config = { mult = 15, chips = 150, currentBonus = "+15 Mult & +150 Chips" },
    set = "cstorm_astro",
    atlas = "consumables",
    discovered = false,
    unlocked = false,
    pos = { x = 8, y = 0 },

    calculate = function(self, card, context)
        if context.blind then
            local sagittariusPos = pseudorandom("sagittariusPos", 1, 3)

            if sagittariusPos == 1 then
                SMODS.add_card { key = 'c_cstorm_sagittarius', area = G.jokers }
                self.config.currentBonus = "+" .. self.config.mult .. " Mult"
            elseif sagittariusPos == 2 then
                SMODS.add_card { key = 'c_cstorm_sagittarius', area = G.consumeables }
                self.config.currentBonus = "+" .. self.config.chips .. " Chips"
            elseif sagittariusPos == 3 then
                SMODS.add_card { key = 'c_cstorm_sagittarius', area = Chipstorm.astro_card_area }
                self.config.currentBonus = "+" .. self.config.mult .. " Mult & " .. "+" .. self.config.chips .. " Chips"
            end
            SMODS.destroy_cards(card)
        end

        if context.joker_main then
            if card.area == G.jokers then
                return { mult = self.config.mult }
            elseif card.area == G.consumeables then
                return { chips = self.config.chips }
            elseif card.area == Chipstorm.astro_card_area then
                return { mult = self.config.mult, chips = self.config.chips }
            end
        end
    end,

    in_pool = function(self, args)
        return false
    end,

    loc_vars = function (self, info_queue, card)
        info_queue[#info_queue + 1] = { set = "Other", key = "astro_planets", specific_vars = { "Jupiter & Uranus" } }
        return { vars = { self.config.mult, self.config.chips, self.config.currentBonus }, key = self.key }
    end,

    locked_loc_vars = function (self, info_queue, card)
        if G.PROFILES[G.SETTINGS.profile].sagittariusHint == true then
            return { key = self.key .. "_hint" }
        end
        return { key = self.key }
    end,

    set_ability = function (self, card, initial, delay_sprites)
        card.states.click.can = false
    end
}