SMODS.Joker {
	key = "riddle_joker",
	config = { extra = { hand_or_discard = 1 } },
	pos = { x = 0, y = 0 },
	rarity = 2,
	cost = 5,
	blueprint_compat = true,
	eternal_compat = true,
	unlocked = true,
	discovered = false,
	atlas = 'jokers_SPACEHOLDER',

	calculate = function(self, card, context)
		if context.blind then
			already_done = false
			local RNGesus = pseudorandom("riddle_joker_hand_discard", 1, 2)
			if not context.blueprint then
				Riddle_all = get_random_riddle()
				Riddle = Riddle_all.question
				for i, text in ipairs(Riddle) do
					SMODS.calculate_effect({ message = text, colour = G.C.PURPLE }, card)
				end
			end
			if RNGesus == 1 then
				G.GAME.current_round.hands_left = G.GAME.current_round.hands_left + card.ability.extra.hand_or_discard
			elseif RNGesus == 2 then
				G.GAME.current_round.discards_left = G.GAME.current_round.discards_left +
					card.ability.extra.hand_or_discard
			end
		end
		if context.end_of_round then
			if already_done == false then
				Riddle = { "Answer: " .. Riddle_all.answer }
				SMODS.calculate_effect({ message = Riddle, colour = G.C.GREEN }, card)
				already_done = true
			end
		end
	end,

	loc_vars = function(self, info_queue, card)
		if card.area and card.area == G.jokers then
			local rows = {}

			if Riddle ~= nil then
				if Riddle_all ~= nil and Riddle[1] == "Answer: " .. Riddle_all.answer then
					riddle_colour = G.C.GREEN
				elseif Riddle == Riddle_all.question then
					riddle_colour = G.C.PURPLE
				end
				
				for i, text in ipairs(Riddle) do
					table.insert(rows, {
						n = G.UIT.R,
						config = { ref_table = card, align = "m", colour = riddle_colour, r = 0.05, padding = 0.06 },
						nodes = {
							{ n = G.UIT.T, config = { text = ' ' .. text .. ' ', colour = G.C.UI.TEXT_LIGHT, scale = 0.32 * 0.8 } },
						}
					})
				end
			else
				-- Falls kein Riddle vorhanden -> "chipstorm_none"
				table.insert(rows, {
					n = G.UIT.R,
					config = { ref_table = card, align = "m", colour = G.C.GREY, r = 0.05, padding = 0.06 },
					nodes = {
						{ n = G.UIT.T, config = { text = ' ' .. localize('chipstorm_none') .. ' ', colour = G.C.UI.TEXT_LIGHT, scale = 0.32 * 0.8 } },
					}
				})
			end

			main_end = {
				{
					n = G.UIT.C,
					config = { align = "bm", minh = 0.4 },
					nodes = rows
				}
			}
			return { vars = { card.ability.extra.hand_or_discard }, key = self.key, main_end = main_end }
		end
		return { vars = { card.ability.extra.hand_or_discard }, key = self.key }
	end
}
