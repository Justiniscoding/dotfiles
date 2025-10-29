local isPopupVisible = false

-- TODO:Make a colors lua file and then import ayu colors from https://github.com/ayu-theme/ayu-colors

local b64chars = "ABCDEFGHIJKLMNOPQRSTUVWXYZabcdefghijklmnopqrstuvwxyz0123456789+/"

local function decodeBase64(data)
	data = data:gsub("[^" .. b64chars .. "=]", "")

	return (
		data:gsub(".", function(x)
			if x == "=" then
				return ""
			end
			local r, f = "", (b64chars:find(x) - 1)
			for i = 6, 1, -1 do
				r = r .. (f % 2 ^ i - f % 2 ^ (i - 1) > 0 and "1" or "0")
			end
			return r
		end):gsub("%d%d%d%d%d%d%d%d", function(x)
			return string.char(tonumber(x, 2))
		end)
	)
end

local function secondsToMinutes(seconds)
	local minuteString = ""
	local minutes = math.floor(seconds / 60)

	minuteString = minuteString .. minutes .. ":"
	minuteString = minuteString .. math.floor(seconds - minutes * 60)

	if #minuteString == 3 then
		minuteString = string.sub(minuteString, 0, 2) .. "0" .. string.sub(minuteString, 3, 3)
	end
	return minuteString
end

local nowPlaying = sbar.add("item", "nowPlaying", {
	icon = {
		string = "􃊹",
	},
	label = {
		string = "",
		drawing = "on",
		font = {
			size = 12.0,
		},
	},
	popup = {
		background = {
			color = 0xff000000,
			border_color = 0xff1e90ff,
			border_width = 1,
			corner_radius = 4,
			padding_left = 5,
			padding_right = 5,
		},
		horizontal = true,
		align = "center",
		height = 50,
	},
	position = "right",
	padding_right = 340,
	updates = true,
})

local image = sbar.add("item", "songImage", {
	position = "popup.nowPlaying",
	background = {
		image = {
			drawing = "on",
			scale = 0.25,
		},
		drawing = "on",
	},
	width = 140,
})

local songTitle = sbar.add("item", "songTitle", {
	position = "popup.nowPlaying",
	icon = {
		drawing = "off",
	},
	label = {
		font = {
			size = 20.0,
		},
		max_chars = 35,
		scroll_duration = 175,
		drawing = "on",
		color = 0xff39bae6,
		string = "Song Title",
		padding_right = 0,
	},
	y_offset = 40,
	width = 0,
	padding_right = 0,
	scroll_texts = "on",
})

local songArtist = sbar.add("item", "songArtist", {
	position = "popup.nowPlaying",
	icon = {
		drawing = "off",
	},
	label = {
		font = {
			size = 13.0,
		},
		string = "Song Artist",
		color = 0xff1e90ff,
		padding_right = 0,
	},
	y_offset = 20,
	padding_right = 0,
	width = 0,
})

local currentSongPosition = sbar.add("item", "currentSongPosition", {
	position = "popup.nowPlaying",
	icon = {
		drawing = "off",
	},
	label = {
		font = {
			size = 10.0,
		},
		string = "0:00",
		color = 0xff1e90ff,
		padding_right = 0,
	},
	y_offset = 0,
	padding_right = 20,
	width = 0,
})

local songProgress = sbar.add("slider", "songProgress", 300, {
	position = "popup.nowPlaying",
	slider = {
		percentage = 50,
		highlight_color = 0xffFF8F40,
		background = {
			drawing = "on",
			color = 0xffffb454,
			height = 10,
			corner_radius = 5,
		},
	},
	y_offset = 0,
	update_freq = 1,
	updates = "when_shown",
})

local songLength = sbar.add("item", "songLength", {
	position = "popup.nowPlaying",
	icon = {
		drawing = "off",
	},
	label = {
		font = {
			size = 10.0,
		},
		string = "0:00",
		color = 0xff1e90ff,
		padding_right = 0,
	},
	y_offset = 0,
	padding_left = -5,
	width = 0,
})

sbar.add("item", "spacer", {
	position = "popup.nowPlaying",
	width = 150,
	icon = {
		drawing = "off",
	},
	label = {
		drawing = "off",
	},
})

nowPlaying:subscribe("mouse.clicked", function()
	sbar.exec("media-control get --now", function(songInfo, exitCode)
		isPopupVisible = not isPopupVisible

		-- Saves the current song cover as a jpeg and then use it in the popup
		local file, error = io.open("/tmp/albumCover.jpeg", "wb")
		if file then
			if songInfo.artworkData then
				file:write(decodeBase64(songInfo.artworkData))
				file:close()
			end
		else
			print("error: ", error)
		end

		image:set({ background = { image = { string = "/tmp/albumCover.jpeg" } } })
		nowPlaying:set({ label = { string = songInfo.title }, popup = { drawing = isPopupVisible } })

		songArtist:set({ label = { string = songInfo.artist } })
		songTitle:set({ label = { string = songInfo.title } })
		songLength:set({ label = { string = secondsToMinutes(songInfo.duration) } })

		local songPercentage = songInfo.elapsedTimeNow / songInfo.duration
		songProgress:set({ slider = { percentage = songPercentage * 100 } })
	end)
end)

songProgress:subscribe("routine", function()
	sbar.exec("media-control get --now", function(songInfo, exitCode)
		local songPercentage = songInfo.elapsedTimeNow / songInfo.duration
		songProgress:set({ slider = { percentage = songPercentage * 100 } })

		currentSongPosition:set({ label = { string = secondsToMinutes(songInfo.elapsedTimeNow) } })
	end)
end)
