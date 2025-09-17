--CREDITS TO PAPERBACK

SMODS.Consumable {
	key = "gemini",
	config = { copying = nil, multiplier = 2, },
	set = "cstorm_astro",
	atlas = "astro",
    discovered = false,
    unlocked = false,
	pos = { x = 2, y = 0 },

	calculate = function(self, card, context)
		local ret = nil

		if card.config.copying then
			local jokers = SMODS.find_card(card.config.copying)
			local other_joker = pseudorandom_element(jokers, pseudoseed("gemini_dupes"))

			if other_joker and not context.no_blueprint then
				local other_joker_ret = SMODS.blueprint_effect(card, other_joker, context)

				if other_joker_ret then
					-- Multiply the returned effects if they're mult, xmult or chips
					ret = CSTORM_UTIL.modify_gemini_effect(self, other_joker_ret)
				end
			elseif not other_joker then
				card.config.copying = nil
			end
		end

		-- Swaps the copied card after a hand is played, showing a reset message
		if not context.blueprint and context.end_of_round and context.cardarea == G.cstorm_astro_card_area then
			CSTORM_UTIL.reset_gemini(card)

			SMODS.calculate_effect({
				message = localize('k_reset')
			}, card)
		end

		return ret
	end,

	in_pool = function(self, args)
		return false
	end,

	loc_vars = function(self, info_queue, card)
		local copying = card.config.copying

		info_queue[#info_queue + 1] = { set = "Other", key = "astro_planets", specific_vars = { "Mercury & Planet X" } }
		return { vars = { copying and G.localization.descriptions.Joker[copying].name or localize('chipstorm_none') }, key = self.key }
	end,

	locked_loc_vars = function (self, info_queue, card)
        if G.PROFILES[G.SETTINGS.profile].geminiHint == true then
            return { key = self.key .. "_hint" }
        end
        return { key = self.key }
    end,

	set_ability = function(self, card, initial, delay_sprites)
		card.states.click.can = false
		if G.STAGE == G.STAGES.RUN then
			CSTORM_UTIL.reset_gemini(card)
		end
	end
}

CSTORM_UTIL.gemini_valid_effects = {
	-- The list of all effects: https://github.com/Steamodded/smods/blob/d89903a71d6ef5a13c0f624f87dc50c8f68129a6/src/utils.lua#L1432
	'chips', 'h_chips', 'chip_mod',
	'x_chips', 'xchips', 'Xchip_mod',
	'mult', 'h_mult', 'mult_mod',
	'x_mult', 'Xmult', 'xmult', 'x_mult_mod', 'Xmult_mod',
	'p_dollars', 'dollars', 'h_dollars',
	'add_to_hand', 'remove_from_hand',
	'level_up',
	'numerator',
	'repetitions',
}

CSTORM_UTIL.gemini_mod_effects = {
	chip_mod = 'chips',
	Xchip_mod = 'x_chips',
	mult_mod = 'mult',
	x_mult_mod = 'x_mult',
	Xmult_mod = 'x_mult',
}

function CSTORM_UTIL.modify_gemini_effect(card, effects)
	local new_effects = {}

	for k, v in pairs(effects) do
		new_effects[k] = v
	end

	for key, value in pairs(effects) do
		if CSTORM_UTIL.is_valid_gemini_effect(key) and type(value) == "number" then
			local eff_type = CSTORM_UTIL.gemini_mod_effects[key]

			-- If the effect is a 'mod' effect
			if eff_type then
				-- Create what the message would look like
				local message = localize {
					type = 'variable',
					key = 'a_' .. eff_type .. (value < 0 and '_minus' or ''),
					vars = { value }
				}

				-- If the message sent by the other joker is the same as the expected one
				-- we remove it so the actual multiplied value will show instead of the
				-- original one
				if new_effects.message == message then
					new_effects.message = nil
				end

				-- Remove the 'mod' effect
				new_effects[key] = nil
			end

			new_effects[eff_type or key] = value * card.config.multiplier
		end
	end

	return new_effects
end

function CSTORM_UTIL.is_valid_gemini_effect(effect)
	for _, v in ipairs(CSTORM_UTIL.gemini_valid_effects) do
		if v == effect then return true end
	end

	return false
end

function CSTORM_UTIL.reset_gemini(card)
	-- Find a random owned joker that is blueprint compatible
	local eligible_jokers = {}

	for k, v in ipairs(G.jokers.cards) do
		if v ~= card and v.config.center.blueprint_compat then
			eligible_jokers[#eligible_jokers + 1] = v
		end
	end

	-- Assign the key of the random joker to gemini
	local joker = pseudorandom_element(eligible_jokers, pseudoseed("gemini"))
	card.config.copying = joker and joker.config.center_key or nil
end
