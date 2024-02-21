local lazypath = FROSTY_PACKAGES["folke/lazy.nvim"]

if not lazypath then
    lazypath = vim.fn.stdpath "data" .. "/lazy/lazy.nvim"

    if not vim.loop.fs_stat(lazypath) then
        vim.fn.system {
            "git",
            "clone",
            "--filter=blob:none",
            "https://github.com/folke/lazy.nvim.git",
            "--branch=stable",
            lazypath,
        }
    end
end

vim.opt.rtp:prepend(lazypath)
