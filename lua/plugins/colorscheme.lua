local function config()
    local opts = {
        flavour = "mocha",

        integrations = {
            gitsigns = true,
            neogit = true,
            indent_blankline = true,
            neotree = true,
            notify = true,
            cmp = true,
            treesitter = true,
            telescope = true,
            which_key = true,
        },

        color_overrides = {
            mocha = {
                base = "#0f0f0f",
                mantle = "#151515",
                crust = "#202020",
                text = "#dddddd",
                subtext1 = "#c8c8c8",
                subtext0 = "#b3b3b3",
                overlay2 = "#9f9f9f",
                overlay1 = "#8a8a8a",
                overlay0 = "#767676",
                surface2 = "#616161",
                surface1 = "#4c4c4c",
                surface0 = "#373737",
                rosewater = "#edcbcb",
                flamingo = "#e8c4b4",
                pink = "#f9b3c0",
                mauve = "#8d8bc4",
                red = "#fc4e5e",
                maroon = "#f76271",
                peach = "#ffaf60",
                yellow = "#f6cd7e",
                green = "#bbef6e",
                teal = "#96e0c9",
                sky = "#b8e5ec",
                sapphire = "#75beef",
                blue = "#5baaea",
                lavender = "#bdace0",
            },
        },

        custom_highlights = function(colors)
            return {
                Search = { bg = colors.surface0, style = { "bold" } },
                CurSearch = { fg = colors.text, bg = colors.base, style = { "bold", "underline" } },
                IncSearch = { link = "CurSearch" },

                CmpItemAbbrMatch = { fg = colors.blue },
                CmpItemAbbrMatchFuzzy = { link = "CmpItemAbbrMatch" },
                CmpItemMenu = { fg = colors.overlay2, style = { "italic" } },
                CmpBorder = { fg = colors.surface0 },

                NeoTreeWinSeparator = { fg = colors.mantle, bg = colors.mantle },
                NeoTreeCursorLine = { bg = colors.mantle },
                NeoTreeIndentMarker = { fg = colors.surface0 },

                TelescopeSelection = { bg = colors.crust },
                TelescopePromptNormal = { bg = colors.crust },
                TelescopePromptBorder = { fg = colors.crust, bg = colors.crust },
                TelescopePromptTitle = { fg = colors.crust, bg = colors.blue, style = { "bold" } },
                TelescopePromptPrefix = { fg = colors.overlay0 },
                TelescopePreviewNormal = { bg = colors.mantle },
                TelescopePreviewBorder = { fg = colors.mantle, bg = colors.mantle },
                TelescopePreviewTitle = { fg = colors.mantle },
                TelescopeResultsNormal = { bg = colors.mantle },
                TelescopeResultsBorder = { fg = colors.mantle, bg = colors.mantle },
                TelescopeResultsTitle = { fg = colors.mantle },
            }
        end,
    }

    require("catppuccin").setup(opts)
    vim.cmd.colorscheme "catppuccin"
end

return {
    {
        "catppuccin/nvim",
        name = "catppuccin",
        priority = 9999,
        config = config,
    },
}
