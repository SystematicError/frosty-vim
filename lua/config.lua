FROSTY_CONFIG = {
    mappings = {
        n = {
            ["<c-u>"] = { "<c-u>zz", "Scroll up" },
            ["<c-d>"] = { "<c-d>zz", "Scroll down" },
        },

        v = {
            ["<c-u>"] = { "<c-u>zz", "Scroll up" },
            ["<c-d>"] = { "<c-d>zz", "Scroll down" },
        },
    },

    colorscheme_integrations = {},

    highlights = function(colors)
        return {
            Search = { bg = colors.surface0, style = { "bold" } },
            CurSearch = { fg = colors.text, bg = colors.base, style = { "bold", "underline" } },
            IncSearch = { link = "CurSearch" },
        }
    end,
}
