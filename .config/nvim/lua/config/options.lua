-- Options are automatically loaded before lazy.nvim startup
-- Default options that are always set: https://github.com/LazyVim/LazyVim/blob/main/lua/lazyvim/config/options.lua
-- Add any additional options here

local opt = vim.opt

vim.g.lazyvim_check_order = false
vim.g.lazyvim_picker = "fzf"
vim.g.lazyvim_cmp = "blink.cmp"

opt.signcolumn = "yes"
opt.foldcolumn = "2"
opt.foldmethod = "expr"
opt.foldexpr = "v:lua.vim.treesitter.foldexpr()"

opt.linebreak = false

opt.tabstop = 2
opt.softtabstop = 4
opt.shiftwidth = 4

vim.o.showtabline = 2

vim.g.lazyvim_python_lsp = "ty"
vim.g.lazyvim_python_ruff = "ruff"

