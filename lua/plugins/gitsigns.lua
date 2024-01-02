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
    }

    require("gitsigns").setup(opts)
end

return {
    {
        "lewis6991/gitsigns.nvim",
        config = config,
    },
}
