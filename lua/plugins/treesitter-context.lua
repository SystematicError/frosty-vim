-- TODO: Lazy load treesitter context

local default_opts = {
    max_lines = 2,
    trim_scope = "inner",
    mode = "topline",
}

return {
    "nvim-treesitter/nvim-treesitter-context",

    lazy = false,

    opts = default_opts,

    specs = {
        "catppuccin/nvim",
        optional = true,
        opts = {
            integrations = {
                treesitter_context = true,
            },
        },
    },
}
