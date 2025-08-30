SMODS.Atlas({
    key = "chip_stack",
    path = "j_SPACEHOLDER.png",
    px = 71,
    py = 95
})

SMODS.Booster {
    key = "chip_stack",
    group_key = "k_chip_stack",
    config = { extra = 2, choose = 1 },
    pos = { x = 0, y = 0 },
    atlas = 'chip_stack',
    discovered = true,
    cost = 4,
    weight = 1,
    draw_hand = false,
    select_card = "consumeables",
    
    ease_background_colour = function(self)
		ease_colour(G.C.DYN_UI.MAIN, G.C.BLUE)
		ease_background_colour({ new_colour = G.C.BLUE, special_colour = G.C.GOLD, contrast = 3 })
	end,

    create_card = function(self, card, i)
        return {set = "cstorm_tokens", area = G.pack_cards, skip_materialize = true, soulable = true, key_append = "cstorm"}
    end,

    loc_vars = function(self, info_queue, card)
        return { vars = { card.ability.choose, card.ability.extra } }
    end,

}