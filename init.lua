require "config"
require "options"

local plugins = require "loader" {
    "colorscheme",
    "dashboard",
    "neo-tree",
    "web-devicons",
    "bufferline",
    "feline",
    "notify",
    "gitsigns",
    "neogit",
    "colorizer",
    "treesitter",
    "cmp",
    "lspconfig",
    "luasnip",
    "conform",
    "debugprint",
    "telescope",
    "image",
    "which-key",
    "indent-blankline",
    "guess-indent",
    "direnv",
    "comment",
    "surround",
    "autopairs",
}

require("lazy").setup(plugins, {
    defaults = {
        -- lazy = true
    },

    install = {
        colorscheme = { "catppuccin" },
    },
})
