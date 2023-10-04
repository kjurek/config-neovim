local builtin = require('telescope.builtin')

vim.keymap.set('n', '<Leader>ff', builtin.find_files, {desc="Find files"})
vim.keymap.set('n', '<Leader>fg', builtin.live_grep, {desc="Live grep"})
vim.keymap.set('n', '<Leader>fb', builtin.buffers, {desc="Find buffers"})
vim.keymap.set('n', '<Leader>fh', builtin.help_tags, {desc="Help tags"})

vim.keymap.set('n', ']b', ":bnext<CR>", {desc="Next buffer"})
vim.keymap.set('n', '[b', ":bprev<CR>", {desc="Previous buffer"})

vim.keymap.set("v", "<C-S-j>", ":m '>+1<CR>gv=gv", {desc="Move selection down"})
vim.keymap.set("v", "<C-S-k>", ":m '<-2<CR>gv=gv", {desc="Move selection up"})
vim.keymap.set("v", "<C-S-h>", "<gv", {desc="Move selection left"})
vim.keymap.set("v", "<C-S-l>", ">gv", {desc="Move selection right"})

vim.keymap.set('t', '<Esc>', [[<C-\><C-n>]], {desc="Select normal mode in terminal"})
