-- if true then return {} end

return {
    {
        "catppuccin/nvim",
        name = "catppuccin",
        opts = {
            transparent_background = true,
            flavour = "mocha", -- latte, frappe, macchiato, mocha
            auto_integrations = true,
        },
    },
    {
        "LazyVim/LazyVim",
        opts = {
            colorscheme = "catppuccin-mocha",
        },
    }

}