--Credits to All in Jest
function balance_percent(card, percent)
	local chip_mod = percent * hand_chips
	local mult_mod = percent * mult
	local avg = (chip_mod + mult_mod) / 2
	hand_chips = hand_chips + (avg - chip_mod)
	mult = mult + (avg - mult_mod)
	local text = localize('k_balanced')

	update_hand_text({ delay = 0 }, { mult = mult, chips = hand_chips })
	card_eval_status_text(card, 'extra', nil, nil, nil, {
		message = text,
		colour = { 0.8, 0.45, 0.85, 1 },
		sound = 'gong'
	})

	G.E_MANAGER:add_event(Event({
		trigger = 'immediate',
		func = (function()
			ease_colour(G.C.UI_CHIPS, { 0.8, 0.45, 0.85, 1 })
			ease_colour(G.C.UI_MULT, { 0.8, 0.45, 0.85, 1 })
			G.E_MANAGER:add_event(Event({
				trigger = 'after',
				blockable = false,
				blocking = false,
				delay = 4.3,
				func = (function()
					ease_colour(G.C.UI_CHIPS, G.C.BLUE, 2)
					ease_colour(G.C.UI_MULT, G.C.RED, 2)
					return true
				end)
			}))
			G.E_MANAGER:add_event(Event({
				trigger = 'after',
				blockable = false,
				blocking = false,
				no_delete = true,
				delay = 6.3,
				func = (function()
					G.C.UI_CHIPS[1], G.C.UI_CHIPS[2], G.C.UI_CHIPS[3], G.C.UI_CHIPS[4] = G.C.BLUE[1], G.C.BLUE[2],
						G.C.BLUE[3],
						G.C.BLUE[4]
					G.C.UI_MULT[1], G.C.UI_MULT[2], G.C.UI_MULT[3], G.C.UI_MULT[4] = G.C.RED[1], G.C.RED[2], G.C.RED[3],
						G.C.RED
						[4]
					return true
				end)
			}))
			return true
		end)
	}))

	delay(0.6)
	return hand_chips, mult
end

function destroy_and_spawn_astros(astro_key)
	G.E_MANAGER:add_event(Event({
		func = function()
			if #G.cstorm_astro_card_area.cards > 0 then
				SMODS.destroy_cards(G.cstorm_astro_card_area.cards)
			end
			if next(SMODS.find_card("c_cstorm_sagittarius")) then
                for _, sagittarius in ipairs(SMODS.find_card("c_cstorm_sagittarius")) do
                    SMODS.destroy_cards(sagittarius)
                end
            end
			return true
		end
	}))
	delay(0.05)
	G.E_MANAGER:add_event(Event({
		func = function()
			local card = SMODS.add_card { key = astro_key, area = G.cstorm_astro_card_area }
			card:set_sprites(card.config.center)
			return true
		end
	}))
end

function my_pow(base, exponent)
    if base == 0 and exponent == 0 then
        return 1 -- 0^0 is defined as 1 here because I say so >:(
    elseif base == 0 then
        return 0
    elseif exponent == 0 then
        return 1
    elseif exponent > 0 and math.floor(exponent) == exponent then
        -- int exponent
        local result = 1
        for i = 1, exponent do
            result = result * base
        end
        return result
    else
        -- not int or negative exponent
        return math.exp(exponent * math.log(base))
    end
end

function level_up_hand_mult(card, hand, instant, amount)
    if (G.GAME.hands[hand].level and G.GAME.hands[hand].mult) then
        amount = amount or 1
        G.GAME.hands[hand].level = math.max(0, G.GAME.hands[hand].level + amount)

        G.GAME.hands[hand].mult = math.max(1, G.GAME.hands[hand].mult + (G.GAME.hands[hand].l_mult * amount * 2))
        if not instant then
            G.E_MANAGER:add_event(Event({
                trigger = 'after',
                delay = 0.2,
                func = function()
                    play_sound('tarot1')
                    if card then card:juice_up(0.8, 0.5) end
                    G.TAROT_INTERRUPT_PULSE = true
                    return true
                end
            }))
            update_hand_text({ delay = 0 }, { mult = G.GAME.hands[hand].mult, StatusText = true })
            G.E_MANAGER:add_event(Event({
                trigger = 'after',
                delay = 0.9,
                func = function()
                    play_sound('tarot1')
                    if card then card:juice_up(0.8, 0.5) end
                    G.TAROT_INTERRUPT_PULSE = nil
                    return true
                end
            }))
            update_hand_text({ sound = 'button', volume = 0.7, pitch = 0.9, delay = 0 }, { level = G.GAME.hands[hand]
            .level })
            delay(1.3)
        end
        G.E_MANAGER:add_event(Event({
            trigger = 'immediate',
            func = (function()
                check_for_unlock { type = 'upgrade_hand', hand = hand, level = G.GAME.hands[hand].level }
                return true
            end)
        }))
    end
end

function get_random_riddle(object)
	if tostring(object) == "riddle_joker" then
		local index = math.random(1, #CSTORM.riddles)
		return CSTORM.riddles[index]
	elseif tostring(object) == "the_riddler" then
		-- Array with keys
		local keys = {"Jokers",}

		-- get random key
		local randomKey = keys[math.random(#keys)]

		-- random element from array
		local pool = CSTORM.boss_riddles[randomKey]
		local randomElement = pool[math.random(#pool)]

		return randomElement
	end
end

function check_riddle_answer(user_answer, riddle_answer)
	if user_answer == riddle_answer then
		return true
	else
		return false
	end
end
