--[[
-- Spell checker plugin set for English
--
-- Usage:
--      ]s            -> jump to next misspelled word
--      [s            -> jump to previous misspelled word
--      z=            -> show spelling suggestions
--      zg            -> add word to dictionary
--      zw            -> mark word as wrong
-- ]]

local opts = {
    event = { -- event(s) to refresh diagnostics on
        -- "CursorHold",
        -- "InsertLeave",
        "TextChanged",
        "TextChangedI",
        "TextChangedP",
    },
    enable = true, -- enable diagnostics on startup
    ft_config = { -- spellcheck method: "cursor", "iter", or boolean
        alpha = false,
        help = false,
        lazy = false,
        lspinfo = false,
        mason = false,
    },
    ft_default = true, -- default option for unspecified file types
    max_file_size = 80, -- maximum file size to check in lines (nil for no limit)
    severity = { -- severity for each spelling error type (false to disable diagnostics for that type)
        spellbad = "WARN",
        spellcap = "HINT",
        spelllocal = "HINT",
        spellrare = "INFO",
    },
    suggest = false, -- show spelling suggestions in diagnostic message (works best with window-style message)
    num_suggest = 0, -- number of spelling suggestions shown in diagnostic message
    prefix = "possible misspelling(s): ", -- prefix for each diagnostic message
    diagnostic_opts = { severity_sort = true }, -- options for diagnostic display
}

local function config()
    vim.opt.spell = true
    vim.opt.spelllang = { "en_us" }

    require("spellwarn").setup(opts)
end

return {
    "ravibrock/spellwarn.nvim",
    lazy = false,
    config = config,
}
