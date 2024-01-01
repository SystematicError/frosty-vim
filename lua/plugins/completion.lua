-- TODO: Refactor completion
-- Ideally lspconfig, cmp, and luasnip should have their own configs but
-- their dependencies are too intertwined with each other so just leaving
-- them together for now

local function config()
    local lspconfig = require "lspconfig"
    local cmp = require "cmp"
    local luasnip = require "luasnip"

    -- LSP config

    local servers = {
        lua_ls = {},
        nil_ls = {},
    }

    local capabilities = require("cmp_nvim_lsp").default_capabilities()

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

    local diagnostic_signs = { Error = " ", Warn = " ", Hint = "󰌵 ", Info = " " }

    for name, icon in pairs(diagnostic_signs) do
        local hl = "DiagnosticSign" .. name
        vim.fn.sign_define(hl, { text = icon, texthl = hl, numhl = hl })
    end

    -- Cmp config

    local lspkind_icons = {
        Text = "",
        Method = "󰆧",
        Function = "󰊕",
        Constructor = "",
        Field = "󰇽",
        Variable = "󰂡",
        Class = "󰠱",
        Interface = "",
        Module = "",
        Property = "󰜢",
        Unit = "",
        Value = "󰎠",
        Enum = "",
        Keyword = "󰌋",
        Snippet = "",
        Color = "󰏘",
        File = "󰈙",
        Reference = "",
        Folder = "󰉋",
        EnumMember = "",
        Constant = "󰏿",
        Struct = "",
        Event = "",
        Operator = "󰆕",
        TypeParameter = "󰅲",
    }

    cmp.setup {
        sources = cmp.config.sources({
            { name = "nvim_lsp" },
            { name = "luasnip" },
        }, {
            { name = "buffer" },
            { name = "path" },
        }),

        mapping = {
            ["<C-e>"] = cmp.mapping.abort(),
            ["<CR>"] = cmp.mapping.confirm { select = true },
            ["<C-k>"] = cmp.mapping.scroll_docs(-2),
            ["<C-j>"] = cmp.mapping.scroll_docs(2),

            ["<Tab>"] = cmp.mapping(function(fallback)
                if cmp.visible() then
                    cmp.select_next_item()
                elseif luasnip.expand_or_jumpable() then
                    luasnip.expand_or_jump()
                else
                    fallback()
                end
            end, { "i", "s" }),

            ["<S-Tab>"] = cmp.mapping(function(fallback)
                if cmp.visible() then
                    cmp.select_prev_item()
                elseif luasnip.jumpable(-1) then
                    luasnip.jump(-1)
                else
                    fallback()
                end
            end, { "i", "s" }),
        },

        formatting = {
            format = function(entry, vim_item)
                vim_item.kind = string.format("%s %s", lspkind_icons[vim_item.kind], vim_item.kind)

                vim_item.menu = ({
                    nvim_lsp = "[LSP]",
                    luasnip = "[LuaSnip]",
                    buffer = "[Buffer]",
                    path = "[Path]",
                    cmdline = "[Cmdline]",
                })[entry.source.name]

                return vim_item
            end,
        },

        snippet = {
            expand = function(args)
                require("luasnip").lsp_expand(args.body)
            end,
        },

        experimental = {
            ghost_text = true,
        },
    }

    cmp.setup.cmdline({ "/", "?" }, {
        sources = {
            { name = "buffer" },
        },
    })

    cmp.setup.cmdline(":", {
        sources = {
            { name = "cmdline" },
            { name = "path" },
        },
    })

    -- Snippet config

    require("luasnip.loaders.from_vscode").lazy_load()
end

return {
    {
        "hrsh7th/nvim-cmp",
        dependencies = {
            "neovim/nvim-lspconfig",
            "hrsh7th/cmp-nvim-lsp",
            "L3MON4D3/LuaSnip",
            "saadparwaiz1/cmp_luasnip",
            "rafamadriz/friendly-snippets",
            "hrsh7th/cmp-buffer",
            "hrsh7th/cmp-path",
            "hrsh7th/cmp-cmdline",
        },
        config = config,
    },
}
