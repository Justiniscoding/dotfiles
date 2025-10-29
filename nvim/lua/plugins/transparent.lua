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
					"BufferLineBuffer",
					"BufferLineBufferSelected",
					"BufferLineIndicatorSelected",
					"BufferLineBufferVisible",
					"BufferLineFill",
					"BufferLineBackground",
					"BufferLineGroupLabel",
					"BufferLineTabSeperator",
					"BufferLineDuplicate",
					"WinSeparator",
					"MiniTablineCurrent",
					"MiniTablineVisible",
					"SnacksBackdrop",
				},
			})
		end,
	},
}
