return {
	"xiyaowong/transparent.nvim",
	config = function()
		require("transparent").setup({
			extra_groups = {
				"NeoTreeNormal",
				"NeoTreeNormalNC",
			},
			exclude_groups = {
				"NavicText",
				"NavicSeparator",
			},
		})
	end,
}
