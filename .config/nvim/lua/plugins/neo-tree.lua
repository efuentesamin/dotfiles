return {
    { import = "lazyvim.plugins.extras.editor.neo-tree" },

    {
        "nvim-neo-tree/neo-tree.nvim",
        keys = {
            { "<leader>e", "<cmd>Neotree filesystem reveal float<cr>", desc = "Explorer NeoTree (Root Dir)" },
        },
        opts = {
            default_component_configs = {
                indent = {
                    indent_size = 4,
                }
            }
        }
    }
}