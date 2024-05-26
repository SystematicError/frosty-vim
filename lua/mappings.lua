local mappings = {}

mappings.n = {
    ["<c-u>"] = { "<c-u>zz", "Scroll up" },
    ["<c-d>"] = { "<c-d>zz", "Scroll down" },

    ["<c-h>"] = { "<c-w>h", "Move to left split" },
    ["<c-j>"] = { "<c-w>j", "Move to below split" },
    ["<c-k>"] = { "<c-w>k", "Move to above split" },
    ["<c-l>"] = { "<c-w>l", "Move to right split" },
}

mappings.v = {
    ["<c-u>"] = { "<c-u>zz", "Scroll up" },
    ["<c-d>"] = { "<c-d>zz", "Scroll down" },
}

return mappings
