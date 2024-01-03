local function config()
    local lspconfig = require "lspconfig"
    local capabilities = require("cmp_nvim_lsp").default_capabilities()

    local servers = {
        lua_ls = {},
        nil_ls = {},
    }

    for server, options in pairs(servers) do
        options.capabilities = capabilities

        options.root_dir = function()
            return vim.fn.getcwd()
        end

        options.on_attach = function(client)
            client.server_capabilities.semanticTokensProvider = nil
        end

        lspconfig[server].setup(options)
    end

    local diagnostic_signs = { Error = " ", Warn = " ", Hint = "󰌵 ", Info = " " }

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
