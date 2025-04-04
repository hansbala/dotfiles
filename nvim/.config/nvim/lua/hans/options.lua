vim.g.mapleader = ' '
vim.g.maplocalleader = ' '

-- use spaces for tabs and whatnot
vim.opt.tabstop = 2
vim.opt.shiftwidth = 2
vim.opt.shiftround = true
vim.opt.expandtab = true
vim.o.signcolumn = "yes"
vim.o.cursorline = true
vim.o.colorcolumn = "100"

-- better default splits
vim.o.splitright = true
vim.o.splitbelow = true
-- vim.o.scrolloff = 999

vim.cmd [[ set noswapfile ]]
vim.cmd [[ set nowrap ]]

--Line numbers
vim.wo.number = true
vim.wo.relativenumber = true

-- Create a function to reload the config
function ReloadConfig()
  for name, _ in pairs(package.loaded) do
    if name:match('^user') or name:match('^plugins') then
      package.loaded[name] = nil
    end
  end
  dofile(vim.fn.stdpath('config') .. '/init.lua')
  print("Neovim configuration reloaded!")
end

vim.keymap.set('n', '<leader>nr', ':lua ReloadConfig()<CR>', { noremap = true, silent = true })
