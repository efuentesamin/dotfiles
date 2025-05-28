return {
	"folke/which-key.nvim",
	event = "VeryLazy",
	dependencies = {},
	init = function()
		vim.o.timeout = true
		vim.o.timeoutlen = 500
	end,
	opts = {
		preset = "helix",
	},
	config = function(_, opts)
		local wk = require("which-key")
		wk.setup(opts)
		wk.add({
			{ "<leader>e", "<cmd>Neotree filesystem reveal float<cr>", desc = "File explorer" },
			{ "<leader>b", group = "Buffers" },
			{
				"<leader>bh",
				"<cmd>lua require('close_buffers').wipe({ type = 'hidden' })<cr>",
				desc = "Close hidden buffers",
			},
			{ "<leader>bc", "<cmd>Bdelete<cr>", desc = "Close Buffer" },
			{ "<leader>bx", "<cmd>Bwipeout<cr>", desc = "Delete Buffer" },
			{ "<leader>g", group = "Git" },
			{ "<leader>gl", "<cmd>LazyGit<cr>", desc = "Lazygit" },
			{ "<leader>gb", "<cmd>lua require 'gitsigns'.blame_line()<cr>", desc = "Blame" },
			{ "<leader>f", group = "Format & Lint" },
			{ "<leader>l", group = "Language" },
			{ "<leader>lI", "<cmd>Mason<cr>", desc = "Mason Info" },
			{ "<leader>lw", "<cmd>Trouble diagnostics toggle<CR>", desc = "Workspace Diagnostics" },
			{ "<leader>ld", "<cmd>Trouble diagnostics toggle filter.buf=0<CR>", desc = "Document Diagnostics" },
			{ "<leader>ll", "<cmd>Lspsaga show_line_diagnostics<cr>", desc = "Line Diagnostic" },
			{ "<leader>lc", "<cmd>Lspsaga show_cursor_diagnostics<cr>", desc = "Cursor Diagnostic" },
			{ "<leader>ls", "<cmd>Trouble symbols toggle  win.position=right<cr>", desc = "Document Symbols" },
			{ "<leader>lr", "<cmd>Trouble lsp toggle win.position=right<cr>", desc = "Document LSP" },
			{ "<leader>o", group = "Tools" },
			{ "<leader>oq", "<cmd>Trouble quickfix toggle<CR>", desc = "Open trouble quickfix list" },
			{ "<leader>ol", "<cmd>Trouble loclist toggle<CR>", desc = "Open trouble location list" },
			{ "<leader>ot", "<cmd>Trouble todo toggle<CR>", desc = "Open todos in trouble" },
			{ "<leader>s", group = "Search" },
			{ "<leader>sf", "<cmd>FzfLua files resume=true<cr>", desc = "Find files" },
			{ "<leader>sr", "<cmd>FzfLua oldfiles resume=true<cr>", desc = "Open Recent File" },
			{ "<leader>sb", "<cmd>FzfLua buffers resume=true<cr>", desc = "Buffers" },
			{ "<leader>st", "<cmd>FzfLua live_grep resume=true<cr>", desc = "Text" },
			{ "<leader>sw", "<cmd>FzfLua grep_cWORD resume=true<cr>", desc = "WORD" },
			{ "<leader>sc", "<cmd>FzfLua commands resume=true<cr>", desc = "Commands" },
			{ "<leader>sc", "<cmd>FzfLua highlights resume=true<cr>", desc = "Highlights" },
			{ "<leader>t", group = "Tabs" },
			{ "<leader>to", "<cmd>tabnew<cr>", desc = "Open new tab" },
			{ "<leader>tn", "<cmd>tabn<cr>", desc = "Select next tab" },
			{ "<leader>tp", "<cmd>tabp<cr>", desc = "Select previous tab" },
			{ "<leader>tx", "<cmd>tabclose<cr>", desc = "Close current tab" },
		})
	end,
}
