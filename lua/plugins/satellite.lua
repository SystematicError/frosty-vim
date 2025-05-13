-- TODO: Lazy load satellite

local git_icons = require("icons").git_gutter

local default_opts = {
    current_only = true,

    excluded_filetypes = {
        "gitsigns-blame",
        "neo-tree",
        "snacks_dashboard",
    },

    handlers = {
        gitsigns = {
            signs = git_icons,
        },
    },
}

return {
    "lewis6991/satellite.nvim",
    lazy = false,
    opts = default_opts,
}
