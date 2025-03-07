local function config()
    local opts = {
        integrations = {
            diffview = true,
        },
    }

    require("neogit").setup(opts)
end

return {
    "NeogitOrg/neogit",
    dependencies = {
        "nvim-lua/plenary.nvim",
        "sindrets/diffview.nvim", -- TODO: Diffview configuration
    },

    cmd = "Neogit",
    keys = {
        { "<leader>gg", "<cmd>Neogit<cr>", desc = "Neogit" },
    },

    config = config,
}
