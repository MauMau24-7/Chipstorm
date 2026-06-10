SMODS.Booster {
    key = "hint_pack",
    group_key = "k_cstorm_hint_pack",
    config = { extra = 1, choose = 1 },
    pos = { x = 0, y = 0 },
    atlas = 'booster',
    discovered = false,
    cost = 4,
    weight = 1.5,
    draw_hand = false,
    
    ease_background_colour = function(self)
        ease_colour(G.C.DYN_UI.MAIN, G.C.BLUE)
        ease_background_colour({ new_colour = G.C.BLUE, special_colour = G.C.GOLD, contrast = 3 })
    end,

    create_card = function(self, card, i)
        local hints_left = {}
        for _, center in ipairs(G.P_CENTER_POOLS["cstorm_astro_hints"]) do
            if not center.discovered then
                table.insert(hints_left, center.key)
            end
        end

        if #hints_left == 0 then return { set = "Tarot", area = G.pack_cards, skip_materialize = true, soulable = true, key = "c_fool" } end -- If opened though pool empty, create the fool (Fallback)

        local key = pseudorandom_element(hints_left, pseudoseed("astro_hint"))
        return { set = "cstorm_astro_hints", area = G.pack_cards, skip_materialize = true, soulable = true, key = key }
    end,

    loc_vars = function(self, info_queue, card)
        return { vars = { card.ability.choose, card.ability.extra } }
    end,

    in_pool = function(self, args)
        for _, center in ipairs(G.P_CENTER_POOLS["cstorm_astro_hints"]) do
            if not center.discovered then
                -- print("Found undiscovered: " .. center.key)
                return true
            end
        end
        -- print("All hints discovered, returning false")
        return false
    end
}