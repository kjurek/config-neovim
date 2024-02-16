local telescope = require('telescope')
local builtin = require('telescope.builtin')

vim.keymap.set('n', '<Leader>ff', builtin.find_files, {desc="Find files"})
vim.keymap.set('n', '<Leader>fb', builtin.buffers, {desc="Find buffers"})
vim.keymap.set('n', '<Leader>fh', builtin.help_tags, {desc="Help tags"})
vim.keymap.set("n", "<leader>fg", telescope.extensions.live_grep_args.live_grep_args, {desc="Seaarch for text in files"})

local live_grep_args_shortcuts = require("telescope-live-grep-args.shortcuts")
vim.keymap.set("n", "<Leader>fw", live_grep_args_shortcuts.grep_word_under_cursor, {desc="Search for text under cursor"})
vim.keymap.set("v", "<Leader>fw", live_grep_args_shortcuts.grep_visual_selection, {desc="Search for selected text"})

vim.keymap.set('n', ']b', ":bnext<CR>", {desc="Next buffer"})
vim.keymap.set('n', '[b', ":bprev<CR>", {desc="Previous buffer"})

vim.keymap.set("v", "<C-S-j>", ":m '>+1<CR>gv=gv", {desc="Move selection down"})
vim.keymap.set("v", "<C-S-k>", ":m '<-2<CR>gv=gv", {desc="Move selection up"})
vim.keymap.set("v", "<", "<gv", {desc="Move selection left"})
vim.keymap.set("v", ">", ">gv", {desc="Move selection right"})

vim.keymap.set("n", "<C-S-j>", ":m +1<CR>", {desc="Move current line down"})
vim.keymap.set("n", "<C-S-k>", ":m -2<CR>", {desc="Move current line up"})
vim.keymap.set("n", "<", "<<", {desc="Move current line left"})
vim.keymap.set("n", ">", ">>", {desc="Move current line right"})

vim.keymap.set("n", "<C-S-f>", ":%! black --quiet - <CR>", {desc="Format buffer"})

vim.keymap.set('t', '<Esc>', [[<C-\><C-n>]], {desc="Select normal mode in terminal"})
