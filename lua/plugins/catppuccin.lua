local function config()
    local opts = {
        flavour = "mocha",

        default_integrations = false,
        integrations = {
            blink_cmp = true,
            diffview = true,
            gitsigns = true,
            markdown = true,
            native_lsp = { enabled = true, virtual_text = {}, underlines = {}, inlay_hints = {} },
            neogit = true,
            neotree = true,
            semantic_tokens = true,
            snacks = { enabled = true },
            treesitter = true,
            which_key = true,
        },
    }

    require("catppuccin").setup(opts)
    vim.cmd.colorscheme "catppuccin"
end

return {
    "catppuccin/nvim",
    priority = 1000,
    lazy = false,
    config = config,
}
