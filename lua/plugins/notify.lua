local function config()
    local notify = require "notify"

    local opts = {
        icons = {
            DEBUG = "",
            ERROR = "",
            INFO = "",
            TRACE = "󰏫",
            WARN = "",
        },
    }

    vim.notify = notify
    notify.setup(opts)
end

return {
    {
        "rcarriga/nvim-notify",
        config = config,
    },

    colorscheme_integrations = {
        notify = true,
    },
}
