local function config()
    local opts = {
        icons = {},
        filter_kind = {},
    }

    local kind_icons = {
        Class = "󰠱",
        Constructor = "",
        Enum = "",
        Function = "󰊕",
        Interface = "",
        Module = "",
        Method = "󰆧",
        Struct = "",
    }

    for kind, icon in pairs(kind_icons) do
        opts.icons[kind] = icon
        table.insert(opts.filter_kind, kind)
    end

    require("aerial").setup(opts)
end

return {
    {
        "stevearc/aerial.nvim",
        dependencies = {
            "nvim-treesitter/nvim-treesitter",
            "nvim-tree/nvim-web-devicons",
        },
        config = config,
    },

    colorscheme_integrations = {
        aerial = true,
    },
}
