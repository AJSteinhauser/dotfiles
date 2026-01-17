vim.g.mapleader = " "
vim.opt.nu = true

vim.opt.relativenumber = true

vim.opt.tabstop = 2
vim.opt.softtabstop = 2
vim.opt.shiftwidth = 2
vim.opt.expandtab = true

vim.opt.autowriteall = true
vim.opt.autowrite = true

vim.opt.wrap = false

vim.opt.swapfile = false
vim.opt.backup = false
vim.opt.undodir = os.getenv("HOME") .. "/.nvim_undo"

vim.opt.hlsearch = false
vim.opt.incsearch = true


vim.opt.scrolloff = 8
vim.opt.signcolumn = "yes"
vim.opt.isfname:append("@-@")

-- Relative line numbers on netrw
vim.g.netrw_bufsettings = 'noma nomod nu rnu nobl nowrap ro'

vim.opt.spelllang = 'en_us'
vim.opt.spell = true
