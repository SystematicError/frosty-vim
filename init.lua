require "options"
require "autocmds"
require "keymaps"
require "gui"

local lazy_path

if FROSTY_PACKAGES then
    lazy_path = FROSTY_PACKAGES .. "/lazy.nvim"
else
    lazy_path = vim.fn.stdpath "data" .. "/lazy/lazy.nvim"

    if not vim.uv.fs_stat(lazy_path) then
        local output = vim.fn.system {
            "git",
            "clone",
            "--filter=blob:none",
            "https://github.com/folke/lazy.nvim.git",
            "--branch=stable",
            lazy_path,
        }

        if vim.v.shell_error ~= 0 then
            vim.api.nvim_echo({
                { "Failed to clone lazy.nvim:\n", "ErrorMsg" },
                { output, "WarningMsg" },
                { "\nPress any key to exit..." },
            }, true, {})

            vim.fn.getchar()
            os.exit(1)
        end
    end
end

vim.opt.rtp:prepend(lazy_path)

-- TODO: Add support for LazyFile event (maybe?)

require("lazy").setup {
    spec = { import = "plugins" },

    defaults = {
        lazy = true,
    },

    install = {
        colorscheme = { "catppuccin" },
    },

    dev = {
        path = FROSTY_PACKAGES,
        patterns = { "/" }, -- HACK: Select every plugin, maybe better way?
        fallback = true,
    },

    performance = {
        rtp = {
            paths = FROSTY_RUNTIMEPATHS,
        },
    },
}
