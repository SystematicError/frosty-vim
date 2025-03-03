local lsp = {
    pylsp = {
        plugins = {
            ruff = { enabled = true },
        },
    },
}

return {
    lsp = { pylsp = lsp },
}
