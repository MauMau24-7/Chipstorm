--Credits to All in Jest
SMODS.Gradient {
    key = 'plasma',
    colours = {
        HEX('F9A2E6'), HEX('b288bc')
    },
    cycle = 5,
    interpolation = 'trig'
}

-- SMODS.JimboQuip {
--     key = 'custom_wq_1',
--     type = 'loss',
--     extra = { center = G.P_CENTERS.j_hanging_chad, particle_colours = { G.C.CSTORM.ASTRO, G.C.WHITE, G.C.BLACK } },
--     filter = function()
--         if next(SMODS.find_card('j_hanging_chad')) then
--             print("Jimbooooo")
--             return true, { rarity = 10000000000000000000000000000000000 }
--         end
--         return false
--     end,
--     loc_txt = {
--         ['en-us'] = {
--             "No Jokers = No Saves, smartass",
--         }
--     }
-- }

SMODS.current_mod.calculate = function(self, context)
	if G.GAME.cstorm_processing then return end -- to prevent recursion and with that stack overflow

	if context.using_consumeable then
		--Astro Cards
		if G.GAME.cstorm_firstPlanet == nil then
			G.GAME.cstorm_firstPlanet = "empty"
			G.GAME.cstorm_secondPlanet = "empty"
		end

		if context.consumeable.ability.set == "Planet" then
			if G.GAME.cstorm_firstPlanet == "empty" then
				G.GAME.cstorm_firstPlanet = context.consumeable.config.center.key
			elseif G.GAME.cstorm_secondPlanet == "empty" then
				G.GAME.cstorm_secondPlanet = context.consumeable.config.center.key
			else
				G.GAME.cstorm_firstPlanet = G.GAME.cstorm_secondPlanet
				G.GAME.cstorm_secondPlanet = context.consumeable.config.center.key
			end
		end

		--Astro Hints
		if context.consumeable.ability.set == "cstorm_astro_hints" then
			--Aries
			if context.consumeable.config.center.key == "c_cstorm_hint_aries" then
				G.PROFILES[G.SETTINGS.profile].ariesHint = true
			--Taurus
			elseif context.consumeable.config.center.key == "c_cstorm_hint_taurus" then
				G.PROFILES[G.SETTINGS.profile].taurusHint = true
			--Gemini
			elseif context.consumeable.config.center.key == "c_cstorm_hint_gemini" then
				G.PROFILES[G.SETTINGS.profile].geminiHint = true
			--Cancer
			elseif context.consumeable.config.center.key == "c_cstorm_hint_cancer" then
				G.PROFILES[G.SETTINGS.profile].cancerHint = true
			--Leo
			elseif context.consumeable.config.center.key == "c_cstorm_hint_leo" then
				G.PROFILES[G.SETTINGS.profile].leoHint = true
			--Virgo
			elseif context.consumeable.config.center.key == "c_cstorm_hint_virgo" then
				G.PROFILES[G.SETTINGS.profile].virgoHint = true
			--Libra
			elseif context.consumeable.config.center.key == "c_cstorm_hint_libra" then
				G.PROFILES[G.SETTINGS.profile].libraHint = true
			--Scorpio
			elseif context.consumeable.config.center.key == "c_cstorm_hint_scorpio" then
				G.PROFILES[G.SETTINGS.profile].scorpioHint = true
			--Sagittarius
			elseif context.consumeable.config.center.key == "c_cstorm_hint_sagittarius" then
				G.PROFILES[G.SETTINGS.profile].sagittariusHint = true
			--Capricorn
			elseif context.consumeable.config.center.key == "c_cstorm_hint_capricorn" then
				G.PROFILES[G.SETTINGS.profile].capricornHint = true
			--Aquarius
			elseif context.consumeable.config.center.key == "c_cstorm_hint_aquarius" then
				G.PROFILES[G.SETTINGS.profile].aquariusHint = true
			--Pisces
			elseif context.consumeable.config.center.key == "c_cstorm_hint_pisces" then
				G.PROFILES[G.SETTINGS.profile].piscesHint = true
			end
		end
	end

	-- Scorpio
	if ((G.GAME.cstorm_firstPlanet == "c_mars" and G.GAME.cstorm_secondPlanet == "c_pluto") or (G.GAME.cstorm_firstPlanet == "c_pluto" and G.GAME.cstorm_secondPlanet == "c_mars")) and G.PROFILES[G.SETTINGS.profile].scorpioHint == true then
		G.GAME.cstorm_processing = true
		if not G.P_CENTERS.c_cstorm_scorpio.unlocked then
			unlock_card(G.P_CENTERS.c_cstorm_scorpio)
			destroy_and_spawn_astros("c_cstorm_scorpio")
		end
		G.GAME.cstorm_processing = false

		G.GAME.cstorm_firstPlanet = nil
	-- Aquarius
	elseif ((G.GAME.cstorm_firstPlanet == "c_uranus" and G.GAME.cstorm_secondPlanet == "c_saturn") or (G.GAME.cstorm_firstPlanet == "c_saturn" and G.GAME.cstorm_secondPlanet == "c_uranus")) and G.PROFILES[G.SETTINGS.profile].aquariusHint == true then
		G.GAME.cstorm_processing = true
		if not G.P_CENTERS.c_cstorm_aquarius.unlocked then
			unlock_card(G.P_CENTERS.c_cstorm_aquarius)
		end
		destroy_and_spawn_astros("c_cstorm_aquarius")
		G.GAME.cstorm_processing = false

		G.GAME.cstorm_firstPlanet = nil
	-- Pisces
	elseif ((G.GAME.cstorm_firstPlanet == "c_jupiter" and G.GAME.cstorm_secondPlanet == "c_neptune") or (G.GAME.cstorm_firstPlanet == "c_neptune" and G.GAME.cstorm_secondPlanet == "c_jupiter")) and G.PROFILES[G.SETTINGS.profile].piscesHint == true then
		G.GAME.cstorm_processing = true
		if not G.P_CENTERS.c_cstorm_pisces.unlocked then
			unlock_card(G.P_CENTERS.c_cstorm_pisces)
		end
		destroy_and_spawn_astros("c_cstorm_pisces")
		G.GAME.cstorm_processing = false

		G.GAME.cstorm_firstPlanet = nil
	-- Aries
	elseif ((G.GAME.cstorm_firstPlanet == "c_mars" and G.GAME.cstorm_secondPlanet == "c_eris") or (G.GAME.cstorm_firstPlanet == "c_eris" and G.GAME.cstorm_secondPlanet == "c_mars")) and G.PROFILES[G.SETTINGS.profile].ariesHint == true then
		G.GAME.cstorm_processing = true
		if not G.P_CENTERS.c_cstorm_aries.unlocked then
			unlock_card(G.P_CENTERS.c_cstorm_aries)
		end
		destroy_and_spawn_astros("c_cstorm_aries")
		G.GAME.cstorm_processing = false

		G.GAME.cstorm_firstPlanet = nil
	-- Taurus
	elseif ((G.GAME.cstorm_firstPlanet == "c_venus" and G.GAME.cstorm_secondPlanet == "c_earth") or (G.GAME.cstorm_firstPlanet == "c_earth" and G.GAME.cstorm_secondPlanet == "c_venus")) and G.PROFILES[G.SETTINGS.profile].taurusHint == true then
		G.GAME.cstorm_processing = true
		if not G.P_CENTERS.c_cstorm_taurus.unlocked then
			unlock_card(G.P_CENTERS.c_cstorm_taurus)
		end
		destroy_and_spawn_astros("c_cstorm_taurus")
		G.GAME.cstorm_processing = false

		G.GAME.cstorm_firstPlanet = nil
	-- Cancer
	elseif ((G.GAME.cstorm_firstPlanet == "c_ceres" and G.GAME.cstorm_secondPlanet == "c_neptune") or (G.GAME.cstorm_firstPlanet == "c_neptune" and G.GAME.cstorm_secondPlanet == "c_ceres")) and G.PROFILES[G.SETTINGS.profile].cancerHint == true then
		G.GAME.cstorm_processing = true
		if not G.P_CENTERS.c_cstorm_cancer.unlocked then
			unlock_card(G.P_CENTERS.c_cstorm_cancer)
		end
		destroy_and_spawn_astros("c_cstorm_cancer")
		G.GAME.cstorm_processing = false

		G.GAME.cstorm_firstPlanet = nil
	-- Leo
	elseif ((G.GAME.cstorm_firstPlanet == "c_jupiter" and G.GAME.cstorm_secondPlanet == "c_pluto") or (G.GAME.cstorm_firstPlanet == "c_pluto" and G.GAME.cstorm_secondPlanet == "c_jupiter")) and G.PROFILES[G.SETTINGS.profile].leoHint == true then
		G.GAME.cstorm_processing = true
		if not G.P_CENTERS.c_cstorm_leo.unlocked then
			unlock_card(G.P_CENTERS.c_cstorm_leo)
		end
		destroy_and_spawn_astros("c_cstorm_leo")
		G.GAME.cstorm_processing = false

		G.GAME.cstorm_firstPlanet = nil
	-- Virgo
	elseif ((G.GAME.cstorm_firstPlanet == "c_mercury" and G.GAME.cstorm_secondPlanet == "c_ceres") or (G.GAME.cstorm_firstPlanet == "c_ceres" and G.GAME.cstorm_secondPlanet == "c_mercury")) and G.PROFILES[G.SETTINGS.profile].virgoHint == true then
		G.GAME.cstorm_processing = true
		if not G.P_CENTERS.c_cstorm_virgo.unlocked then
			unlock_card(G.P_CENTERS.c_cstorm_virgo)
		end
		destroy_and_spawn_astros("c_cstorm_virgo")
		G.GAME.cstorm_processing = false

		G.GAME.cstorm_firstPlanet = nil
	-- Libra
	elseif ((G.GAME.cstorm_firstPlanet == "c_venus" and G.GAME.cstorm_secondPlanet == "c_saturn") or (G.GAME.cstorm_firstPlanet == "c_saturn" and G.GAME.cstorm_secondPlanet == "c_venus")) and G.PROFILES[G.SETTINGS.profile].libraHint == true then
		G.GAME.cstorm_processing = true
		if not G.P_CENTERS.c_cstorm_libra.unlocked then
			unlock_card(G.P_CENTERS.c_cstorm_libra)
		end
		destroy_and_spawn_astros("c_cstorm_libra")
		G.GAME.cstorm_processing = false

		G.GAME.cstorm_firstPlanet = nil
	-- Sagittarius
	elseif ((G.GAME.cstorm_firstPlanet == "c_jupiter" and G.GAME.cstorm_secondPlanet == "c_uranus") or (G.GAME.cstorm_firstPlanet == "c_uranus" and G.GAME.cstorm_secondPlanet == "c_jupiter")) and G.PROFILES[G.SETTINGS.profile].sagittariusHint == true then
		G.GAME.cstorm_processing = true
		if not G.P_CENTERS.c_cstorm_sagittarius.unlocked then
			unlock_card(G.P_CENTERS.c_cstorm_sagittarius)
		end
		destroy_and_spawn_astros("c_cstorm_sagittarius")
		G.GAME.cstorm_processing = false

		G.GAME.cstorm_firstPlanet = nil
	-- Capricorn
	elseif ((G.GAME.cstorm_firstPlanet == "c_saturn" and G.GAME.cstorm_secondPlanet == "c_earth") or (G.GAME.cstorm_firstPlanet == "c_earth" and G.GAME.cstorm_secondPlanet == "c_saturn")) and G.PROFILES[G.SETTINGS.profile].capricornHint == true then
		G.GAME.cstorm_processing = true
		if not G.P_CENTERS.c_cstorm_capricorn.unlocked then
			unlock_card(G.P_CENTERS.c_cstorm_capricorn)
		end
		destroy_and_spawn_astros("c_cstorm_capricorn")
		G.GAME.cstorm_processing = false

		G.GAME.cstorm_firstPlanet = nil
	-- Gemini
	elseif ((G.GAME.cstorm_firstPlanet == "c_mercury" and G.GAME.cstorm_secondPlanet == "c_planet_x") or (G.GAME.cstorm_firstPlanet == "c_planet_x" and G.GAME.cstorm_secondPlanet == "c_mercury")) and G.PROFILES[G.SETTINGS.profile].geminiHint == true then
		G.GAME.cstorm_processing = true
		if not G.P_CENTERS.c_cstorm_gemini.unlocked then
			unlock_card(G.P_CENTERS.c_cstorm_gemini)
		end
		destroy_and_spawn_astros("c_cstorm_gemini")
		G.GAME.cstorm_processing = false

		G.GAME.cstorm_firstPlanet = nil
	end

	if context.end_of_round then
		-- Turn joker back to scorpio
		for k, v in pairs(G.I.CARD) do
			if v.c_cstorm_scorpio then
				v:set_ability("c_cstorm_scorpio")
				v.c_cstorm_scorpio = false
			end
		end
	end
end
