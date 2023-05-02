local opts = {
  noremap = true,
  silent = true
}

local keymap = vim.api.nvim_set_keymap

-- use space as leader
keymap("n", "<Space>", "", opts)
vim.g.mapleader = " "
vim.g.maplocalleader = " "

-- code naviagtion (this really does help me move around faster)
keymap("n", "J", "5j", opts)
keymap("n", "K", "5k", opts)


-- window naviagtion
keymap("n", "<m-h>", "<C-w>h", opts)
keymap("n", "<m-l>", "<C-w>l", opts)
keymap("n", "<m-j>", "<C-w>j", opts)
keymap("n", "<m-k>", "<C-w>k", opts)


-- window resizing
keymap("n", "<C-Up>", ":resize -2<CR>", opts)
keymap("n", "<C-Down>", ":resize +2<CR>", opts)
keymap("n", "<C-Left>", ":vertical resize -2<CR>", opts)
keymap("n", "<C-Right>", ":vertical resize -2<CR>", opts)

-- Stay in indent mode
keymap("v", "<", "<gv", opts)
keymap("v", ">", ">gv", opts)

-- telescope remaps
-- find files
keymap("n", "<leader>ff", "<cmd>lua require('telescope.builtin').find_files()<cr>", opts)
-- project wide grep
keymap("n", "<leader>fg", "<cmd>lua require('telescope.builtin').live_grep()<cr>", opts)
-- find buffers
keymap("n", "<leader>fb", "<cmd>lua require('telescope.builtin').buffers()<cr>", opts)
