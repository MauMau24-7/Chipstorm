--Spritesheets

SMODS.Atlas({
	key = "tags",
	path = "Tags.png",
	px = 34,
	py = 34
})

SMODS.Atlas({
	key = "blinds",
	path = "Blinds.png",
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

-- SMODS.Atlas({
-- 	key = "halfRanks",
-- 	path = "Ranks.png",
-- 	px = 71,
-- 	py = 95
-- })

SMODS.Atlas({
	key = "rock",
	path = "rock.png",
	px = 71,
	py = 95
})

SMODS.Atlas({
	key = "chatters",
	path = "Chatters.png",
	px = 71,
	py = 95
})

SMODS.Atlas({
	key = "animation",
	path = "animation.png",
	px = 71,
	py = 95
})

SMODS.Atlas {
	key = "cstorm_splash_screen",
	px = 362,
	py = 48,
	path = 'cstorm_splash_sprite.png'
}

SMODS.Atlas({
	key = "consumables",
	path = "Consumables.png",
	px = 71,
	py = 95
})

SMODS.UndiscoveredSprite({
	key = "cstorm_astro",
	atlas = "consumables",
	pos = { x = 5, y = 1 },
	no_overlay = false
})

SMODS.UndiscoveredSprite({
	key = "cstorm_astro_hints",
	atlas = "consumables",
	pos = { x = 5, y = 1 },
	no_overlay = true
})

SMODS.Atlas({
	key = "booster",
	path = "Booster.png",
	px = 71,
	py = 95
})

--ConsumableTypes

SMODS.ConsumableType {
	key = "cstorm_tokens",
	collection_rows = { 4, 4 },
	primary_colour = HEX('000000'),
	secondary_colour = HEX("06540b"),
}

SMODS.ConsumableType {
	key = "cstorm_astro",
	collection_rows = { 1, 2, 3, },
	primary_colour = HEX('FF0000'),
	secondary_colour = HEX("230049"),
}

SMODS.ConsumableType {
	key = "cstorm_astro_hints",
	collection_rows = { 1, 2, 3, },
	primary_colour = HEX('FF0000'),
	secondary_colour = HEX("230049"),
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
	key = "music6",
	path = "main_menu_theme.ogg",
	pitch = 1,
	sync = false,

	select_music_track = function(self)
		if G.STAGE == G.STAGES.MAIN_MENU then
			return 6
		end
	end
})

SMODS.Sound({
	key = "monochrome1",
	path = "monochrome1.ogg"
})

SMODS.Sound({
	key = "neon1",
	path = "neon1.ogg"
})

SMODS.Sound({
	key = "static1",
	path = "static1.ogg"
})

SMODS.Sound({
	key = "mirror1",
	path = "mirror1.ogg"
})

SMODS.Sound({
	key = "fractal1",
	path = "fractal1.ogg"
})

SMODS.Sound({
	key = "glitch1",
	path = "glitch1.ogg"
})

SMODS.Sound({
	key = "curse1",
	path = "curse1.ogg"
})

SMODS.Sound({
	key = "chaotic1",
	path = "chaotic1.ogg"
})

SMODS.Sound({
	key = "void1",
	path = "void1.ogg"
})

SMODS.Sound({
	key = "forgotten1",
	path = "forgotten1.ogg"
})

-- Gradients

--Credits to All in Jest
SMODS.Gradient {
    key = 'plasma',
    colours = {
        HEX('F9A2E6'), HEX('b288bc')
    },
    cycle = 5,
    interpolation = 'trig'
}

SMODS.Gradient {
	key = "staticGradient",
	colours = { G.C.BLACK, G.C.CSTORM.GREY },
	cycle = 5,
}

SMODS.Gradient {
	key = "mirrorGradient",
	colours = { HEX("E5E5E5"), HEX("A9A9A9"), HEX("EEEEEE") },
	cycle = 7,
}

SMODS.Gradient {
	key = "fractalGradient",
	colours = { HEX("EB57DC"), HEX("00FBFF"), HEX("FF5900") },
	cycle = 5,
}

SMODS.Gradient {
	key = "glitchGradient",
	colours = { HEX("EEEEEE"), HEX("F9FB00"), HEX("02FEFF"), HEX("01FF00"), HEX("FD00FB"), HEX("FB0102"), HEX("0301FC"), HEX("000000") },
	cycle = 2,
}
