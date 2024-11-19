require "options"

local plugins = require "loader" {
    "aerial",
    "autopairs",
    "bufferline",
    "cmp",
    "colorizer",
    "colorscheme",
    "conform",
    "dashboard",
    "debugprint",
    "direnv",
    "dropbar",
    "feline",
    "gitsigns",
    "guess-indent",
    "indent-blankline",
    "lspconfig",
    "luasnip",
    "neogit",
    "neo-tree",
    "notify",
    "surround",
    "telescope",
    "treesitter",
    "web-devicons",
    "which-key",
}

require("lazy").setup(plugins, {
    defaults = {
        -- lazy = true
    },

    install = {
        colorscheme = { "catppuccin" },
    },
})
