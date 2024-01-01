return {
    {
        "nvim-treesitter/nvim-treesitter",
        main = "nvim-treesitter.configs",
        opts = {
            highlight = {
                enable = true,

                -- HACK: Ignore broken parser shipped by nixpkgs
                disable = {"vimdoc"}
            }
        }
    }
}
