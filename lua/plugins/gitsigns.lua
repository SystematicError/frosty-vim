local function config()
    local opts = {
        signs = {
            add = { text = "│" },
            change = { text = "│" },
            delete = { text = "_" },
            topdelete = { text = "‾" },
            changedelete = { text = "_" },
            untracked = { text = "┆" },
        },

        current_line_blame_formatter = "  <author>, <author_time:%Y-%m-%d> • <summary>",
    }

    require("gitsigns").setup(opts)
end

return {
    {
        "lewis6991/gitsigns.nvim",
        config = config,
    },
}
