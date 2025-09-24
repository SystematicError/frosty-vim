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

local function config(_, opts)
    vim.o.foldmethod = "expr"
    vim.o.foldexpr = "v:lua.vim.treesitter.foldexpr()"

    require("nvim-treesitter.configs").setup(opts)
end

return {
    "nvim-treesitter/nvim-treesitter",
    dependencies = "nvim-treesitter/nvim-treesitter-textobjects",

    lazy = false,

    opts = default_opts,
    config = config,

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
