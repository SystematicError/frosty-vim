local function config()
    local opts = {
        theme = "doom",

        config = {
            header = {
                "",
                "",
                "   █████ ██▀███   ▒█████    ██████ ▄▄▄█████▓▓██   ██▓",
                " ▓██    ▓██ ▒ ██▒▒██▒  ██▒▒██    ▒ ▓  ██▒ ▓▒ ▒██  ██▒",
                " ▒████  ▓██ ░▄█ ▒▒██░  ██▒░ ▓██▄   ▒ ▓██░ ▒░  ▒██ ██░",
                " ░▓█▒   ▒██▀▀█▄  ▒██   ██░  ▒   ██▒░ ▓██▓ ░   ░ ▐██▓░",
                "▒░▒█░   ░██▓ ▒██▒░ ████▓▒░▒██████▒▒  ▒██▒ ░   ░ ██▒▓░",
                "░ ▒ ░   ░ ▒▓ ░▒▓░░ ▒░▒░▒░ ▒ ▒▓▒ ▒ ░  ▒ ░░      ██▒▒▒ ",
                "░ ░       ░▒ ░ ▒   ░ ▒ ▒░ ░ ░▒  ░ ░    ░     ▓██ ░▒░ ",
                "  ░ ░     ░░   ░ ░ ░ ░ ▒  ░  ░  ░    ░       ▒ ▒ ░░  ",
                "░          ░         ░ ░        ░            ░ ░     ",
                "",
                "",
            },

            center = {
                { icon = "", desc = "Find files", key = "f", action = "Telescope find_files" },
                { icon = "", desc = "File tree", key = "t", action = "Neotree toggle" },
                { icon = "", desc = "New file", key = "n", action = "enew | startinsert" },
                { icon = "", desc = "Recent files", key = "r", action = "Telescope oldfiles" },
                { icon = "󰦨", desc = "Live grep", key = "g", action = "Telescope live_grep" },
                { icon = "", desc = "Quit", "hi", key = "q", action = "qa" },
            },

            footer = {},
        },
    }

    for _, button in ipairs(opts.config.center) do
        button.icon = button.icon .. "  "
        button.desc = button.desc .. string.rep(" ", 40 - #button.desc)
    end

    require("dashboard").setup(opts)
end

return {
    {
        "nvimdev/dashboard-nvim",
        config = config,
    },

    colorscheme_integrations = {
        dashboard = true,
    },
}
