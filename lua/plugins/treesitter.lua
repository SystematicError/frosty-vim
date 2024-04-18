local function config()
    local opts = {
        ensure_installed = {},

        highlight = { enable = true },
        indent = { enable = true },
    }

    require("nvim-treesitter.configs").setup(opts)
end

return {
    {
        "nvim-treesitter/nvim-treesitter",
        config = config,
    },
}
