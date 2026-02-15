return {
	"nvim-lua/plenary.nvim", -- lua functions that many plugins use
	"christoomey/vim-tmux-navigator", -- tmux & split window navigation
	"szw/vim-maximizer",
	"MunifTanjim/nui.nvim",
	"tpope/vim-fugitive",
	"moll/vim-bbye",
	"kazhala/close-buffers.nvim",
	{
		"pmizio/typescript-tools.nvim",
		dependencies = { "nvim-lua/plenary.nvim", "neovim/nvim-lspconfig" },
		opts = {},
	},
}
