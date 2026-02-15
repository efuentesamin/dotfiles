return {
	"williamboman/mason-lspconfig.nvim",
	dependencies = {
		"williamboman/mason.nvim",
		"neovim/nvim-lspconfig",
		"hrsh7th/cmp-nvim-lsp",
	},
	config = function()
		local mason_lspconfig = require("mason-lspconfig")

		mason_lspconfig.setup({
			-- list of servers for mason to install
			ensure_installed = {
				"bashls",
				"ts_ls",
				"jsonls",
				"ast_grep",
				"yamlls",
				"angularls",
				"html",
				"cssls",
				"tailwindcss",
				"svelte",
				"lua_ls",
				"graphql",
				"emmet_ls",
				"prismals",
				"pylsp",
			},
		})

		-- import cmp-nvim-lsp plugin
		local cmp_nvim_lsp = require("cmp_nvim_lsp")

		-- used to enable autocompletion (assign to every lsp server config)
		local capabilities = cmp_nvim_lsp.default_capabilities()

		local keymap = vim.keymap -- for conciseness

		vim.api.nvim_create_autocmd("LspAttach", {
			group = vim.api.nvim_create_augroup("UserLspConfig", {}),
			callback = function(ev)
				-- Buffer local mappings.
				-- See `:help vim.lsp.*` for documentation on any of the below functions
				local opts = { buffer = ev.buf, silent = true }

				-- set keybinds
				opts.desc = "Show LSP definitions"
				keymap.set("n", "gf", "<cmd>Lspsaga finder<CR>", opts) -- show lsp definitions
				opts.desc = "Show documentation for what is under cursor"
				keymap.set("n", "gd", "<cmd>Lspsaga hover_doc<cr>", opts)
				opts.desc = "Go to previous diagnostic"
				keymap.set("n", "gp", "<cmd>Lspsaga diagnostic_jump_prev<cr>", opts) -- jump to previous diagnostic in buffer
				opts.desc = "Go to next diagnostic"
				keymap.set("n", "gn", "<cmd>Lspsaga diagnostic_jump_next<cr>", opts) -- jump to next diagnostic in buffer
				opts.desc = "See available code actions"
				keymap.set("n", "ga", "<cmd>Lspsaga code_action<cr>", opts) -- see available code actions
				opts.desc = "Smart rename"
				keymap.set("n", "gr", "<cmd>Lspsaga rename<cr>", opts) -- smart rename
				opts.desc = "Go to Window"
				keymap.set("n", "gs", "<cmd>lua require('winpick').show_picker()<cr>", opts) -- smart rename
			end,
		})

		local on_attach = function(client, bufnr)
			-- Highlighting references.
			-- See: https://sbulav.github.io/til/til-neovim-highlight-references/
			-- for the highlight trigger time see: `vim.opt.updatetime`
			if client.server_capabilities.documentHighlightProvider then
				vim.api.nvim_create_augroup("lsp_document_highlight", { clear = true })
				vim.api.nvim_clear_autocmds({ buffer = bufnr, group = "lsp_document_highlight" })
				vim.api.nvim_create_autocmd("CursorHold", {
					callback = vim.lsp.buf.document_highlight,
					buffer = bufnr,
					group = "lsp_document_highlight",
					desc = "Document Highlight",
				})
				vim.api.nvim_create_autocmd("CursorMoved", {
					callback = vim.lsp.buf.clear_references,
					buffer = bufnr,
					group = "lsp_document_highlight",
					desc = "Clear All the References",
				})
			end

			-- Mappings.
			-- typescript specific keymaps (e.g. rename file and update imports)
			if client.name == "ts_ls" or client.name == "typescript-tools" then
				local opts = { buffer = bufnr, silent = true }
				keymap.set("n", "tr", "<cmd>TSToolsRenameFile<cr>", opts) -- rename file and update imports
				keymap.set("n", "to", "<cmd>TSToolsOrganizeImports<cr>", opts) -- organize imports
			end
		end

		-- import lspconfig plugin
		local lspconfig = require("lspconfig")

		mason_lspconfig.setup_handlers({
			-- default handler for installed servers
			function(server_name)
				lspconfig[server_name].setup({
					capabilities = capabilities,
					on_attach = on_attach,
				})
			end,
			["graphql"] = function()
				-- configure graphql language server
				lspconfig["graphql"].setup({
					capabilities = capabilities,
					on_attach = on_attach,
					filetypes = { "graphql", "gql", "svelte", "typescriptreact", "javascriptreact" },
				})
			end,
			["emmet_ls"] = function()
				-- configure emmet language server
				lspconfig["emmet_ls"].setup({
					capabilities = capabilities,
					on_attach = on_attach,
					filetypes = {
						"html",
						"typescriptreact",
						"javascriptreact",
						"css",
						"sass",
						"scss",
						"less",
						"svelte",
					},
				})
			end,
			["lua_ls"] = function()
				-- configure lua server (with special settings)
				lspconfig["lua_ls"].setup({
					capabilities = capabilities,
					on_attach = on_attach,
					settings = {
						Lua = {
							-- make the language server recognize "vim" global
							diagnostics = {
								globals = { "vim" },
							},
							completion = {
								callSnippet = "Replace",
							},
						},
					},
				})
			end,
			["pylsp"] = function()
				lspconfig["pylsp"].setup({
					capabilities = capabilities,
					on_attach = on_attach,
					settings = {
						pylsp = {
							plugins = {
								-- formatter options
								black = { enabled = false },
								autopep8 = { enabled = false },
								yapf = { enabled = false },
								-- linter options
								ruff = {
									enabled = true,
									lineLength = 120,
								},
								pylint = { enabled = false },
								pyflakes = { enabled = false },
								pycodestyle = { enabled = false },
								mccabe = { enabled = false },
								-- type checker
								pylsp_mypy = { enabled = true },
								-- auto-completion options
								jedi_completion = { fuzzy = true },
								rope_autoimport = { enabled = true },
								-- import sorting
								isort = { enabled = true },
							},
						},
					},
					flags = {
						debounce_text_changes = 200,
					},
				})
			end,
		})
	end,
}
