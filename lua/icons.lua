local icons = {}

icons.diagnostics = {
    [vim.diagnostic.severity.ERROR] = "",
    [vim.diagnostic.severity.WARN] = "",
    [vim.diagnostic.severity.INFO] = "",
    [vim.diagnostic.severity.HINT] = "󰌵",
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
    buffers = "󰈔",
    find = "",
    git = "󰊢",
    lsp = "",
    session = "󰆓",
    tabs = "󰓩",
    ui = "",
}

icons.lsp_progress = {
    done = "",
    spinner = { "⠋", "⠙", "⠹", "⠸", "⠼", "⠴", "⠦", "⠧", "⠇", "⠏" },
}

icons.lightbulb = {
    action = "󰌵",
    lens = "",
}

return icons
