vim.g.mapleader = ' '
vim.g.maplocalleader = ' '

-- use spaces for tabs and whatnot
vim.opt.tabstop = 2
vim.opt.shiftwidth = 2
vim.opt.shiftround = true
vim.opt.expandtab = true
vim.o.signcolumn = "yes"
vim.o.cursorline = true

-- better default splits
vim.o.splitright = true
vim.o.splitbelow = true
-- vim.o.scrolloff = 999

vim.cmd [[ set noswapfile ]]

--Line numbers
vim.wo.number = true
vim.wo.relativenumber = true
