return {
  "nvim-telescope/telescope.nvim",
  branch = "0.1.x",
  dependencies = {
    "nvim-lua/plenary.nvim",
    { "nvim-telescope/telescope-fzf-native.nvim", build = "make" },
    "nvim-tree/nvim-web-devicons",
  },
  config = function()
    local telescope = require("telescope")
    local actions = require("telescope.actions")
    --local trouble = require("trouble.providers.telescope")

    telescope.setup({
      defaults = {
        path_display = { "smart" },
        mappings = {
		  --n = { ["<c-t>"] = trouble.open_with_trouble },
          i = {
            ["<C-k>"] = actions.move_selection_previous, -- move to prev result
            ["<C-j>"] = actions.move_selection_next, -- move to next result
			--["<c-t>"] = trouble.open_with_trouble,
          },
        },
      },
    })

    telescope.load_extension("fzf")
    --telescope.load_extension("possession")
  end,
}
