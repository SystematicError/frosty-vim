-- TODO: Refine config
-- TODO: Lazy load

local kind_icons = require("icons").kinds

local default_opts = {
    signature = { enabled = true },

    appearance = {
        nerd_font_variant = "normal",
        kind_icons = kind_icons,
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

    keymap = {
        preset = "none",

        ["<cr>"] = { "accept", "fallback" },
        ["<c-e>"] = { "hide", "fallback" },
        ["<c-space>"] = { "show", "show_documentation", "hide_documentation" },
        ["<c-k>"] = { "show_signature", "hide_signature", "fallback" },

        ["<c-u>"] = { "scroll_documentation_up", "fallback" },
        ["<c-d>"] = { "scroll_documentation_down", "fallback" },

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

    lazy = false,

    opts = default_opts,
}
