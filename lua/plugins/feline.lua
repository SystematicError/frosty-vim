local vi_mode = {
    icon = "",
    right_sep = "  ",

    provider = {
        name = "vi_mode",
        opts = {
            show_mode_name = true
        }
    }
}

local file_info = {
    right_sep = "  ",

    provider = {
        name = "file_info",
        opts = {
            file_modified_icon = "",
            file_readonly_icon = ""
        }
    }
}

local git_branch = {
    provider = "git_branch"
}

local position = {
    provider = "position"
}

local line_percentage = {
    left_sep = "  ",
    provider = "line_percentage"
}

local left = {
    vi_mode,
    file_info,
    git_branch,
}

local right = {
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