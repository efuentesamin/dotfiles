return {
    'freddiehaddad/feline.nvim',
    opts = {},
    config = function(_, opts)
local fmt = string.format
local colors = require("config.core.colors").onedark_dark

local vi_mode_colors = {
	NORMAL = colors.green,
	INSERT = colors.yellow,
	VISUAL = colors.orange,
	OP = colors.cyan,
	BLOCK = colors.orange,
	REPLACE = colors.red,
	["V-REPLACE"] = colors.red,
	ENTER = colors.orange,
	MORE = colors.orange,
	SELECT = colors.yellow,
	COMMAND = colors.pink,
	SHELL = colors.pink,
	TERM = colors.pink,
	NONE = colors.yellow,
}

-- Providers (LSP, vi_mode)
local lsp = require("feline.providers.lsp")
local vi_mode_utils = require("feline.providers.vi_mode")

-- LSP diagnostic
local lsp_get_diag = function(str)
	local count = vim.lsp.diagnostic.get_count(0, str)
	return (count > 0) and " " .. count .. " " or ""
end

local separator = ""

local comps = {
	-- vi_mode -> NORMAL, INSERT..
	vi_mode = {
		left = {
			provider = function()
				local label = " " .. vi_mode_utils.get_vim_mode() .. " "
				return label
			end,
			hl = function()
				local set_color = {
					name = vi_mode_utils.get_mode_highlight_name(),
					fg = colors.bg,
					bg = vi_mode_utils.get_mode_color(),
					style = "bold",
				}
				return set_color
			end,
			left_sep = "left_rounded",
			right_sep = " ",
		},
	},
	-- Parse file information:
	file = {
		-- File name
		info = {
			provider = {
				name = "file_info",
				opts = {
					type = "relative",
					file_modified_icon = "",
				},
			},
			hl = { fg = colors.cyan, bg = colors.bg2 },
			icon = "",
			right_sep = "right_rounded",
		},
		-- File type
		type = {
			provider = function()
				local type = vim.bo.filetype:lower()
				local extension = vim.fn.expand("%:e")
				local icon = require("nvim-web-devicons").get_icon(extension)
				if icon == nil then
					icon = ""
				end
				return " " .. icon .. " " .. type .. " "
			end,
			hl = { fg = colors.cyan, bg = colors.bg2 },
			left_sep = "left_rounded",
			right_sep = {
				str = "left_filled",
				hl = function()
					local set_color = {
						fg = colors.bg,
						bg = colors.bg2,
					}
					return set_color
				end,
			},
		},
		-- Operating System
		os = {
			provider = function()
				local os = vim.bo.fileformat:lower()
				local icon
				if os == "unix" then
					icon = " "
				elseif os == "mac" then
					icon = " "
				else
					icon = " "
				end
				--return icon .. os
				return icon
			end,
			hl = { fg = colors.fg },
			left_sep = {
				str = " " .. separator,
				hl = { fg = colors.fg },
			},
			right_sep = {
				str = "left_filled",
				hl = function()
					local set_color = {
						fg = colors.bg2,
					}
					return set_color
				end,
			},
		},
		-- File encoding
		encoding = {
			provider = { name = "file_encoding" },
			hl = { fg = colors.fg },
			left_sep = " ",
		},
		-- Line-column
		position = {
			provider = function()
				-- TODO: What about 4+ diget line numbers?
				return fmt(" %3d:%-2d ", unpack(vim.api.nvim_win_get_cursor(0)))
			end,
			hl = {
				fg = colors.fg,
				style = "bold",
				bg = colors.bg2,
			},
			right_sep = {
				str = "left_filled",
				hl = function()
					local set_color = {
						fg = vi_mode_utils.get_mode_color(),
						bg = colors.bg2,
					}
					return set_color
				end,
			},
		},
		-- Cursor position in %
		line_percentage = {
			provider = { name = "line_percentage" },
			-- provider = function()
			-- 	return " " .. require("feline.providers.cursor").line_percentage() .. " "
			-- end,
			hl = function()
				local set_color = {
					fg = colors.bg,
					bg = vi_mode_utils.get_mode_color(),
					style = "bold",
				}
				return set_color
			end,
			left_sep = {
                str = " ",
                hl = function()
				    local set_color = {
					    fg = colors.bg,
					    bg = vi_mode_utils.get_mode_color(),
				    }
				    return set_color
			    end,

            },
			right_sep = "right_rounded",
		},
		-- Simple scrollbar
		scroll_bar = {
			provider = { name = "scroll_bar" },
			hl = { fg = colors.fg },
			left_sep = " ",
			right_sep = " ",
		},
	},
	-- LSP info
	diagnos = {
		err = {
			provider = "diagnostic_errors",
			icon = " ",
			hl = { fg = colors.red },
			left_sep = "  ",
		},
		warn = {
			provider = "diagnostic_warnings",
			icon = " ",
			hl = { fg = colors.yellow },
			left_sep = " ",
		},
		info = {
			provider = "diagnostic_info",
			icon = " ",
			hl = { fg = colors.green },
			left_sep = " ",
		},
		hint = {
			provider = "diagnostic_hints",
			icon = " ",
			hl = { fg = colors.cyan },
			left_sep = " ",
		},
	},
	lsp = {
		name = {
			provider = "lsp_client_names",
			icon = "  ",
			hl = { fg = colors.pink },
			left_sep = "  ",
			right_sep = " ",
		},
	},
	-- git info
	git = {
		branch = {
			provider = "git_branch",
			icon = " ",
			hl = { fg = colors.pink },
			left_sep = "  ",
		},
		add = {
			provider = "git_diff_added",
			icon = "  ",
			hl = { fg = colors.green },
			left_sep = " ",
		},
		change = {
			provider = "git_diff_changed",
			icon = "  ",
			hl = { fg = colors.orange },
			left_sep = " ",
		},
		remove = {
			provider = "git_diff_removed",
			icon = "  ",
			hl = { fg = colors.red },
			left_sep = " ",
		},
	},
}

local components = {
	active = {},
	inactive = {},
}

table.insert(components.active, {})
table.insert(components.active, {})
table.insert(components.inactive, {})
table.insert(components.inactive, {})

-- Right section
table.insert(components.active[1], comps.vi_mode.left)
table.insert(components.active[1], comps.file.info)
table.insert(components.active[1], comps.git.branch)
table.insert(components.active[1], comps.git.add)
table.insert(components.active[1], comps.git.change)
table.insert(components.active[1], comps.git.remove)
table.insert(components.inactive[1], comps.file.info)

-- Left Section
table.insert(components.active[2], comps.diagnos.err)
table.insert(components.active[2], comps.diagnos.warn)
table.insert(components.active[2], comps.diagnos.hint)
table.insert(components.active[2], comps.diagnos.info)
table.insert(components.active[2], comps.lsp.name)
table.insert(components.active[2], comps.file.type)
table.insert(components.active[2], comps.file.encoding)
table.insert(components.active[2], comps.file.os)
table.insert(components.active[2], comps.file.position)
table.insert(components.active[2], comps.file.line_percentage)

        require('feline').setup({
	        theme = {
		        bg = colors.bg,
		        fg = colors.fg,
	        },
	        components = components,
	        vi_mode_colors = vi_mode_colors,
	        force_inactive = {
		        filetypes = {
			        "^NvimTree$",
			        "^neo-tree$",
			        "^packer$",
			        "^vista$",
			        "^help$",
		        },
		        buftypes = {
			        "^terminal$",
		        },
		        bufnames = {},
	        },
        })
        require('feline').winbar.setup()       -- to use winbar
        --require('feline').statuscolumn.setup() -- to use statuscolumn
        --require('feline').use_theme()          -- to use a custom theme
    end
}
