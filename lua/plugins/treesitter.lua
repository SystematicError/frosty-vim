return {
    {
        "nvim-treesitter/nvim-treesitter",
        main = "nvim-treesitter.configs",
        opts = {
            -- TODO: Add parsers flakeside rather than luaside
            ensure_installed = {"lua", "nix"},
            auto_install = true,

            highlight = {
                enable = true
            }
        }
    }
}
