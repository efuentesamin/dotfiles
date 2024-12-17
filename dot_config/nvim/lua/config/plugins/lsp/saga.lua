return {
	"nvimdev/lspsaga.nvim",
	dependencies = {
		"nvim-treesitter/nvim-treesitter", -- optional
		"nvim-tree/nvim-web-devicons", -- optional
	},
	config = function()
		require("lspsaga").setup({
			request_timeout = 2000,
			-- keybinds for navigation in lspsaga window
			scroll_preview = { scroll_down = "<C-f>", scroll_up = "<C-b>" },
			lightbulb = {
				enable = false,
				sign = false,
				enable_in_insert = false,
			},
			-- use enter to open file with definition preview
			definition = {
				edit = "<cr>",
			},
			-- ui = {
			-- 	colors = {
			-- 		normal_bg = "#022746",
			-- 	},
			-- },
			finder = {
				keys = {
					vsplit = "v",
					split = "x",
				},
			},
		})
	end,
}
