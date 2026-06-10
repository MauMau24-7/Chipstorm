-- Devil's Deal
SMODS.Consumable {
	key = "devils_deal",
	set = "Spectral",
	config = { extra = { joker_slots = 1, curse_amount = 2 } },
	atlas = "consumables",
	discovered = false,
	unlocked = true,
	pos = { x = 0, y = 2 },

	can_use = function(self, card)
		return #G.jokers.cards >= card.ability.extra.curse_amount
	end,

	use = function(self, card, area, copier)
		Chipstorm.apply_curses_to_jokers(card.ability.extra.curse_amount, Chipstorm.key_to_seed(self.key), "strong")

		if G.jokers then
			G.jokers.config.card_limit = G.jokers.config.card_limit + card.ability.extra.joker_slots
		end
	end,

	loc_vars = function(self, info_queue, card)
		for _, curse in ipairs(Chipstorm.get_strong_curses()) do
			info_queue[#info_queue + 1] = G.P_CENTERS[curse]
		end

		return { vars = { card.ability.extra.joker_slots, card.ability.extra.curse_amount }, key = self.key }
	end

}

-- Devil's Worker
SMODS.Consumable {
	key = "devils_worker",
	set = "Spectral",
	config = { extra = { legedaries = 1 } },
	atlas = "consumables",
	discovered = false,
	unlocked = true,
	pos = { x = 0, y = 2 },

	can_use = function(self, card)
		return #G.jokers.cards < G.jokers.config.card_limit and #G.jokers.cards >= card.ability.extra.curse_amount
	end,

	use = function(self, card, area, copier)
		local random_curse = pseudorandom_element(Chipstorm.get_strong_curses(), Chipstorm.key_to_seed(self.key))
		local c = create_card('Joker', G.jokers, true, nil, false, false, nil, Chipstorm.key_to_seed(self.key))

		c:set_edition(random_curse)
		G.jokers:emplace(c)
	end,

	loc_vars = function(self, info_queue, card)
		for _, curse in ipairs(Chipstorm.get_strong_curses()) do
			info_queue[#info_queue + 1] = G.P_CENTERS[curse]
		end

		return { vars = { card.ability.extra.legedaries }, key = self.key }
	end

}

-- Devil's Hand
SMODS.Consumable {
	key = "devils_hand",
	set = "Spectral",
	config = { extra = { add_handsize = 2, curse_amount = 1 } },
	atlas = "consumables",
	discovered = false,
	unlocked = true,
	pos = { x = 0, y = 2 },

	can_use = function(self, card)
		return #G.jokers.cards >= card.ability.extra.curse_amount
	end,

	use = function(self, card, area, copier)
		G.hand:change_size(card.ability.extra.add_handsize)

		Chipstorm.apply_curses_to_jokers(card.ability.extra.curse_amount, Chipstorm.key_to_seed(self.key), "weak")
	end,

	loc_vars = function(self, info_queue, card)
		for _, curse in ipairs(Chipstorm.get_weak_curses()) do
			info_queue[#info_queue + 1] = G.P_CENTERS[curse]
		end

		return { vars = { card.ability.extra.add_handsize, card.ability.extra.curse_amount }, key = self.key }
	end

}

-- Devil's Wealth
SMODS.Consumable {
	key = "devils_wealth",
	set = "Spectral",
	config = { extra = { curse_amount = 2, money = 0 } },
	atlas = "consumables",
	discovered = false,
	unlocked = true,
	pos = { x = 0, y = 3 },

	can_use = function(self, card)
		return #G.jokers.cards >= card.ability.extra.curse_amount
	end,

	use = function(self, card, area, copier)
		local money = 0
		for i = 1, #G.jokers.cards do
			-- print(money)
            if G.jokers.cards[i].ability.set == 'Joker' then
                money = money + (G.jokers.cards[i].sell_cost * 2)
            end
        end
		card.ability.extra.money = money
		-- print(card.ability.extra.money)

		G.E_MANAGER:add_event(Event({
            trigger = 'after',
            delay = 0.4,
            func = function()
                play_sound('timpani')
                card:juice_up(0.3, 0.5)
                ease_dollars(card.ability.extra.money, true)
                return true
            end
        }))
        delay(0.6)

		Chipstorm.apply_curses_to_jokers(card.ability.extra.curse_amount, Chipstorm.key_to_seed(self.key), "all")
	end,

	loc_vars = function(self, info_queue, card)
		for _, curse in ipairs(Chipstorm.all_curse_editions) do
			info_queue[#info_queue + 1] = G.P_CENTERS[curse]
		end

		if G.jokers then
			local money = 0
			for i = 1, #G.jokers.cards do
				if G.jokers.cards[i].ability.set == 'Joker' then
					money = money + (G.jokers.cards[i].sell_cost * 2)
				end
			end
			card.ability.extra.money = money
		end

		return { vars = { card.ability.extra.money, card.ability.extra.curse_amount }, key = self.key }
	end

}


--// TODO: Implement the following:

-- G.E_MANAGER:add_event(Event({
-- 	trigger = 'imediate',
-- 	delay = 0.4,
-- 	func = function()
-- 		play_sound('devil_sound')	--// TODO: Make the sound
-- 		card:juice_up(0.3, 0.5)
-- 		return true
-- 	end
-- }))
