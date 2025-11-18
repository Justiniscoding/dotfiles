return {
	{
		"xiyaowong/transparent.nvim",
		config = function()
			require("transparent").setup({
				extra_groups = {
					"VertSplit",
					"Normal",
					"NormalFloat",
					"ColorColumn",
					"SignColumn",
					"Folded",
					"FoldColumn",
					"CursorLine",
					"CursorColumn",
					"VertSplit",
					"WinSeparator",
					"MiniTablineCurrent",
					"MiniTablineVisible",
					"SnacksBackdrop",
					"TabLine",
					"TabLineFill",
					"RenderMarkdownH2Bg",
					"RenderMarkdownH1Bg",
					"RenderMarkdownH3Bg",
					"RenderMarkdownH4Bg",
					"RenderMarkdownH5Bg",
					"RenderMarkdownH6Bg",
				},
			})
		end,
	},
}
