local battery = sbar.add("item", "battery", {
	update_freq = 30,
	position = "right",
})

local function updateBattery()
	sbar.exec("pmset -g batt", function(batteryInfo)
		sbar.exec("pmset -g", function(generalInfo)
			local batteryPercentage = tonumber(batteryInfo:match("%d+%%"):sub(1, -2))
			local charging = batteryInfo:match("AC Power")
			local lowpower = generalInfo:match("lowpowermode         %d+")

			local batteryIcon

			if batteryPercentage >= 90 then
				batteryIcon = ""
			elseif batteryPercentage > 60 then
				batteryIcon = ""
			elseif batteryPercentage > 30 then
				batteryIcon = ""
			elseif batteryPercentage > 10 then
				batteryIcon = ""
			elseif batteryPercentage < 10 then
				batteryIcon = ""
			end

			local iconColor = 0xffffffff

			if charging ~= nil then
				iconColor = 0xff39ff14
				if batteryPercentage == 100 then
					batteryIcon = "􀢋"
				else
					batteryIcon = ""
				end
			elseif lowpower:match("1$") == "1" then
				iconColor = 0xffffe983
			end

			battery:set({
				label = {
					string = batteryPercentage .. "%",
				},
				icon = {
					string = batteryIcon,
					color = iconColor,
				},
			})
		end)
	end)
end

battery:subscribe("system_woke", updateBattery)
battery:subscribe("power_source_change", updateBattery)
battery:subscribe("routine", updateBattery)
