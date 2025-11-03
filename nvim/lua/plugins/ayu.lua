return {
	{
		"Shatur/neovim-ayu",
		lazy = false,
		priority = 1000,
		config = function()
			require("ayu").setup({
				mirage = false,
				terminal = true,
				overrides = {
					LineNr = { fg = "#ffb454" },
					CursorLineNr = { fg = "#51b3ec" },
					SnacksPickerPathHidden = { fg = "#7fd962" },
					SnacksPickerPathIgnored = { fg = "#409fff" },
					SnacksPickerGitStatusUntracked = { fg = "#f26d78" },
				},
			})
			vim.cmd("colorscheme ayu")
		end,
	},
}
