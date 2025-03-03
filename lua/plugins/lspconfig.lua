local function config()
    local lspconfig = require "lspconfig"
    local capabilities = require("blink.cmp").get_lsp_capabilities()

    local servers = require("languages").lsp
    local diagnostic_icons = require("icons").diagnostics

    for server, settings in pairs(servers) do
        lspconfig[server].setup {
            capabilities = capabilities,
            settings = settings,
        }
    end

    for name, icon in pairs(diagnostic_icons) do
        local hl = "DiagnosticSign" .. name
        vim.fn.sign_define(hl, { text = icon, texthl = hl, numhl = hl })
    end

    vim.lsp.inlay_hint.enable() -- TODO: is there a better way to do this?

    -- TODO: add codelens support
end

return {
    "neovim/nvim-lspconfig",
    dependencies = "Saghen/blink.cmp",
    lazy = false,
    config = config,
}
