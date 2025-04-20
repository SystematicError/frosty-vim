require "options"
require "autocmds"
require "keymaps"
require "gui"

local plugins = require "loader" {
    "autopairs",
    "blink",
    "bufferline",
    "catppuccin",
    "conform",
    "gitsigns",
    "guess-indent",
    "highlight-colors",
    "lightbulb",
    "lspconfig",
    "lualine",
    "markview",
    "neo-tree",
    "neogit",
    "persistence",
    "satellite",
    "snacks",
    "treesitter",
    "which-key",
}

require("lazy").setup(plugins, {
    defaults = {
        lazy = true,
    },

    install = {
        colorscheme = { "catppuccin" },
    },
})
