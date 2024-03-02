local function config()
    local lspconfig = require "lspconfig"
    local capabilities = require("cmp_nvim_lsp").default_capabilities()

    local servers = {
        cssls = {},
        html = {},
        jsonls = {},

        lua_ls = {
            Lua = {
                hint = { enable = true },
                format = { enable = false },
                telemetry = { enable = false },
                completion = { callSnippet = "Both" },
            },
        },

        nil_ls = {},
        rust_analyzer = {},
    }

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
}
