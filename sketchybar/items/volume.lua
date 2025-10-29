local volume = sbar.add("item", "volume", {
	position = "right",
})

volume:subscribe("volume_change", function(event)
	sbar.exec(
		"osascript -e '''tell application \"Background Music\" \nget selected output device\n end tell''' | cut -c 14-",
		function(audioDevice)
			local isUsingHeadphones = true
			if audioDevice:match("Headphones") then
				isUsingHeadphones = false
			end
			local volumeAmount = tonumber(event.INFO)
			local volumeIcon = "󰖁"

			if isUsingHeadphones then
				if volumeAmount > 90 then
					volumeIcon = "􀊩"
				elseif volumeAmount > 60 then
					volumeIcon = "󰕾"
				elseif volumeAmount > 30 then
					volumeIcon = "󰖀"
				elseif volumeAmount > 0 then
					volumeIcon = "󰕿"
				end
			else
				if volumeAmount > 0 then
					volumeIcon = "􀑈"
				else
					volumeIcon = "􂬂"
				end
			end
			volume:set({
				label = {
					string = volumeAmount .. "%",
				},
				icon = {
					string = volumeIcon,
				},
			})
		end
	)
end)
