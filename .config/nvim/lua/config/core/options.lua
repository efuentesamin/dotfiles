-----------------------------------------------------------
-- General Neovim settings and configuration
-----------------------------------------------------------

-- Default options are not included
-- See: https://neovim.io/doc/user/vim_diff.html
-- [2] Defaults - *nvim-defaults*

vim.cmd("let g:netrw_liststyle = 3")

local g = vim.g -- Global variables
local opt = vim.opt -- Set options (global/buffer/windows-scoped)

-----------------------------------------------------------
-- General
-----------------------------------------------------------
opt.mouse = "a" -- Enable mouse support
opt.clipboard:append("unnamedplus") -- Copy/paste to system clipboard
opt.swapfile = false -- Don't use swapfile
opt.completeopt = "menuone,noinsert,noselect" -- Autocomplete options
opt.cursorline = true

-----------------------------------------------------------
-- Content
-----------------------------------------------------------
opt.autoread = true
opt.path:append("**")
opt.wildignore:append("*/node_modules/*")
opt.wildmenu = true
opt.showmatch = true
opt.title = true
opt.laststatus = 3
opt.scrolloff = 10
vim.o.showtabline = 2

-----------------------------------------------------------
-- Treesitter based folding
-----------------------------------------------------------
opt.foldcolumn = "2"
opt.foldlevel = 20
opt.foldmethod = "expr"
opt.foldexpr = "nvim_treesitter#foldexpr()"

-----------------------------------------------------------
-- Syntax
-----------------------------------------------------------
opt.syntax = "on"

-----------------------------------------------------------
-- Encoding
-----------------------------------------------------------
opt.encoding = "utf-8"
opt.fileencodings = "utf-8"

-----------------------------------------------------------
-- Line numbers
-----------------------------------------------------------
opt.number = true
opt.relativenumber = true

-----------------------------------------------------------
-- Tabs & Indentation
-----------------------------------------------------------
opt.tabstop = 4
opt.softtabstop = 4
opt.shiftwidth = 4
opt.expandtab = true
opt.autoindent = true
opt.smartindent = true

-----------------------------------------------------------
-- Line Wrapping
-----------------------------------------------------------
opt.wrap = false

-----------------------------------------------------------
-- Search Settings
-----------------------------------------------------------
opt.ignorecase = true
opt.smartcase = true
opt.incsearch = true
opt.hlsearch = true

-----------------------------------------------------------
-- Appearance
-----------------------------------------------------------
opt.termguicolors = true
opt.background = "dark"

-----------------------------------------------------------
-- Backspace
-----------------------------------------------------------
opt.backspace = "start,eol,indent"

-----------------------------------------------------------
-- Split Windows
-----------------------------------------------------------
opt.splitright = true
opt.splitbelow = true

opt.iskeyword:append("-")

-----------------------------------------------------------
-- Neovim UI
-----------------------------------------------------------
opt.linebreak = true -- Wrap on word boundary

-----------------------------------------------------------
-- Memory, CPU
-----------------------------------------------------------
opt.hidden = true -- Enable background buffers
opt.history = 100 -- Remember N lines in history
-- opt.lazyredraw = true -- Faster scrolling
opt.synmaxcol = 240 -- Max column for syntax highlight
opt.updatetime = 250 -- ms to wait for trigger an event

-----------------------------------------------------------
-- Startup
-----------------------------------------------------------
-- Disable nvim intro
opt.shortmess:append("sI")

-- -- Disable builtin plugins
local disabled_built_ins = {
	"2html_plugin",
	"getscript",
	"getscriptPlugin",
	"gzip",
	"logipat",
	--"netrw",
	--"netrwPlugin",
	--"netrwSettings",
	--"netrwFileHandlers",
	"matchit",
	"tar",
	"tarPlugin",
	"rrhelper",
	"spellfile_plugin",
	"vimball",
	"vimballPlugin",
	"zip",
	"zipPlugin",
	"tutor",
	"rplugin",
	"synmenu",
	"optwin",
	"compiler",
	"bugreport",
	"ftplugin",
}

for _, plugin in pairs(disabled_built_ins) do
	g["loaded_" .. plugin] = 1
end

vim.o.sessionoptions = "blank,buffers,curdir,folds,help,tabpages,globals,winsize,winpos,terminal,localoptions"
