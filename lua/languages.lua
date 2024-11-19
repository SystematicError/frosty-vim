local languages = {}

languages.servers = {
    bashls = {},

    biome = {},

    lua_ls = {
        Lua = {
            format = { enable = false },
            telemetry = { enable = false },
            completion = { callSnippet = "Both" },
        },
    },

    nil_ls = {},

    pylsp = {
        pylsp = {
            plugins = {
                ruff = { enabled = true },
            },
        },
    },

    rust_analyzer = {},
}

languages.formatters = {
    lua = { "stylua" },

    nix = { "alejandra" },
}

return languages
