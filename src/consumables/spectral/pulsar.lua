-- -- CREDITS TO theonegoofali (Not needed anymore)
-- local calcindiveffectref = SMODS.calculate_individual_effect
-- SMODS.calculate_individual_effect = function(effect, scored_card, key, amount, from_edition)

-- 	if key == 'chips' and scored_card.ability.pulsaractive then
-- 		amount = amount * 1.5
-- 		scored_card.ability.pulsaractive = nil
-- 		scored_card.ability.extra.chips = amount
-- 		scored_card.ability.extra.t_chips = amount
-- 		scored_card.ability.extra = amount
-- 		local activated = nil
-- 		if activated == nil then
-- 			print("OLOLOLOOLOLOLOLOLLO")
-- 			activated = true
-- 		end
-- 	end

-- 	print(scored_card)

-- 	local ret = calcindiveffectref(effect, scored_card, key, amount, from_edition)

-- 	if ret then return ret end
-- end


SMODS.Consumable {
	key = "pulsar",
	set = "Spectral",
	config = { max_highlighted = 1, halfDouble = 1.5, fullDouble = 2.5, odds = 10 },
	atlas = "consumables",
	discovered = false,
	unlocked = true,
	pos = { x = 0, y = 2 },

	can_use = function(self, card)
		if G.jokers.highlighted and (#G.jokers.highlighted == 1) and G.jokers.highlighted[1] and type(G.jokers.highlighted[1].ability.extra) == "table" and G.jokers.highlighted[1].ability.extra.chips ~= nil then
			return true
		end
	end,

	use = function(self, card, area, copier)
		if G.jokers.highlighted and (#G.jokers.highlighted == 1) and G.jokers.highlighted[1] then
			if G.jokers.highlighted[1].config.center.key == "j_cstorm_ethereal_joker" then
				G.jokers.highlighted[1].ability.extra.chips = G.jokers.highlighted[1].ability.extra.chips * self.config.fullDouble
			else
				G.jokers.highlighted[1].ability.extra.chips = G.jokers.highlighted[1].ability.extra.chips * self.config.halfDouble
			end
		end
		if G.jokers.highlighted[1].config.center.key == "j_cstorm_ethereal_joker" and SMODS.pseudorandom_probability(G.jokers.highlighted[1], 'keepPulsar', 1, self.config.odds) then
			SMODS.add_card { key = "c_cstorm_pulsar", area = G.consumeables}
		end
	end,

}
