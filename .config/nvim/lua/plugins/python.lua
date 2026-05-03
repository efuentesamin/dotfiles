return {
    -- Make sure to import the python extra first
    { import = "lazyvim.plugins.extras.lang.python" },

    -- Configure lspconfig to set up ty
    {
        "neovim/nvim-lspconfig",
        opts = {
            servers = {
                -- ty will be automatically installed with mason and loaded with lspconfig
                ty = {},
            },
            setup = {
                -- Ensure ruff doesn't provide hover (let ty handle that)
                ruff = function()
                    require("snacks").util.lsp.on({ name = "ruff" }, function(_, client)
                        client.server_capabilities.hoverProvider = false
                    end)
                end,
            },
        }
    },
}
