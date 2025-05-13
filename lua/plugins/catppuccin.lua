-- TODO: Modularise bufferline integration

local default_opts = {
    flavour = "mocha",

    color_overrides = {
        mocha = {
            rosewater = "#f5e0dc",
            flamingo = "#f2cdcd",
            pink = "#f5c2e7",
            mauve = "#cba6f7",
            red = "#f38ba8",
            maroon = "#eba0ac",
            peach = "#fab387",
            yellow = "#f9e2af",
            green = "#a6e3a1",
            teal = "#94e2d5",
            sky = "#89dceb",
            sapphire = "#74c7ec",
            blue = "#89b4fa",
            lavender = "#b4befe",
            text = "#cbd7f4",
            subtext1 = "#b8c3de",
            subtext0 = "#a3aec8",
            overlay2 = "#909ab2",
            overlay1 = "#7c859c",
            overlay0 = "#697186",
            surface2 = "#545c70",
            surface1 = "#41485a",
            surface0 = "#2d3344",
            base = "#1a1f2e",
            mantle = "#151925",
            crust = "#0e121b",
        },
    },

    default_integrations = false,
    integrations = {
        blink_cmp = true,
        diffview = true,
        gitsigns = true,
        markdown = true,
        native_lsp = { enabled = true, virtual_text = {}, underlines = {}, inlay_hints = {} },
        neogit = true,
        neotree = true,
        semantic_tokens = true,
        snacks = { enabled = true },
        treesitter = true,
        which_key = true,
    },
}

local function config(_, opts)
    require("catppuccin").setup(opts)
    vim.cmd.colorscheme "catppuccin"
end

return {
    "catppuccin/nvim",
    name = "catppuccin",

    priority = 1000,
    lazy = false,

    opts = default_opts,
    config = config,
}
