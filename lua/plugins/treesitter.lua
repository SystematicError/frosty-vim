-- TODO: Lazy load treesitter
-- TODO: Add more treesitter textobjects
-- TODO: Add incremental search

local default_opts = {
    -- Flake bundles parsers using `treesitterParsers`
    ensure_installed = {},
    auto_install = false,

    highlight = {
        enable = true,
        additional_vim_regex_highlighting = false,
    },

    indent = { enable = true },

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
