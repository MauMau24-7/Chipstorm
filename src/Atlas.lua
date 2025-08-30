--Spritesheets

SMODS.Atlas({
    key = "tags",
    path = "Tags.png",
    px = 34,
    py = 34
})

SMODS.Atlas({
	key = "blinds",
	path = "blindChips.png",
	atlas_table = "ANIMATION_ATLAS",
	frames = 21,
	px = 34,
	py = 34
})

SMODS.Atlas({
    key = "jokers",
    path = "Jokers.png",
    px = 71,
    py = 95,
})

SMODS.Atlas({
    key = "jokers_SPACEHOLDER",
    path = "j_SPACEHOLDER.png",
    px = 71,
    py = 95
})

SMODS.Atlas({
    key = "tokens",
    path = "Tokens.png",
    px = 71,
    py = 95
})

SMODS.Atlas({
    key = "halfRanks",
    path = "Ranks.png",
    px = 71,
    py = 95
})

--ConsumableTypes

SMODS.ConsumableType{
    key = "cstorm_tokens",
    collection_rows = { 4, 4 },
    primary_colour = HEX ('000000'),
    secondary_colour = HEX("06540b"),
}

-- Sounds

SMODS.Sound({
    key = "charge_up1",
    path = "charge_up1.ogg"
})

SMODS.Sound({
    key = "charge_up2",
    path = "charge_up2.ogg"
})

SMODS.Sound({
    key = "charge_up3",
    path = "charge_up3.ogg"
})

SMODS.Sound({
    key = "overcharge",
    path = "overcharge.ogg"
})

SMODS.Sound({
    key = "music_tokens_boosterpack", 
    path = "music_tokens_boosterpack.ogg",
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

SMODS.Sound({
    key = "rippingPaper",
    path = "rippingPaper.ogg"
})

SMODS.Sound({
    key = "music_main_menu",
    path = "music_main_menu.ogg",
    pitch = 1,
    sync = false,

    select_music_track = function (self)
        if G.STATE == 11 then
            return 6
        end
    end
})
