local function config()
    vim.notify = require "notify"
end

return {
    {
        "rcarriga/nvim-notify",
        config = config,
    },
}
