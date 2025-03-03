local function config()
    local blink = require "blink.cmp"

    local kind_icons = require("icons").kind_icons

    local opts = {
        signature = { enabled = true },

        appearance = {
            nerd_font_variant = "normal",
            kind_icons = kind_icons,
        },

        sources = {
            providers = {
                snippets = {
                    opts = {
                        search_paths = {
                            -- Flake managed snippet compatibility
                            FROSTY_PACKAGES["rafamadriz/friendly-snippets"],
                            vim.fn.stdpath "config" .. "/snippets",
                        },
                    },
                },
            },
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
                    preselect = function(ctx)
                        -- TODO: move cmdline part to separate table
                        return ctx.mode ~= "cmdline" and not blink.snippet_active { direction = 1 }
                    end,
                },
            },
        },

        cmdline = {
            completion = {
                menu = {
                    draw = {
                        columns = {
                            { "label", "label_description", gap = 1 },
                        },
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

    blink.setup(opts)
end

return {
    "Saghen/blink.cmp",
    dependencies = "rafamadriz/friendly-snippets",
    lazy = false,
    config = config,
}
