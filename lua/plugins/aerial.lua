local function config()
    local opts = {
        filter_kind = false,
    }

    require("aerial").setup(opts)
end

return {
    {
        "stevearc/aerial.nvim",
        dependencies = {
            "nvim-treesitter/nvim-treesitter",
            "nvim-tree/nvim-web-devicons",
        },
        config = config,
    },

    colorscheme_integrations = {
        aerial = true,
    },
}
