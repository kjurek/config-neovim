local set = vim.opt
vim.g.mapleader = " "
---------------- vim options  ----------------
set.number = true
set.nu = true
set.smartindent = true
set.tabstop = 4
set.shiftwidth = 4
set.expandtab = true
set.termguicolors = true
set.statusline = "%<%f %h%m%r%=%-14.(%l,%c%V%) %P"
set.list = true
set.autowriteall = true
set.listchars:append "eol:$"
set.listchars:append "tab:>-"
set.listchars:append "trail:·"
set.listchars:append "extends:>"
set.listchars:append "precedes:<"
set.listchars:append "space:␣"
