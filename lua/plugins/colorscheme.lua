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
}

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
