local cmp = require "cmp"
local lspconfig = require "lspconfig"

local capabilities = require("cmp_nvim_lsp").default_capabilities()

local servers = {
    lua_ls = {}
}

for server, options in pairs(servers) do
    options.capabilities = capabilities
    lspconfig[server].setup(options)
end

cmp.setup {
    sources = cmp.config.sources({
        {name = "nvim_lsp"}
    }, {
        {name = "buffer"},
        {name = "path"}
    })
}

cmp.setup.cmdline({"/", "?"}, {
    sources = {
        {name = "buffer"}
    }
})

cmp.setup.cmdline(":", {
    sources = {
        {name = "cmdline"},
        {name = "path"}
    }
})
