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
	end

	-- Scorpio
	if (G.GAME.cstorm_firstPlanet == "c_mars" and G.GAME.cstorm_secondPlanet == "c_pluto") or (G.GAME.cstorm_firstPlanet == "c_pluto" and G.GAME.cstorm_secondPlanet == "c_mars") then
		G.GAME.cstorm_processing = true
		destroy_and_spawn_astros("c_cstorm_scorpio")
		G.GAME.cstorm_processing = false

		G.GAME.cstorm_firstPlanet = nil
	-- Aquarius
	elseif (G.GAME.cstorm_firstPlanet == "c_uranus" and G.GAME.cstorm_secondPlanet == "c_saturn") or (G.GAME.cstorm_firstPlanet == "c_saturn" and G.GAME.cstorm_secondPlanet == "c_uranus") then
		G.GAME.cstorm_processing = true
		destroy_and_spawn_astros("c_cstorm_aquarius")
		G.GAME.cstorm_processing = false

		G.GAME.cstorm_firstPlanet = nil
	-- Pisces
	elseif (G.GAME.cstorm_firstPlanet == "c_jupiter" and G.GAME.cstorm_secondPlanet == "c_neptune") or (G.GAME.cstorm_firstPlanet == "c_neptune" and G.GAME.cstorm_secondPlanet == "c_jupiter") then
		G.GAME.cstorm_processing = true
		destroy_and_spawn_astros("c_cstorm_pisces")
		G.GAME.cstorm_processing = false

		G.GAME.cstorm_firstPlanet = nil
	-- Aries
	elseif (G.GAME.cstorm_firstPlanet == "c_mars" and G.GAME.cstorm_secondPlanet == "c_eris") or (G.GAME.cstorm_firstPlanet == "c_eris" and G.GAME.cstorm_secondPlanet == "c_mars") then
		G.GAME.cstorm_processing = true
		destroy_and_spawn_astros("c_cstorm_aries")
		G.GAME.cstorm_processing = false

		G.GAME.cstorm_firstPlanet = nil
	-- Taurus
	elseif (G.GAME.cstorm_firstPlanet == "c_venus" and G.GAME.cstorm_secondPlanet == "c_earth") or (G.GAME.cstorm_firstPlanet == "c_earth" and G.GAME.cstorm_secondPlanet == "c_venus") then
		G.GAME.cstorm_processing = true
		destroy_and_spawn_astros("c_cstorm_taurus")
		G.GAME.cstorm_processing = false

		G.GAME.cstorm_firstPlanet = nil
	-- Cancer
	elseif (G.GAME.cstorm_firstPlanet == "c_ceres" and G.GAME.cstorm_secondPlanet == "c_neptune") or (G.GAME.cstorm_firstPlanet == "c_neptune" and G.GAME.cstorm_secondPlanet == "c_ceres") then
		G.GAME.cstorm_processing = true
		destroy_and_spawn_astros("c_cstorm_cancer")
		G.GAME.cstorm_processing = false

		G.GAME.cstorm_firstPlanet = nil
	-- Leo
	elseif (G.GAME.cstorm_firstPlanet == "c_jupiter" and G.GAME.cstorm_secondPlanet == "c_pluto") or (G.GAME.cstorm_firstPlanet == "c_pluto" and G.GAME.cstorm_secondPlanet == "c_jupiter") then
		G.GAME.cstorm_processing = true
		destroy_and_spawn_astros("c_cstorm_leo")
		G.GAME.cstorm_processing = false

		G.GAME.cstorm_firstPlanet = nil
	-- Virgo
	elseif (G.GAME.cstorm_firstPlanet == "c_mercury" and G.GAME.cstorm_secondPlanet == "c_ceres") or (G.GAME.cstorm_firstPlanet == "c_ceres" and G.GAME.cstorm_secondPlanet == "c_mercury") then
		G.GAME.cstorm_processing = true
		destroy_and_spawn_astros("c_cstorm_virgo")
		G.GAME.cstorm_processing = false

		G.GAME.cstorm_firstPlanet = nil
	-- Libra
	elseif (G.GAME.cstorm_firstPlanet == "c_venus" and G.GAME.cstorm_secondPlanet == "c_saturn") or (G.GAME.cstorm_firstPlanet == "c_saturn" and G.GAME.cstorm_secondPlanet == "c_venus") then
		G.GAME.cstorm_processing = true
		destroy_and_spawn_astros("c_cstorm_libra")
		G.GAME.cstorm_processing = false

		G.GAME.cstorm_firstPlanet = nil
	-- Sagittarius
	elseif (G.GAME.cstorm_firstPlanet == "c_jupiter" and G.GAME.cstorm_secondPlanet == "c_uranus") or (G.GAME.cstorm_firstPlanet == "c_uranus" and G.GAME.cstorm_secondPlanet == "c_jupiter") then
		G.GAME.cstorm_processing = true
		destroy_and_spawn_astros("c_cstorm_sagittarius")
		G.GAME.cstorm_processing = false

		G.GAME.cstorm_firstPlanet = nil
	-- Capricorn
	elseif (G.GAME.cstorm_firstPlanet == "c_saturn" and G.GAME.cstorm_secondPlanet == "c_earth") or (G.GAME.cstorm_firstPlanet == "c_earth" and G.GAME.cstorm_secondPlanet == "c_saturn") then
		G.GAME.cstorm_processing = true
		destroy_and_spawn_astros("c_cstorm_capricorn")
		G.GAME.cstorm_processing = false

		G.GAME.cstorm_firstPlanet = nil
	-- Gemini
	elseif (G.GAME.cstorm_firstPlanet == "c_mercury" and G.GAME.cstorm_secondPlanet == "c_planet_x") or (G.GAME.cstorm_firstPlanet == "c_planet_x" and G.GAME.cstorm_secondPlanet == "c_mercury") then
		G.GAME.cstorm_processing = true
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
