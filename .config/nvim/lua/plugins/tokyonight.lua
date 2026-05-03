if true then return {} end

return {
    {
        "folke/tokyonight.nvim",
        enabled = false,
        opts = {
            transparent = true,
            styles = {
                sidebars = "transparent",
                floats = "transparent",
            },
        },
    },
}