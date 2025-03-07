local function config()
    local lspconfig = require "lspconfig"
    local capabilities = require("blink.cmp").get_lsp_capabilities()

    local servers = require("languages").lsp
    local diagnostic_icons = require("icons").diagnostics

    for server, settings in pairs(servers) do
        lspconfig[server].setup {
            settings = settings,
            capabilities = capabilities,

            on_attach = function(client, buffer)
                if client.supports_method "textDocument/codeLens" then
                    vim.lsp.codelens.refresh()

                    vim.api.nvim_create_autocmd({ "BufEnter", "CursorHold", "InsertLeave" }, {
                        buffer = buffer,
                        callback = vim.lsp.codelens.refresh,
                    })
                end
            end,
        }
    end

    for name, icon in pairs(diagnostic_icons) do
        local hl = "DiagnosticSign" .. name
        vim.fn.sign_define(hl, { text = icon, texthl = hl, numhl = hl })
    end

    vim.lsp.inlay_hint.enable()
end

return {
    "neovim/nvim-lspconfig",
    dependencies = "Saghen/blink.cmp",
    lazy = false,
    config = config,
}
