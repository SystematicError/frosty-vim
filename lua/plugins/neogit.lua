local function config()
    local opts = {
        integrations = {
            telescope = true,
            diffview = true,
        },
    }

    require("neogit").setup(opts)
end

return {
    {
        "NeogitOrg/neogit",
        dependencies = {
            "nvim-lua/plenary.nvim",
            "sindrets/diffview.nvim",
            "nvim-telescope/telescope.nvim",
        },
        config = config,
    },
}
