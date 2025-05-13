-- TODO: Migrate to new lsp config function on nvim 0.11

local function config()
    local lspconfig = require "lspconfig"
    local capabilities = require("blink.cmp").get_lsp_capabilities()

    local servers = require("languages").lsp
    local diagnostic_icons = require("icons").diagnostics

    vim.g.enable_codelens = true

    for server, settings in pairs(servers) do
        lspconfig[server].setup {
            settings = settings,
            capabilities = capabilities,

            on_attach = function(client, buffer)
                if client.supports_method "textDocument/codeLens" then
                    vim.api.nvim_create_autocmd({ "BufEnter", "CursorHold", "InsertLeave" }, {
                        group = vim.api.nvim_create_augroup("frosty_codelens_refresh", { clear = true }),
                        desc = "Refresh buffer codelenses",
                        buffer = buffer,
                        callback = function()
                            if vim.g.enable_codelens then
                                vim.lsp.codelens.refresh()
                            end
                        end,
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

    if Snacks then
        Snacks.toggle.diagnostics({ name = "Diagnostics (Global)" }):map "<leader>uld"
        Snacks.toggle({
            name = "Diagnostics (Buffer)",
            get = function()
                return vim.diagnostic.is_enabled { bufnr = 0 }
            end,
            set = function(state)
                vim.diagnostic.enable(state, { bufnr = 0 })
            end,
        }):map "<leader>ulD"

        Snacks.toggle({
            name = "Inlay Hints",
            get = function()
                return vim.lsp.inlay_hint.is_enabled()
            end,
            set = function(state)
                vim.lsp.inlay_hint.enable(state)
            end,
        }):map "<leader>ulh"

        Snacks.toggle({
            name = "Codelens",
            get = function()
                return vim.g.enable_codelens
            end,
            set = function(state)
                if not state then
                    vim.lsp.codelens.clear()
                end
                vim.g.enable_codelens = state
            end,
        }):map "<leader>ulc"
    end
end

return {
    "neovim/nvim-lspconfig",
    dependencies = "Saghen/blink.cmp",

    lazy = false,
    keys = {
        { "<leader>lh", vim.lsp.buf.hover, desc = "Hover" },
        { "<leader>ls", vim.lsp.buf.signature_help, desc = "Signature help" },
        { "<leader>ld", vim.diagnostic.open_float, desc = "Diagnostics" },
        { "<leader>lr", vim.lsp.buf.rename, desc = "Rename reference" },

        { "<leader>lc", vim.lsp.buf.code_action, desc = "Code action" },
        { "<leader>lC", vim.lsp.codelens.run, desc = "Run codelens" },

        { "<leader>ljd", vim.lsp.buf.definition, desc = "Definition" },
        { "<leader>lji", vim.lsp.buf.implementation, desc = "Implementation" },
        { "<leader>ljt", vim.lsp.buf.type_definition, desc = "Type definition" },
        { "<leader>ljD", vim.lsp.buf.declaration, desc = "Declaration" },
    },

    config = config,
}
