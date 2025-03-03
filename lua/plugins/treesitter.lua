local function config()
    local opts = {
        -- Flake bundles parsers using `treesitterParsers`
        ensure_installed = {},
        auto_install = false,

        highlight = {
            enable = true,
            additional_vim_regex_highlighting = false,
        },

        indent = {
            enable = true,
        },

        -- TODO: more indepth config
        textobjects = {
            select = {
                enable = true,

                keymaps = {
                    ["af"] = { query = "@function.outer", desc = "function" },
                    ["if"] = { query = "@function.inner", desc = "inner function" },
                    ["ac"] = { query = "@class.outer", desc = "class" },
                    ["ic"] = { query = "@class.inner", desc = "inner class" },
                },
            },
        },
    }

    require("nvim-treesitter.configs").setup(opts)
end

return {
    "nvim-treesitter/nvim-treesitter",
    dependencies = "nvim-treesitter/nvim-treesitter-textobjects",
    lazy = false,
    config = config,
}
