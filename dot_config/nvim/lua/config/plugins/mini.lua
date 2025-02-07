return {
	"echasnovski/mini.nvim",
	version = "*",
	config = function()
		--require("mini.animate").setup()
		require("mini.indentscope").setup()
		require("mini.move").setup()
	end,
}
