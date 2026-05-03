return {
	"nvimdev/lspsaga.nvim",
    event = "LspAttach",
	dependencies = {
		"nvim-treesitter/nvim-treesitter", -- optional
		"nvim-tree/nvim-web-devicons", -- optional
	},
    keys = {
        { "<leader>cR", "<cmd>Lspsaga finder<cr>", desc = "Saga Finder" },
    },
	config = function()
		require("lspsaga").setup({
			request_timeout = 2000,
			-- keybinds for navigation in lspsaga window
			scroll_preview = { scroll_down = "<C-f>", scroll_up = "<C-b>" },
			symbol_in_winbar = {
				enable = false,
			},
			-- use enter to open file with definition preview
			definition = {
				edit = "<cr>",
			},
			finder = {
				keys = {
					vsplit = "v",
					split = "x",
				},
			},
		})
	end,
}