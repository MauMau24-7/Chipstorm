SMODS.Consumable {
    key = "sagittarius",
    config = { extra = { mult = 15, chips = 150, currentBonus = "" } },
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
                card.ability.extra.currentBonus = "+" .. card.ability.extra.mult .. " Mult"
            elseif sagittariusPos == 2 then
                SMODS.add_card { key = 'c_cstorm_sagittarius', area = G.consumeables }
                card.ability.extra.currentBonus = "+" .. card.ability.extra.chips .. " Chips"
            elseif sagittariusPos == 3 then
                SMODS.add_card { key = 'c_cstorm_sagittarius', area = Chipstorm.astro_card_area }
                card.ability.extra.currentBonus = "+" .. card.ability.extra.mult .. " Mult & " .. "+" .. card.ability.extra.chips .. " Chips"
            end
            SMODS.destroy_cards(card)
        end

        if context.joker_main then
            if card.area == G.jokers then
                return { mult = card.ability.extra.mult }
            elseif card.area == G.consumeables then
                return { chips = card.ability.extra.chips }
            elseif card.area == Chipstorm.astro_card_area then
                return { mult = card.ability.extra.mult, chips = card.ability.extra.chips }
            end
        end
    end,

    in_pool = function(self, args)
        return false
    end,

    loc_vars = function (self, info_queue, card)
        info_queue[#info_queue + 1] = { set = "Other", key = "astro_planets", specific_vars = { "Jupiter & Uranus" } }
        return { vars = { card.ability.extra.mult, card.ability.extra.chips, card.ability.extra.currentBonus }, key = self.key }
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