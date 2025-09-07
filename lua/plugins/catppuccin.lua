local default_opts = {
    flavour = "mocha",

    -- TODO Make a prettier colorscheme (https://catbbrew.com/)
    color_overrides = {
        mocha = {
            rosewater = "#f5e0dc",
            flamingo = "#f2cdcd",
            pink = "#f5c2e7",
            mauve = "#cba6f7",
            red = "#f38ba8",
            maroon = "#eba0ac",
            peach = "#fab387",
            yellow = "#f9e2af",
            green = "#a6e3a1",
            teal = "#94e2d5",
            sky = "#89dceb",
            sapphire = "#74c7ec",
            blue = "#89b4fa",
            lavender = "#b4befe",
            text = "#cbd7f4",
            subtext1 = "#b8c3de",
            subtext0 = "#a3aec8",
            overlay2 = "#909ab2",
            overlay1 = "#7c859c",
            overlay0 = "#697186",
            surface2 = "#545c70",
            surface1 = "#41485a",
            surface0 = "#2d3344",
            base = "#1a1f2e",
            mantle = "#151925",
            crust = "#0e121b",
        },
    },

    default_integrations = false,
    integrations = {
        markdown = true,
        semantic_tokens = true,

        native_lsp = {
            enabled = true,

            virtual_text = {},

            underlines = {
                errors = { "undercurl" },
                hints = { "undercurl" },
                warnings = { "undercurl" },
                information = { "undercurl" },
                ok = { "undercurl" },
            },

            inlay_hints = {
                background = true,
            },
        },
    },
}

local function config(_, opts)
    require("catppuccin").setup(opts)
    vim.cmd.colorscheme "catppuccin"
end

local function bufferline_opts(_, opts)
    opts.highlights = require("catppuccin.groups.integrations.bufferline").get_theme()
end

return {
    "catppuccin/nvim",
    name = "catppuccin",

    priority = 1000,
    lazy = false,

    opts = default_opts,
    config = config,

    specs = {
        "akinsho/bufferline.nvim",
        optional = true,
        opts = bufferline_opts,
    },
}
