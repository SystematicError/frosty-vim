local function config()
    local opts = {
        -- HACK: Prevents treesitter complaining about readonly nix store
        -- Use flake to install treesitter parsers instead
        ensure_installed = {},

        highlight = {
            enable = true,

            -- HACK: Ignore broken parser shipped by nixpkgs
            disable = { "vimdoc" },
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
