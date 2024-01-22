local function config()
    local opts = {
        -- HACK: Prevents treesitter complaining about readonly nix store
        -- Use flake to install treesitter parsers instead
        ensure_installed = {},

        highlight = {
            enable = true,
        },

        indent = {
            enable = true,
        },
    }

    require("nvim-treesitter.configs").setup(opts)
end

return {
    {
        "nvim-treesitter/nvim-treesitter",
        config = config,
    },
}
