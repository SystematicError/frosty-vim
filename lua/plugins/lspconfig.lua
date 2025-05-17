-- TODO: Lazy load lspconfig
-- TODO: Modularise snacks integration

local default_opts = {
    servers = {},

    diagnostics = {
        underline = true,
        update_in_insert = false,
        virtual_text = true,
        severity_sort = true,
        signs = true,
    },

    inlay_hints = true,
    codelens = true,
}

local function config(_, opts)
    local diagnostic_icons = require("icons").diagnostics

    -- Server setup
    for server, server_opts in pairs(opts.servers) do
        vim.lsp.config(server, server_opts)
        vim.lsp.enable(server)
    end

    -- Diagnostics
    vim.diagnostic.config(opts.diagnostics)

    for name, icon in pairs(diagnostic_icons) do
        local hl = "DiagnosticSign" .. name
        vim.fn.sign_define(hl, { text = icon, texthl = hl, numhl = hl })
    end

    -- Inlay hints
    vim.lsp.inlay_hint.enable(opts.inlay_hints)

    -- Codelens
    vim.g.enable_codelens = opts.codelens or true

    -- TODO: Perhaps make this a global autocmd
    vim.lsp.config("*", {
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
    })

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

    opts = default_opts,
    config = config,
}
