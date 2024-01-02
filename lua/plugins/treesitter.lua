local function config()
    local opts = {
        highlight = {
            enable = true,

            -- HACK: Ignore broken parser shipped by nixpkgs
            disable = { "vimdoc" },
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
