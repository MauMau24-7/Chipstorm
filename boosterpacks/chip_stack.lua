SMODS.Atlas({
    key = "chip_stack",
    path = "j_SPACEHOLDER.png",
    px = 71,
    py = 95
})

SMODS.Sound({
    key = "music_Tokens_boosterpack", 
    path = "music_Tokens_boosterpack.ogg",
    pitch = 1,
    volume = 0.6,
    select_music_track = function()
        if G.STATE == G.STATES.SMODS_BOOSTER_OPENED then
            if G.pack_cards
                and G.pack_cards.cards
                and G.pack_cards.cards[1]
                and G.pack_cards.cards[1].config
                and G.pack_cards.cards[1].config.center
                and G.pack_cards.cards[1].config.center.mod
                and G.pack_cards.cards[1].config.center.mod.id 
                and G.pack_cards.cards[1].config.center.mod.id == "Chipstorm" then
		        return true 
            end
        end
	end,
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
    
    -- ease_background_colour = function(self)
	-- 	ease_colour(G.C.DYN_UI.MAIN, G.C.SET.Code)
	-- 	ease_background_colour({ special_colour = G.C.BLACK, contrast = 2 })
    -- end,

    create_card = function(self, card, i)
        return {set = "cstorm_Tokens", area = G.pack_cards, skip_materialize = true, soulable = true, key_append = "cstorm"}
    end,

    loc_vars = function(self, info_queue, card)
        return { vars = { card.ability.choose, card.ability.extra } }
    end,

}