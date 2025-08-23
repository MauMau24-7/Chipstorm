function create_UIBox_custom_video1(name, buttonname)
	local file_path = SMODS.Mods["Chipstorm"].path .. "/resources/" .. name .. ".ogv"
	local file = NFS.read(file_path)
	love.filesystem.write("temp.ogv", file)
	local video_file = love.graphics.newVideo('temp.ogv')
	local vid_sprite = Sprite(0, 0, 11 * 16 / 9, 11, G.ASSET_ATLAS["ui_" .. (G.SETTINGS.colourblind_option and 2 or 1)],
		{ x = 0, y = 0 })
	video_file:getSource():setVolume(G.SETTINGS.SOUND.volume * G.SETTINGS.SOUND.game_sounds_volume / (100 * 10))
	vid_sprite.video = video_file
	video_file:play()

	local t = create_UIBox_generic_options({
		back_delay = 15,
		back_label = buttonname,
		colour = G.C.BLACK,
		padding = 0,
		contents = {
			{ n = G.UIT.O, config = { object = vid_sprite } } }
	})
	return t
end
get_vo = function()
	local voucher_pool = get_current_pool('Voucher')
	local selected_voucher = pseudorandom_element(voucher_pool, 'cstorm')
	local it = 1
	while selected_voucher == 'UNAVAILABLE' do
		it = it + 1
		selected_voucher = pseudorandom_element(voucher_pool, 'giveVoucher' .. it)
	end
	local voucher = SMODS.add_card { key = selected_voucher, area = G.play }
	voucher.cost = 0
	voucher:redeem()
end

local function stopScoring()
	G.E_MANAGER:add_event(Event({
		func = function()
			G.SETTINGS.paused = true
			return true
		end
	}))
end


SMODS.Blind {
	key = "slots",
	atlas = "blinds",
	pos = { x = 0, y = 0 },
	dollars = 10,
	mult = 5,
	boss = { min = 1, max = 10 },
	boss_colour = HEX('B31111'),
	config = {
		jackpot_chips = 1000000,
		jackpot_dollars = 50,

		chipMult = 1.5,

		multMult = 1.5,

		rolledDollar = 5,
	},

	press_play = function(self)
		RNGesus = pseudorandom("GAMBLING", 1, 1000)

		--Jackpot
		if RNGesus == 1 then
			stopScoring()
			G.FUNCS.overlay_menu {
				definition = create_UIBox_custom_video1("slotsMeme", "Continue..."),
				config = { no_esc = true },
			}
			--Death
		elseif RNGesus >= 2 and RNGesus <= 6 then
			stopScoring()
			G.FUNCS.overlay_menu {
				definition = create_UIBox_custom_video1("slotsMeme", "Continue..."),
				config = { no_esc = true },
			}
			--burnCard
		elseif RNGesus >= 7 and RNGesus <= 40 then
			stopScoring()
			G.FUNCS.overlay_menu {
				definition = create_UIBox_custom_video1("slotsMeme", "Continue..."),
				config = { no_esc = true },
			}
			--destroyJoker
		elseif RNGesus >= 41 and RNGesus <= 85 then
			stopScoring()
			G.FUNCS.overlay_menu {
				definition = create_UIBox_custom_video1("slotsMeme", "Continue..."),
				config = { no_esc = true },
			}
			--getTarot
		elseif RNGesus >= 86 and RNGesus <= 164 then
			stopScoring()
			G.FUNCS.overlay_menu {
				definition = create_UIBox_custom_video1("slotsMeme", "Continue..."),
				config = { no_esc = true },
			}
			--chipsMult
		elseif RNGesus >= 165 and RNGesus <= 358 then
			stopScoring()
			G.FUNCS.overlay_menu {
				definition = create_UIBox_custom_video1("slotsMeme", "Continue..."),
				config = { no_esc = true },
			}
			--multMult
		elseif RNGesus >= 359 and RNGesus <= 627 then
			stopScoring()
			G.FUNCS.overlay_menu {
				definition = create_UIBox_custom_video1("slotsMeme", "Continue..."),
				config = { no_esc = true },
			}
			--$5
		elseif RNGesus >= 628 and RNGesus <= 965 then
			stopScoring()
			G.FUNCS.overlay_menu {
				definition = create_UIBox_custom_video1("slotsMeme", "Continue..."),
				config = { no_esc = true },
			}
			--Voucher
		elseif RNGesus >= 966 and RNGesus <= 1000 then
			stopScoring()
			G.FUNCS.overlay_menu {
				definition = create_UIBox_custom_video1("slotsVoucher", "Continue..."),
				config = { no_esc = true },
			}
		end
	end,

	calculate = function(self, blind, context)
		if context.final_scoring_step then
			--Jackpot
			if RNGesus == 1 then
				return {
					chips = self.config.jackpot_chips,
					dollars = self.config.jacjpot_dollars
				}
			--chipsMult
			elseif RNGesus >= 165 and RNGesus <= 358 then
				return{
					xchips = self.config.chipMult
				}
			--multMult	
			elseif RNGesus >= 359 and RNGesus <= 627 then
				return{
					xmult = self.config.multMult
				}
			--$5
			elseif RNGesus >= 628 and RNGesus <= 965 then
				return{
					dollars = self.config.rolledDollar
				}
			end
		end

		if context.after then
			--Death
			if RNGesus >= 2 and RNGesus <= 6 then
				G.E_MANAGER:add_event(Event({
					blocking = false,
					func = function()
						G.STATE = G.STATES.GAME_OVER
						G.STATE_COMPLETE = false
						return true
					end
				}))
			end
			--burnCard
			if RNGesus >= 7 and RNGesus <= 40 then
				local destroyCard = pseudorandom_element(G.playing_cards, "burnCard")
				SMODS.destroy_cards(destroyCard)
			--destroyJoker
			elseif RNGesus >= 41 and RNGesus <= 85 then
				if #G.jokers.cards > 0 then
					local destroyJoker = pseudorandom_element(G.jokers.cards, "destroyJoker")
					SMODS.destroy_cards(destroyJoker)
				else
					G.jokers.config.card_limit = G.jokers.config.card_limit - 1
				end
			--getTarot
			elseif RNGesus >= 86 and RNGesus <= 164 then
				SMODS.add_card({ set = 'Tarot' })
			--getVoucher
			elseif RNGesus >= 966 and RNGesus <= 1000 then
				get_vo()
			end
		end
	end

}
