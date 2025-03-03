local lsp = {
    Lua = {
        format = { enable = false },
        hint = { enable = true },
        codeLens = { enable = true },
        telemetry = { enable = false },
        completion = { callSnippet = "Both" },
    },
}

local formatter = { "stylua" }

return {
    lsp = { lua_ls = lsp },
    formatter = { lua = formatter },
}
