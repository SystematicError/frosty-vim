local function config()
    local opts = {
        ensure_installed = {},

        highlight = {
            enable = true,
            additional_vim_regex_highlighting = false,
        },

        indent = {
            enable = true,
        },
    }

    require("nvim-treesitter.configs").setup(opts)
end

return {
    {
        "nvim-treesitter/nvim-treesitter",
        config = config,
    },

    colorscheme_integrations = {
        treesitter = true,
    },
}
