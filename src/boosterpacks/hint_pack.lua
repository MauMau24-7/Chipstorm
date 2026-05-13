SMODS.Booster {
    key = "hint_pack",
    group_key = "k_hint_pack",
    config = { extra = 1, choose = 1 },
    pos = { x = 0, y = 0 },
    atlas = 'booster',
    discovered = false,
    cost = 4,
    weight = 11,
    draw_hand = false,
    
    ease_background_colour = function(self)
		ease_colour(G.C.DYN_UI.MAIN, G.C.BLUE)
		ease_background_colour({ new_colour = G.C.BLUE, special_colour = G.C.GOLD, contrast = 3 })
	end,

    create_card = function(self, card, i)
        return {set = "cstorm_astro_hints", area = G.pack_cards, skip_materialize = true, soulable = true, key_append = "cstorm"}
    end,

    loc_vars = function(self, info_queue, card)
        return { vars = { card.ability.choose, card.ability.extra } }
    end,

    in_pool = function (self, args)
        local consumablesLeft = 0
        for _, card in ipairs(get_current_pool("cstorm_astro_hints")) do
            if card ~= "UNAVAILABLE" and card ~= "j_joker" then
                consumablesLeft = consumablesLeft + 1
            end
        end

        if consumablesLeft == 0 then
            return false
        end

        return true
    end
}