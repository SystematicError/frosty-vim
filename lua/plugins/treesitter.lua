-- TODO: Lazy load treesitter
-- TODO: Add more treesitter textobjects

local default_opts = {
    -- Flake bundles parsers using `treesitterParsers`
    ensure_installed = {},
    auto_install = false,

    highlight = {
        enable = true,
        additional_vim_regex_highlighting = false,
    },

    indent = { enable = true },

    incremental_selection = {
        enable = true,

        keymaps = {
            init_selection = "<c-space>",
            node_incremental = "<c-space>",
            scope_incremental = "<c-s-space>",
            node_decremental = "<bs>",
        },
    },

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

return {
    "nvim-treesitter/nvim-treesitter",
    dependencies = "nvim-treesitter/nvim-treesitter-textobjects",
    main = "nvim-treesitter.configs",

    lazy = false,

    opts = default_opts,

    specs = {
        "catppuccin/nvim",
        optional = true,
        opts = {
            integrations = {
                treesitter = true,
            },
        },
    },
}
