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

	-- if G.PROFILES[G.SETTINGS.profile].bossRiddle ~= nil and Game:start_run() then
	-- 	print("Test")
	-- 	G.PROFILES[G.SETTINGS.profile].bossRiddle = nil
	-- end

	-- if G and G.GAME and G.GAME.blind.config.blind.key == 'bl_cstorm_the_riddler' then
	-- 	if G.PROFILES[G.SETTINGS.profile].bossRiddle == nil then
	-- 		Riddle = get_random_riddle("the_riddler")
	-- 		G.PROFILES[G.SETTINGS.profile].bossRiddle = Riddle
	-- 	end
	-- 	if User_answer == true then
	-- 		User_answer = nil
	-- 		G.PROFILES[G.SETTINGS.profile].bossRiddle = nil
	-- 	elseif User_answer == false then
	-- 		User_answer = nil
	-- 		G.GAME.current_round.hands_left = G.GAME.current_round.hands_left - 1
	-- 	end
	-- end

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
			if context.consumeable.config.center.key == "c_cstorm_hint_aries" or G.P_CENTERS.c_cstorm_aries.unlocked then
				if not G.P_CENTERS.c_cstorm_aries.discovered then
					G.PROFILES[G.SETTINGS.profile].ariesHint = true
				end
			--Taurus
			elseif context.consumeable.config.center.key == "c_cstorm_hint_taurus" or G.P_CENTERS.c_cstorm_taurus.unlocked then
				if not G.P_CENTERS.c_cstorm_taurus.discovered then
					G.PROFILES[G.SETTINGS.profile].taurusHint = true
				end
			--Gemini
			elseif context.consumeable.config.center.key == "c_cstorm_hint_gemini" or G.P_CENTERS.c_cstorm_gemini.unlocked then
				if not G.P_CENTERS.c_cstorm_gemini.discovered then
					G.PROFILES[G.SETTINGS.profile].geminiHint = true
				end
			--Cancer
			elseif context.consumeable.config.center.key == "c_cstorm_hint_cancer" or G.P_CENTERS.c_cstorm_cancer.unlocked then
				if not G.P_CENTERS.c_cstorm_cancer.discovered then
					G.PROFILES[G.SETTINGS.profile].cancerHint = true
				end
			--Leo
			elseif context.consumeable.config.center.key == "c_cstorm_hint_leo" or G.P_CENTERS.c_cstorm_leo.unlocked then
				if not G.P_CENTERS.c_cstorm_leo.discovered then
					G.PROFILES[G.SETTINGS.profile].leoHint = true
				end
			--Virgo
			elseif context.consumeable.config.center.key == "c_cstorm_hint_virgo" or G.P_CENTERS.c_cstorm_virgo.unlocked then
				if not G.P_CENTERS.c_cstorm_virgo.discovered then
					G.PROFILES[G.SETTINGS.profile].virgoHint = true
				end
			--Libra
			elseif context.consumeable.config.center.key == "c_cstorm_hint_libra" or G.P_CENTERS.c_cstorm_libra.unlocked then
				if not G.P_CENTERS.c_cstorm_libra.discovered then
					G.PROFILES[G.SETTINGS.profile].libraHint = true
				end
			--Scorpio
			elseif context.consumeable.config.center.key == "c_cstorm_hint_scorpio" or G.P_CENTERS.c_cstorm_scorpio.unlocked then
				if not G.P_CENTERS.c_cstorm_scorpio.discovered then
					G.PROFILES[G.SETTINGS.profile].scorpioHint = true
				end
			--Sagittarius
			elseif context.consumeable.config.center.key == "c_cstorm_hint_sagittarius" or G.P_CENTERS.c_cstorm_sagittarius.unlocked then
				if not G.P_CENTERS.c_cstorm_sagittarius.discovered then
					G.PROFILES[G.SETTINGS.profile].sagittariusHint = true
				end
			--Capricorn
			elseif context.consumeable.config.center.key == "c_cstorm_hint_capricorn" or G.P_CENTERS.c_cstorm_capricorn.unlocked then
				if not G.P_CENTERS.c_cstorm_capricorn.discovered then
					G.PROFILES[G.SETTINGS.profile].capricornHint = true
				end
			--Aquarius
			elseif context.consumeable.config.center.key == "c_cstorm_hint_aquarius" or G.P_CENTERS.c_cstorm_aquarius.unlocked then
				if not G.P_CENTERS.c_cstorm_aquarius.discovered then
					G.PROFILES[G.SETTINGS.profile].aquariusHint = true
				end
			--Pisces
			elseif context.consumeable.config.center.key == "c_cstorm_hint_pisces" or G.P_CENTERS.c_cstorm_pisces.unlocked then
				if not G.P_CENTERS.c_cstorm_pisces.discovered then
					G.PROFILES[G.SETTINGS.profile].piscesHint = true
				end
			end
		end
	end

	-- Scorpio
	if ((G.GAME.cstorm_firstPlanet == "c_mars" and G.GAME.cstorm_secondPlanet == "c_pluto") or (G.GAME.cstorm_firstPlanet == "c_pluto" and G.GAME.cstorm_secondPlanet == "c_mars")) and G.PROFILES[G.SETTINGS.profile].scorpioHint == true then
		G.GAME.cstorm_processing = true
		if not G.P_CENTERS.c_cstorm_scorpio.unlocked then
			unlock_card(G.P_CENTERS.c_cstorm_scorpio)
		end
		destroy_and_spawn_astros("c_cstorm_scorpio")
		if not G.P_CENTERS.c_cstorm_scorpio.discovered then
			discover_card(G.P_CENTERS.c_cstorm_scorpio)
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
		if not G.P_CENTERS.c_cstorm_aquarius.discovered then
			discover_card(G.P_CENTERS.c_cstorm_aquarius)
		end
		G.GAME.cstorm_processing = false

		G.GAME.cstorm_firstPlanet = nil
	-- Pisces
	elseif ((G.GAME.cstorm_firstPlanet == "c_jupiter" and G.GAME.cstorm_secondPlanet == "c_neptune") or (G.GAME.cstorm_firstPlanet == "c_neptune" and G.GAME.cstorm_secondPlanet == "c_jupiter")) and G.PROFILES[G.SETTINGS.profile].piscesHint == true then
		G.GAME.cstorm_processing = true
		if not G.P_CENTERS.c_cstorm_pisces.unlocked then
			unlock_card(G.P_CENTERS.c_cstorm_pisces)
		end
		destroy_and_spawn_astros("c_cstorm_pisces")
		if not G.P_CENTERS.c_cstorm_pisces.discovered then
			discover_card(G.P_CENTERS.c_cstorm_pisces)
		end
		G.GAME.cstorm_processing = false

		G.GAME.cstorm_firstPlanet = nil
	-- Aries
	elseif ((G.GAME.cstorm_firstPlanet == "c_mars" and G.GAME.cstorm_secondPlanet == "c_eris") or (G.GAME.cstorm_firstPlanet == "c_eris" and G.GAME.cstorm_secondPlanet == "c_mars")) and G.PROFILES[G.SETTINGS.profile].ariesHint == true then
		G.GAME.cstorm_processing = true
		if not G.P_CENTERS.c_cstorm_aries.unlocked then
			unlock_card(G.P_CENTERS.c_cstorm_aries)
		end
		destroy_and_spawn_astros("c_cstorm_aries")
		if not G.P_CENTERS.c_cstorm_aries.discovered then
			discover_card(G.P_CENTERS.c_cstorm_aries)
		end
		G.GAME.cstorm_processing = false

		G.GAME.cstorm_firstPlanet = nil
	-- Taurus
	elseif ((G.GAME.cstorm_firstPlanet == "c_venus" and G.GAME.cstorm_secondPlanet == "c_earth") or (G.GAME.cstorm_firstPlanet == "c_earth" and G.GAME.cstorm_secondPlanet == "c_venus")) and G.PROFILES[G.SETTINGS.profile].taurusHint == true then
		G.GAME.cstorm_processing = true
		if not G.P_CENTERS.c_cstorm_taurus.unlocked then
			unlock_card(G.P_CENTERS.c_cstorm_taurus)
		end
		destroy_and_spawn_astros("c_cstorm_taurus")
		if not G.P_CENTERS.c_cstorm_taurus.discovered then
			discover_card(G.P_CENTERS.c_cstorm_taurus)
		end
		G.GAME.cstorm_processing = false

		G.GAME.cstorm_firstPlanet = nil
	-- Cancer
	elseif ((G.GAME.cstorm_firstPlanet == "c_ceres" and G.GAME.cstorm_secondPlanet == "c_neptune") or (G.GAME.cstorm_firstPlanet == "c_neptune" and G.GAME.cstorm_secondPlanet == "c_ceres")) and G.PROFILES[G.SETTINGS.profile].cancerHint == true then
		G.GAME.cstorm_processing = true
		if not G.P_CENTERS.c_cstorm_cancer.unlocked then
			unlock_card(G.P_CENTERS.c_cstorm_cancer)
		end
		destroy_and_spawn_astros("c_cstorm_cancer")
		if not G.P_CENTERS.c_cstorm_cancer.discovered then
			discover_card(G.P_CENTERS.c_cstorm_cancer)
		end
		G.GAME.cstorm_processing = false

		G.GAME.cstorm_firstPlanet = nil
	-- Leo
	elseif ((G.GAME.cstorm_firstPlanet == "c_jupiter" and G.GAME.cstorm_secondPlanet == "c_pluto") or (G.GAME.cstorm_firstPlanet == "c_pluto" and G.GAME.cstorm_secondPlanet == "c_jupiter")) and G.PROFILES[G.SETTINGS.profile].leoHint == true then
		G.GAME.cstorm_processing = true
		if not G.P_CENTERS.c_cstorm_leo.unlocked then
			unlock_card(G.P_CENTERS.c_cstorm_leo)
		end
		destroy_and_spawn_astros("c_cstorm_leo")
		if not G.P_CENTERS.c_cstorm_leo.discovered then
			discover_card(G.P_CENTERS.c_cstorm_leo)
		end
		G.GAME.cstorm_processing = false

		G.GAME.cstorm_firstPlanet = nil
	-- Virgo
	elseif ((G.GAME.cstorm_firstPlanet == "c_mercury" and G.GAME.cstorm_secondPlanet == "c_ceres") or (G.GAME.cstorm_firstPlanet == "c_ceres" and G.GAME.cstorm_secondPlanet == "c_mercury")) and G.PROFILES[G.SETTINGS.profile].virgoHint == true then
		G.GAME.cstorm_processing = true
		if not G.P_CENTERS.c_cstorm_virgo.unlocked then
			unlock_card(G.P_CENTERS.c_cstorm_virgo)
		end
		destroy_and_spawn_astros("c_cstorm_virgo")
		if not G.P_CENTERS.c_cstorm_virgo.discovered then
			discover_card(G.P_CENTERS.c_cstorm_virgo)
		end
		G.GAME.cstorm_processing = false

		G.GAME.cstorm_firstPlanet = nil
	-- Libra
	elseif ((G.GAME.cstorm_firstPlanet == "c_venus" and G.GAME.cstorm_secondPlanet == "c_saturn") or (G.GAME.cstorm_firstPlanet == "c_saturn" and G.GAME.cstorm_secondPlanet == "c_venus")) and G.PROFILES[G.SETTINGS.profile].libraHint == true then
		G.GAME.cstorm_processing = true
		if not G.P_CENTERS.c_cstorm_libra.unlocked then
			unlock_card(G.P_CENTERS.c_cstorm_libra)
		end
		destroy_and_spawn_astros("c_cstorm_libra")
		if not G.P_CENTERS.c_cstorm_libra.discovered then
			discover_card(G.P_CENTERS.c_cstorm_libra)
		end
		G.GAME.cstorm_processing = false

		G.GAME.cstorm_firstPlanet = nil
	-- Sagittarius
	elseif ((G.GAME.cstorm_firstPlanet == "c_jupiter" and G.GAME.cstorm_secondPlanet == "c_uranus") or (G.GAME.cstorm_firstPlanet == "c_uranus" and G.GAME.cstorm_secondPlanet == "c_jupiter")) and G.PROFILES[G.SETTINGS.profile].sagittariusHint == true then
		G.GAME.cstorm_processing = true
		if not G.P_CENTERS.c_cstorm_sagittarius.unlocked then
			unlock_card(G.P_CENTERS.c_cstorm_sagittarius)
		end
		destroy_and_spawn_astros("c_cstorm_sagittarius")
		if not G.P_CENTERS.c_cstorm_sagittarius.discovered then
			discover_card(G.P_CENTERS.c_cstorm_sagittarius)
		end
		G.GAME.cstorm_processing = false

		G.GAME.cstorm_firstPlanet = nil
	-- Capricorn
	elseif ((G.GAME.cstorm_firstPlanet == "c_saturn" and G.GAME.cstorm_secondPlanet == "c_earth") or (G.GAME.cstorm_firstPlanet == "c_earth" and G.GAME.cstorm_secondPlanet == "c_saturn")) and G.PROFILES[G.SETTINGS.profile].capricornHint == true then
		G.GAME.cstorm_processing = true
		if not G.P_CENTERS.c_cstorm_capricorn.unlocked then
			unlock_card(G.P_CENTERS.c_cstorm_capricorn)
		end
		destroy_and_spawn_astros("c_cstorm_capricorn")
		if not G.P_CENTERS.c_cstorm_capricorn.discovered then
			discover_card(G.P_CENTERS.c_cstorm_capricorn)
		end
		G.GAME.cstorm_processing = false

		G.GAME.cstorm_firstPlanet = nil
	-- Gemini
	elseif ((G.GAME.cstorm_firstPlanet == "c_mercury" and G.GAME.cstorm_secondPlanet == "c_planet_x") or (G.GAME.cstorm_firstPlanet == "c_planet_x" and G.GAME.cstorm_secondPlanet == "c_mercury")) and G.PROFILES[G.SETTINGS.profile].geminiHint == true then
		G.GAME.cstorm_processing = true
		if not G.P_CENTERS.c_cstorm_gemini.unlocked then
			unlock_card(G.P_CENTERS.c_cstorm_gemini)
		end
		destroy_and_spawn_astros("c_cstorm_gemini")
		if not G.P_CENTERS.c_cstorm_gemini.discovered then
			discover_card(G.P_CENTERS.c_cstorm_gemini)
		end
		G.GAME.cstorm_processing = false

		G.GAME.cstorm_firstPlanet = nil
	end

	if context.end_of_round then
		-- Turn joker back to scorpio
		for _, v in pairs(G.I.CARD) do
			if v.c_cstorm_scorpio then
				v:set_ability("c_cstorm_scorpio")
				v.c_cstorm_scorpio = false
			end
		end
	end

	local unlocked = true
	for k, v in pairs(G.P_CENTER_POOLS.cstorm_astro) do
		if not v.unlocked then
			unlocked = false
			break
		end
	end
	if unlocked then
		for k, v in ipairs(G.P_CENTER_POOLS.cstorm_astro_hints) do
			if not v.discovered then
				discover_card(v)
			end
		end
		G.PROFILES[G.SETTINGS.profile].geminiHint = true
		G.PROFILES[G.SETTINGS.profile].ariesHint = true
		G.PROFILES[G.SETTINGS.profile].aquariusHint = true
		G.PROFILES[G.SETTINGS.profile].piscesHint = true
		G.PROFILES[G.SETTINGS.profile].taurusHint = true
		G.PROFILES[G.SETTINGS.profile].sagittariusHint = true
		G.PROFILES[G.SETTINGS.profile].virgoHint = true
		G.PROFILES[G.SETTINGS.profile].leoHint = true
		G.PROFILES[G.SETTINGS.profile].libraHint = true
		G.PROFILES[G.SETTINGS.profile].capricornHint = true
		G.PROFILES[G.SETTINGS.profile].scorpioHint = true
		G.PROFILES[G.SETTINGS.profile].cancerHint = true
	end
end
