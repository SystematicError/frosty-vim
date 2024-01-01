local config = {
    flavour = "mocha",
    integrations = {
        -- bufferline
        -- feline
        gitsigns = true,
        indent_blankline = true,
        neotree = true,
        cmp = true,
        -- native_lsp
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
