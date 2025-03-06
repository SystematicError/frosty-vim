local function config()
    local opts = {}

    require("lualine").setup(opts)
end

return {
    "nvim-lualine/lualine.nvim",
    dependencies = "nvim-tree/nvim-web-devicons",
    lazy = false,
    config = config,
}
