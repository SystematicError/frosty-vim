require "options"
require "autocmds"
require "keymaps"
require "gui"

local plugins = require "loader" {
    "autopairs",
    "blink",
    "bufferline",
    "catppuccin",
    "colorizer",
    "conform",
    "gitsigns",
    "guess-indent",
    "lspconfig",
    "lualine",
    "markview",
    "neo-tree",
    "neogit",
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
