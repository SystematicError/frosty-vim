local vi_mode = {
    icon = "",

    left_sep = "block",
    right_sep = "█ ",

    hl = {
        fg = "bg",
        bg = "#42a5f5",
        style = "bold"
    },

    provider = {
        name = "vi_mode",
        opts = {
            show_mode_name = true
        }
    }
}

local file_info = {
    left_sep = " ",
    right_sep = " ",

    provider = {
        name = "file_info",
        opts = {
            file_modified_icon = "",
            file_readonly_icon = ""
        }
    }
}

local git_branch = {
    left_sep = " ",
    right_sep = " ",

    hl = {
        fg = "#606060";
    },

    provider = "git_branch"
}

local lsp_client_names = {
    left_sep = " ",
    right_sep = " ",

    hl = {
        fg = "#606060"
    },

    provider = "lsp_client_names"
}

local position = {
    left_sep = "  ",
    right_sep = "  ",

    provider = "position"
}

local line_percentage = {
    left_sep = "  ",
    right_sep = "  ",

    provider = "line_percentage"
}

local left = {
    vi_mode,
    file_info,
    git_branch,
}

local right = {
    lsp_client_names,
    position,
    line_percentage
}


return {
    {
        "freddiehaddad/feline.nvim",
        opts = {
            components = {
                active = {left, right},
                inactive = {left, right}
            }
        }
    }
}
