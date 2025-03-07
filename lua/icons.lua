local icons = {}

icons.diagnostics = {
    Error = "",
    Warn = "",
    Hint = "󰌵",
    Info = "",
}

icons.kinds = {
    Text = "",
    Method = "󰆧",
    Function = "󰊕",
    Constructor = "",

    Field = "󰘎",
    Variable = "󰀫",
    Property = "󰖷",

    Class = "",
    Interface = "",
    Struct = "",
    Module = "󰏗",

    Unit = "",
    Value = "󰎠",
    Enum = "",
    EnumMember = "",

    Keyword = "󰌋",
    Constant = "󰏿",

    Snippet = "",
    Color = "",
    File = "󰈔",
    Reference = "",
    Folder = "",
    Event = "",
    Operator = "󱓉",
    TypeParameter = "󰅩",
}

icons.tree_folder = {
    folder_closed = "",
    folder_open = "",
    folder_empty = "",
}

icons.tree_git = {
    added = "",
    modified = "",
    deleted = "",
    renamed = "󰏫",

    untracked = "",
    ignored = "󱙝",
    unstaged = "○",
    staged = "●",
    conflict = "",
}

icons.git_gutter = {
    add = "│",
    change = "│",
    delete = "_",
    topdelete = "‾",
    changedelete = "_",
    untracked = "┆",
}

icons.keymap_groups = {
    git = "󰊢",
}

return icons
