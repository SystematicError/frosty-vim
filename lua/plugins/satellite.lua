local function config()
    local git_icons = require("icons").git_gutter

    local opts = {
        current_only = true,

        excluded_filetypes = {
            "snacks_dashboard",
            "neo-tree",
        },

        handlers = {
            gitsigns = {
                signs = git_icons,
            },
        },
    }

    require("satellite").setup(opts)
end

return {
    "lewis6991/satellite.nvim",
    lazy = false,
    config = config,
}
