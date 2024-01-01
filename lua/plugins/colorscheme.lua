local config = {
    flavour = "mocha",

    integrations = {
        gitsigns = true,
        indent_blankline = true,
        neotree = true,
        cmp = true,
        treesitter = true,
        telescope = true,
    },

    color_overrides = {
        mocha = {
            base = "#0f0f0f",
            mantle = "#151515",
            crust = "#202020",
            text = "#dddddd",
            subtext1 = "#c8c8c8",
            subtext0 = "#b3b3b3",
            overlay2 = "#9f9f9f",
            overlay1 = "#8a8a8a",
            overlay0 = "#767676",
            surface2 = "#616161",
            surface1 = "#4c4c4c",
            surface0 = "#373737",
        },
    },
}

--[[
    rosewater = "#f5e0dc"
    flamingo = "#f2cdcd"
    pink = "#f5c2e7"
    mauve = "#cba6f7"
    red = "#f38ba8"
    maroon = "#eba0ac"
    peach = "#fab387"
    yellow = "#f9e2af"
    green = "#a6e3a1"
    teal = "#94e2d5"
    sky = "#89dceb"
    sapphire = "#74c7ec"
    blue = "#89b4fa"
    lavender = "#b4befe"
]]
--

return {
    {
        "catppuccin/nvim",
        name = "catppuccin",
        config = function()
            require("catppuccin").setup(config)
            vim.cmd.colorscheme "catppuccin"
        end,
    },
}
