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
			SMODS.add_card { key = astro_key, area = G.cstorm_astro_card_area }
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