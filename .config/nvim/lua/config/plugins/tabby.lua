local function tab_name(tab)
	return string.gsub(tab, "%[..%]", "")
end

local function tab_modified(tab)
	local wins = require("tabby.module.api").get_tab_wins(tab)
	for _, x in pairs(wins) do
		if vim.bo[vim.api.nvim_win_get_buf(x)].modified then
			return ""
		end
	end
	return ""
end

local function lsp_diag(buf)
	local diagnostics = vim.diagnostic.get(buf)
	local count = { 0, 0, 0, 0 }

	for _, diagnostic in ipairs(diagnostics) do
		count[diagnostic.severity] = count[diagnostic.severity] + 1
	end
	if count[1] > 0 then
		return vim.bo[buf].modified and "" or ""
	elseif count[2] > 0 then
		return vim.bo[buf].modified and "" or ""
	elseif count[3] > 0 then
		return vim.bo[buf].modified and "" or ""
	end
	return vim.bo[buf].modified and "" or ""
end

local function buffer_name(buf)
	if string.find(buf, "NvimTree") then
		return "NvimTree"
	end
	if string.find(buf, "neo-tree") then
		return "NeoTree"
	end
	return buf
end

local colors = require("config.core.colors").onedark_dark

local theme = {
	fill = { bg = colors.bg },
	-- Also you can do this: fill = { fg='#f2e9de', bg='#907aa9', style='italic' }
	head = { fg = colors.bg, bg = colors.cyan },
	current_tab = { fg = colors.bg, bg = colors.green },
	tab = { fg = colors.green, bg = colors.bg2 },
	win = { fg = colors.cyan, bg = colors.bg2 },
	current_win = { fg = colors.bg, bg = colors.cyan },
	tail = { fg = colors.cyan, bg = colors.bg },
}

return {
	"nanozuki/tabby.nvim",
	event = "VimEnter",
	dependencies = "nvim-tree/nvim-web-devicons",
	config = function()
		local tabby = require("tabby.tabline")
		tabby.set(function(line)
			return {
				{
					{ "     ", hl = theme.head },
					line.sep("", theme.head, theme.fill),
				},
				line.tabs().foreach(function(tab)
					local hl = tab.is_current() and theme.current_tab or theme.tab
					return {
						line.sep("", hl, theme.fill),
						-- tab.number(),
						-- " ",
						tab_name(tab.name()),
						-- " ",
						tab_modified(tab.id),
						line.sep("", hl, theme.fill),
						hl = hl,
						margin = " ",
					}
				end),
				line.spacer(),
				line.wins_in_tab(line.api.get_current_tab()).foreach(function(win)
					if string.match(win.buf_name(), "NvimTree") then
						return nil
					end
					local hl = win.is_current() and theme.current_win or theme.win
					return {
						line.sep("", hl, theme.fill),
						-- win.file_icon(),
						-- " ",
						buffer_name(win.buf_name()),
						-- " ",
						lsp_diag(win.buf().id),
						line.sep("", hl, theme.fill),
						hl = hl,
						margin = " ",
					}
				end),
				{
					line.sep("", theme.tail, theme.fill),
					{ "  ", hl = theme.tail },
				},
				hl = theme.fill,
			}
		end)
	end,
}
