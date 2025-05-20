if vim.g.neovide then
    vim.opt.guifont = "JetBrainsMono Nerd Font:h11"
    vim.g.neovide_floating_corner_radius = 0.25
    vim.g.neovide_refresh_rate = 144

    vim.keymap.set("n", "<f11>", function()
        vim.g.neovide_fullscreen = not vim.g.neovide_fullscreen
    end, { desc = "Toggle fullscreen" })
end
