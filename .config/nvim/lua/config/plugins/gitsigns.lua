return {
	"lewis6991/gitsigns.nvim",
	dependencies = {
		"nvim-lua/plenary.nvim",
		"kyazdani42/nvim-web-devicons",
	},
	event = { "BufReadPre", "BufNewFile" },
	opts = {},
	config = function(_, opts)
		require("gitsigns").setup(opts)
	end,
}
