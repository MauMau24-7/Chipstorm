SMODS.Consumable {
	key = "pulsar",
	set = "Spectral",
	config = { extra = { max_highlighted = 1, halfDouble = 1.5, fullDouble = 2.5, odds = 10 } },
	atlas = "consumables",
	discovered = false,
	unlocked = true,
	pos = { x = 0, y = 2 },

	can_use = function(self, card)
		if G.jokers.highlighted and (#G.jokers.highlighted == card.ability.extra.max_highlighted) and G.jokers.highlighted[1] and type(G.jokers.highlighted[1].ability.extra) == "table" and G.jokers.highlighted[1].ability.extra.chips ~= nil then
			return true
		end
	end,

	use = function(self, card, area, copier)
		if G.jokers.highlighted and (#G.jokers.highlighted == 1) and G.jokers.highlighted[1] then
			if G.jokers.highlighted[1].config.center.key == "j_cstorm_ethereal_joker" then
				G.jokers.highlighted[1].ability.extra.chips = G.jokers.highlighted[1].ability.extra.chips * card.ability.extra.fullDouble
			else
				G.jokers.highlighted[1].ability.extra.chips = G.jokers.highlighted[1].ability.extra.chips * card.ability.extra.halfDouble
			end
		end
		if G.jokers.highlighted[1].config.center.key == "j_cstorm_ethereal_joker" and SMODS.pseudorandom_probability(G.jokers.highlighted[1], 'keepPulsar', 1, card.ability.extra.odds) then
			SMODS.add_card { key = "c_cstorm_pulsar", area = G.consumeables}
		end
	end,

}
