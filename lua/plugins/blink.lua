local default_opts = {
    signature = { enabled = true },

    appearance = {
        nerd_font_variant = "normal",
        kind_icons = require("icons").kinds,
    },

    completion = {
        menu = {
            draw = {
                columns = {
                    { "label", "label_description", gap = 1 },
                    { "kind_icon", "kind", gap = 1 },
                },
            },
        },

        list = {
            selection = {
                preselect = function()
                    return not require("blink.cmp").snippet_active { direction = 1 }
                end,
            },
        },
    },

    cmdline = {
        completion = {
            menu = {
                auto_show = true,

                draw = {
                    columns = {
                        { "label", "label_description", gap = 1 },
                    },
                },
            },

            list = {
                selection = {
                    preselect = false,
                },
            },
        },
    },

    -- Hybrid of super-tab and enter mapping presets
    keymap = {
        preset = "none",

        ["<cr>"] = { "accept", "fallback" },
        ["<c-e>"] = { "hide", "fallback" },
        ["<c-space>"] = { "show", "show_documentation", "hide_documentation" },
        ["<c-k>"] = { "show_signature", "hide_signature", "fallback" },

        ["<c-u>"] = { "scroll_documentation_up", "fallback" },
        ["<c-d>"] = { "scroll_documentation_down", "fallback" },

        ["<up>"] = { "select_prev", "fallback" },
        ["<down>"] = { "select_next", "fallback" },

        ["<tab>"] = {
            function(cmp)
                if cmp.snippet_active() then
                    return cmp.accept()
                else
                    return cmp.select_next()
                end
            end,
            "snippet_forward",
            "fallback",
        },
        ["<s-tab>"] = { "select_prev", "snippet_backward", "fallback" },
    },

    fuzzy = {
        -- Flake bundles the binary into cpath
        prebuilt_binaries = { download = false },
    },
}

return {
    "Saghen/blink.cmp",
    dependencies = "rafamadriz/friendly-snippets",

    event = { "InsertEnter", "CmdlineEnter" },

    opts = default_opts,

    specs = {
        "catppuccin/nvim",
        optional = true,
        opts = {
            integrations = {
                blink_cmp = true,
            },
        },
    },
}
