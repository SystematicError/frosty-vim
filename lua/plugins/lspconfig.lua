local function config()
    local servers = require("languages").servers

    local lspconfig = require "lspconfig"
    local capabilities = require("cmp_nvim_lsp").default_capabilities()

    vim.lsp.inlay_hint.enable()

    for server, settings in pairs(servers) do
        lspconfig[server].setup {
            capabilities = capabilities,
            settings = settings,

            root_dir = function()
                return vim.fn.getcwd()
            end,

            on_attach = function(client)
                client.server_capabilities.semanticTokensProvider = nil
            end,
        }
    end

    local diagnostic_signs = {
        Error = " ",
        Warn = " ",
        Hint = "󰌵 ",
        Info = " ",
    }

    for name, icon in pairs(diagnostic_signs) do
        local hl = "DiagnosticSign" .. name
        vim.fn.sign_define(hl, { text = icon, texthl = hl, numhl = hl })
    end
end

return {
    {
        "neovim/nvim-lspconfig",
        dependencies = "hrsh7th/cmp-nvim-lsp",
        config = config,
    },

    mappings = {
        n = {
            ["<leader>l"] = {
                name = "LSP",

                l = { vim.diagnostic.open_float, "Show line diagnostics" },
                h = { vim.lsp.buf.hover, "Show hover information" },
                s = { vim.lsp.buf.signature_help, "Show signature help" },
                f = { vim.lsp.buf.references, "Show references" },
                r = { vim.lsp.buf.rename, "Rename references" },

                d = { vim.lsp.buf.definition, "Go to definition" },
                D = { vim.lsp.buf.declaration, "Go to declaration" },
                t = { vim.lsp.buf.type_definition, "Go to type definition" },
                i = { vim.lsp.buf.implementation, "Go to implementation" },
            },

            ["[d"] = { vim.diagnostic.goto_prev, "Previous diagnostic" },
            ["]d"] = { vim.diagnostic.goto_next, "Next hunk diagnostic" },
        },
    },
}
