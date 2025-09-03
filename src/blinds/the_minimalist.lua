SMODS.Blind{
    key = "the_minimalist",
    atlas = "blinds",
    pos = { x = 0, y = 1},
    dollars = 5,
    mult = 2,
    boss = { min = 1, max = 10 },
    boss_colour = HEX("4dcf44"),
    config = { maxRanks = 3 },

	calculate = function (self, blind, context)
		local ranks = {}
		local seen = {}
		local uniqueRanks = 0
		if context.scoring_hand then
			for _, card in ipairs(context.full_hand) do
				table.insert(ranks, card:get_id())
				if not seen[card:get_id()] then
					seen[card:get_id()] = true
					uniqueRanks = uniqueRanks + 1
				end
			end
		end

		if context.debuff_hand then
			if uniqueRanks > self.config.maxRanks then
				blind.triggered = true
				return {
					debuff = true
				}
			end
		end
	end
}