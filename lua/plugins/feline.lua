local function icon(str, color, condition)
    return {
        provider = str,
        enabled = condition,

        left_sep = "left_rounded",

        right_sep = {
            str = " ",
            hl = {
                bg = color
            }
        },

        hl = {
            fg = "bg",
            bg = color
        }
    }
end

local function block(component, color)
    component.left_sep = "block"
    component.right_sep = "right_rounded"

    component.hl = {
        fg = color,
        bg = "#323232",
        style = "bold"
    }

    return component
end

local gap = {
    provider = " "
}

local vi_mode = {
    icon = "",

    provider = {
        name = "vi_mode",
        opts = {
            show_mode_name = true
        }
    }
}

local function file_icon()
    local devicon, _ = require("nvim-web-devicons").get_icon(vim.fn.expand("%:t"))
    return devicon
end

local file_info = {
    icon = "",

    provider = {
        name = "file_info",
        opts = {
            file_modified_icon = "",
            file_readonly_icon = " "
        }
    }
}

local git_branch = {
    provider = "git_branch",

    right_sep = " ",

    hl = {
        fg = "#606060"
    }
}

local git_diff_added = {
    provider = "git_diff_added",

    icon = " ",
    right_sep = " ",

    hl = {
        fg = "#606060"
    }
}

local git_diff_removed = {
    provider = "git_diff_removed",

    icon = " ",
    right_sep = " ",

    hl = {
        fg = "#606060"
    }
}

local git_diff_changed = {
    provider = "git_diff_changed",

    icon = " ",
    right_sep = " ",

    hl = {
        fg = "#606060"
    }
}

local diagnostic_errors = {
    provider = "diagnostic_errors",

    icon = " ",
    left_sep = " ",

    hl = {
        fg = "#606060"
    }
}

local diagnostic_warnings = {
    provider = "diagnostic_warnings",

    icon = " ",
    left_sep = " ",

    hl = {
        fg = "#606060"
    }
}

local diagnostic_hints = {
    provider = "diagnostic_hints",

    icon = "󰌵 ",
    left_sep = " ",

    hl = {
        fg = "#606060"
    }
}

local diagnostic_info = {
    provider = "diagnostic_info",

    icon = " ",
    left_sep = " ",

    hl = {
        fg = "#606060"
    }
}

local function is_lsp_attached()
   return next(vim.lsp.get_active_clients {bufnr = 0}) ~= nil
end

local lsp_client_names = {
    icon = "",

    provider = "lsp_client_names"
}

local position = {
    provider = "position"
}

local left = {
    icon("󰆧", "#42a5f5"), block(vi_mode),
    gap,
    icon(file_icon, "#ffaf60"), block(file_info),
    gap,
    git_branch, git_diff_added, git_diff_removed, git_diff_changed
}

local right = {
    diagnostic_errors, diagnostic_warnings, diagnostic_hints, diagnostic_info,
    gap,
    icon("", "#fc4e4e", is_lsp_attached), block(lsp_client_names),
    gap,
    icon("󰦨", "#bbef6e"), block(position),
}


return {
    {
        "freddiehaddad/feline.nvim",
        dependencies = "nvim-tree/nvim-web-devicons",
        opts = {
            components = {
                active = {left, right},
                inactive = {left, right}
            }
        }
    }
}
