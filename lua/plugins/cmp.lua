local function config()
    local cmp = require "cmp"
    local luasnip = require "luasnip"

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

    local function border(highlight)
        return {
            { "╭", highlight },
            { "─", highlight },
            { "╮", highlight },
            { "│", highlight },
            { "╯", highlight },
            { "─", highlight },
            { "╰", highlight },
            { "│", highlight },
        }
    end

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
            ["<C-u>"] = cmp.mapping.scroll_docs(-4),
            ["<C-d>"] = cmp.mapping.scroll_docs(4),

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

        window = {
            completion = {
                scrollbar = false,
                border = border "CmpBorder",
                winhighlight = "Normal:CmpPmenu,Search:None",
            },

            documentation = {
                border = border "CmpBorder",
                winhighlight = "Normal:CmpDoc",
            },
        },

        formatting = {
            fields = { "kind", "abbr", "menu" },

            format = function(entry, vim_item)
                vim_item.kind = lspkind_icons[vim_item.kind] .. " "

                vim_item.menu = "    "
                    .. ({
                        nvim_lsp = "LSP",
                        luasnip = "LuaSnip",
                        buffer = "Buffer",
                        path = "Path",
                        cmdline = "Command",
                    })[entry.source.name]

                return vim_item
            end,
        },

        snippet = {
            expand = function(args)
                luasnip.lsp_expand(args.body)
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
end

return {
    {
        "hrsh7th/nvim-cmp",
        dependencies = {
            "L3MON4D3/LuaSnip",
            "saadparwaiz1/cmp_luasnip",
            "hrsh7th/cmp-nvim-lsp",
            "hrsh7th/cmp-buffer",
            "hrsh7th/cmp-path",
            "hrsh7th/cmp-cmdline",
        },
        config = config,
    },
}
