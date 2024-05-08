return function(colors)
    return {
        Search = { bg = colors.surface0, style = { "bold" } },
        CurSearch = { fg = colors.text, bg = colors.base, style = { "bold", "underline" } },
        IncSearch = { link = "CurSearch" },
    }
end
