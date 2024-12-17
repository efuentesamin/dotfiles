return {
	"mrded/nvim-lsp-notify",
	lazy = false,
	dependencies = { "rcarriga/nvim-notify" },
	config = function()
		require("lsp-notify").setup({
			notify = require("notify"),
		})
	end,
}