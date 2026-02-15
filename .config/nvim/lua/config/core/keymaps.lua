-----------------------------------------------------------
-- Define keymaps of Neovim and installed plugins.
-----------------------------------------------------------

local map = vim.keymap.set
local opts = { noremap = true, silent = true }

-----------------------------------------------------------
-- Neovim shortcuts
-----------------------------------------------------------

-- go to beginning and end
map("i", "<C-b>", "<ESC>^i", opts)
map("i", "<C-e>", "<End>", opts)

-- navigate within insert mode
map("i", "<C-h>", "<Left>", opts)
map("i", "<C-l>", "<Right>", opts)
map("i", "<C-j>", "<Down>", opts)
map("i", "<C-k>", "<Up>", opts)

-- Clear search highlighting
map("n", "<Esc>", ":nohl<CR>", opts)

-- create splits
map("n", "<C-v>", "<C-w>v", opts)
map("n", "<C-x>", "<C-w>s", opts)
map("n", "<C-z>", "<C-w>=", opts)
map("n", "<C-c>", ":close<CR>", opts)

-- move splits
map("n", "<C-S-h>", "<C-w>H", opts)
map("n", "<C-S-j>", "<C-w>J", opts)
map("n", "<C-S-k>", "<C-w>K", opts)
map("n", "<C-S-l>", "<C-w>L", opts)
map("n", "<C-s>", ":MaximizerToggle<CR>", opts)

-----------------------------------------------------------
-- Applications and Plugins shortcuts
-----------------------------------------------------------

-- NeoTree
map("n", "<C-n>", ":Neotree filesystem reveal left<CR>", opts)

-- Comments
map("n", "<C-_>", ":lua require('Comment.api').toggle.linewise.current()<CR>", opts)
map("v", "<C-_>", "<ESC><cmd>lua require('Comment.api').toggle.linewise(vim.fn.visualmode())<CR>", opts)
map("v", "<C-b>", "<ESC><cmd>lua require('Comment.api').toggle.blockwise(vim.fn.visualmode())<CR>", opts)

map("n", "ds", ":diffget //2<Bar>diffupdate<CR>", opts)
map("n", "dm", ":diffget //3<Bar>diffupdate<CR>", opts)
