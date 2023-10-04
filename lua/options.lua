vim.cmd("colorscheme palenight")
vim.opt.number = true
vim.opt.nu = true
vim.opt.smartindent = true
vim.opt.tabstop = 4
vim.opt.shiftwidth = 4
vim.opt.expandtab = true
vim.opt.termguicolors = true
vim.opt.statusline = "%<%f %h%m%r%=%-14.(%l,%c%V%) %P"
vim.opt.list = true
vim.opt.autowriteall = true
vim.opt.listchars:append "eol:$"
vim.opt.listchars:append "tab:>-"
vim.opt.listchars:append "trail:·"
vim.opt.listchars:append "extends:>"
vim.opt.listchars:append "precedes:<"
vim.opt.listchars:append "space:␣"
