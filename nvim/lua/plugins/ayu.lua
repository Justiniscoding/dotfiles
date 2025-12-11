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
					SnacksDashboardDir = { fg = "#e6b450" },
					SnacksPickerTotals = { fg = "#bfbdb6" },
					SnacksPickerDir = { fg = "#ffffff" },

					-- Blink Cmp Icon Colors
					BlinkCmpKindVariable = { fg = "#51b3ec" },
					BlinkCmpKindMethod = { fg = "#7fd962" },
					BlinkCmpKindFunction = { fg = "#7fd962" },
					BlinkCmpKindText = { fg = "#f26d78" },
					BlinkCmpKindSnippet = { fg = "#409fff" },

					BlinkCmpMenuSelection = { fg = "#409fff" },
					BlinkCmpGhostText = { fg = "#5a574e" },
					BlinkCmpMenuBorder = { fg = "#7fd962" },
					BlinkCmpScrollbarThumb = { bg = "#e6b450" },
				},
			})
			vim.cmd("colorscheme ayu")
		end,
	},
}
