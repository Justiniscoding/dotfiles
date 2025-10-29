return {
	{
		"Shatur/neovim-ayu",
		lazy = false,
		priority = 1000,
		config = function()
			require("ayu").setup({
				mirage = false, -- Set to `true` for mirage variant
				terminal = true, -- true = ayu sets terminal colors
				overrides = {
					LineNr = { fg = "#ffb454" },
					CursorLineNr = { fg = "#51b3ec" },
				},
			})
			vim.cmd("colorscheme ayu")
		end,
	},
}
