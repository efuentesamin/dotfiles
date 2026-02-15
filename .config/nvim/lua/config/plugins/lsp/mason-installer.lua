return {
	"WhoIsSethDaniel/mason-tool-installer.nvim",
	dependencies = {
		"williamboman/mason.nvim",
		"williamboman/mason-lspconfig.nvim",
	},
	config = function()
		local mason_tool_installer = require("mason-tool-installer")

		mason_tool_installer.setup({
			ensure_installed = {
				"prettier", -- prettier formatter
				"stylua", -- lua formatter
				"isort", -- python formatter
				"ruff", -- python formatter
				"mypy", -- python linter
				"eslint_d", -- js linter
			},
		})
	end,
}
