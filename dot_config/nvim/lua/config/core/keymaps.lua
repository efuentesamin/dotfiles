-----------------------------------------------------------
-- Define keymaps of Neovim and installed plugins.
-----------------------------------------------------------

local function map(mode, lhs, rhs, opts)
	local options = { noremap = true, silent = true }
	if opts then
		options = vim.tbl_extend("force", options, opts)
	end
	vim.api.nvim_set_keymap(mode, lhs, rhs, options)
end

vim.g.mapleader = " "

-----------------------------------------------------------
-- Neovim shortcuts
-----------------------------------------------------------

-- go to  beginning and end
map("i", "<C-b>", "<ESC>^i")
map("i", "<C-e>", "<End>")

-- navigate within insert mode
map("i", "<C-h>", "<Left>")
map("i", "<C-l>", "<Right>")
map("i", "<C-j>", "<Down>")
map("i", "<C-k>", "<Up>")

-- Clear search highlighting with <leader> and c
map("n", "<Esc>", ":nohl<CR>")

-- Reload configuration without restart nvim
-- map('n', '<leader>r', ':so %<CR>')

-- create splits
map("n", "<C-v>", "<C-w>v")
map("n", "<C-x>", "<C-w>s")
map("n", "<C-z>", "<C-w>=")
map("n", "<C-c>", ":close<CR>")

-- select splits
-- map("n", "<C-h>", "<C-w>h")
-- map("n", "<C-j>", "<C-w>j")
-- map("n", "<C-k>", "<C-w>k")
-- map("n", "<C-l>", "<C-w>l")

-- move splits
map("n", "<C-S-h>", "<C-w>H")
map("n", "<C-S-j>", "<C-w>J")
map("n", "<C-S-k>", "<C-w>K")
map("n", "<C-S-l>", "<C-w>L")
map("n", "<C-s>", ":MaximizerToggle<CR>")

-----------------------------------------------------------
-- Applications and Plugins shortcuts
-----------------------------------------------------------

-- NeoTree
map("n", "<C-n>", ":Neotree filesystem reveal left<CR>") -- open/close

-- Tagbar
-- map("n", "<leader>z", ":TagbarToggle<CR>") -- open/close

-- Comments
map("n", "<C-_>", ":lua require('Comment.api').toggle.linewise.current()<CR>")
map("v", "<C-_>", "<ESC><cmd>lua require('Comment.api').toggle.linewise(vim.fn.visualmode())<CR>")
map("v", "<C-b>", "<ESC><cmd>lua require('Comment.api').toggle.blockwise(vim.fn.visualmode())<CR>")

map("n", "ds", ":diffget //2<Bar>diffupdate<CR>")
map("n", "dm", ":diffget //3<Bar>diffupdate<CR>")
