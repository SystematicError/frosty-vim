-- TODO: Switch to vim.o
local opt = vim.opt

opt.cmdheight = 0
opt.confirm = true
opt.expandtab = true
opt.fillchars = { eob = " " }
opt.ignorecase = true
opt.laststatus = 3
opt.lazyredraw = true
opt.mouse = "a"
opt.number = true
opt.relativenumber = true
opt.ruler = false
opt.scrolloff = 4
opt.sessionoptions = { "blank", "buffers", "curdir", "folds", "globals", "help", "tabpages", "terminal", "winsize" }
opt.shiftwidth = 4
opt.showmode = false
opt.signcolumn = "yes:1"
opt.smartcase = true
opt.smartindent = true
opt.softtabstop = 4
opt.splitbelow = true
opt.splitright = true
opt.tabstop = 4
opt.termguicolors = true
opt.timeoutlen = 500
opt.whichwrap = "bshl<>[]~"
opt.wrap = false
