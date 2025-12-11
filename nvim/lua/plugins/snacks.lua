local nvimHeader = [[
      ████ ██████           █████      ██                 btw
     ███████████             █████                            
     █████████ ███████████████████ ███   ███████████  
    █████████  ███    █████████████ █████ ██████████████  
   █████████ ██████████ █████████ █████ █████ ████ █████  
 ███████████ ███    ███ █████████ █████ █████ ████ █████ 
██████  █████████████████████ ████ █████ █████ ████ ██████]]

local function getGreeting()
	local currentHour = os.date("*t").hour
	local timeString

	if currentHour > 18 then
		timeString = "evening"
	elseif currentHour > 12 then
		timeString = "afternoon"
	else
		timeString = "morning"
	end

	return "Good " .. timeString .. ", Justin"
end

return {
	"folke/snacks.nvim",
	opts = {
		dashboard = {
			preset = {
				header = nvimHeader,
			},
			sections = {
				{
					section = "header",
					align = "center",
					padding = 0,
					height = 7,
					gap = 0,
				},
				{
					text = getGreeting(),
					align = "center",
					padding = 2,
				},
				{
					title = "Quick Actions",
					indent = 2,
					{ icon = " ", key = "f", desc = "Find File", action = ":lua Snacks.dashboard.pick('files')" },
					{
						icon = " ",
						key = "r",
						desc = "Recent Files",
						action = ":lua Snacks.dashboard.pick('oldfiles')",
					},
					{
						icon = " ",
						key = "c",
						desc = "Config",
						action = ":lua Snacks.dashboard.pick('files', {cwd = vim.fn.stdpath('config')})",
					},
					{ icon = " ", key = "s", desc = "Restore Session", section = "session" },
					{ icon = " ", key = "q", desc = "Quit", action = ":qa" },
					padding = 1,
				},
				{
					title = "Recent Files",
					section = "recent_files",
					indent = 2,
					padding = 1,
				},
				{ title = "Recent Projects", section = "projects", indent = 2, padding = 1 },
				{ section = "startup", align = "center" },
			},
		},
		-- Prevent results from .git or node_modules showing in the
		-- file fuzzy finder
		picker = {
			exclude = {
				".git",
				"node_modules",
			},
		},
		lazygit = {
			theme = {
				activeBorderColor = { fg = "SnacksDashboardDir", bold = true },
				inactiveBorderColor = { fg = "SnacksPickerTotals" },
				defaultFgColor = { fg = "SnacksPickerTotals" },
			},
		},
	},
	lazy = false,
}
