local clock = sbar.add("item", "clock", {
	position = "right",
	icon = {
		string = "􀐫",
	},
	label = {
		string = os.date("%d/%m %H:%M"),
	},
	update_freq = 10,
})

clock:subscribe("routine", function()
	local dateString = os.date("%d/%m %H:%M")
	clock:set({ label = { string = dateString } })
end)
