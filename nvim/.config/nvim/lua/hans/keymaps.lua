local fzf_lua = require("fzf-lua")

vim.keymap.set('n', '<leader>h', ':nohlsearch<CR>')

-- I scroll like this lol
vim.keymap.set('n', 'K', '7k')
vim.keymap.set('n', 'J', '7j')
vim.keymap.set('v', 'K', '7k')
vim.keymap.set('v', 'J', '7j')

-- Move between panes
vim.keymap.set('n', '<C-h>', '<C-w>h')
vim.keymap.set('n', '<C-l>', '<C-w>l')
vim.keymap.set('n', '<C-j>', '<C-w>j')
vim.keymap.set('n', '<C-k>', '<C-w>k')

vim.keymap.set('n', '<C-l>', ':nohl<CR>')
vim.keymap.set('n', '<C-q>', ':q<CR>')


-- file explorer
vim.keymap.set('n', '<C-n>', ':NvimTreeFindFileToggle<CR>')

-- finding stuff
vim.keymap.set('n', '<leader>ff', fzf_lua.files, {})
vim.keymap.set('n', '<leader>fg', fzf_lua.grep_project, {})
vim.keymap.set('n', '<leader>/', fzf_lua.lines, {})

-- git toggles
vim.keymap.set('n', '<leader>g', ':Git blame<CR>')

-- Yank to system clipboard using leader + y
vim.api.nvim_set_keymap('n', '<leader>y', '"+y', { noremap = true, silent = true })
vim.api.nvim_set_keymap('v', '<leader>y', '"+y', { noremap = true, silent = true })
-- Yank to system clipboard using leader + Y (for the whole line)
vim.api.nvim_set_keymap('n', '<leader>Y', '"+Y', { noremap = true, silent = true })
