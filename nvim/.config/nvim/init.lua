vim.g.loaded_netrw = 1
vim.g.loaded_netrwPlugin = 1

local lazypath = vim.fn.stdpath("data") .. "/lazy/lazy.nvim"
if not vim.loop.fs_stat(lazypath) then
  vim.fn.system({
    "git",
    "clone",
    "--filter=blob:none",
    "https://github.com/folke/lazy.nvim.git",
    "--branch=stable", -- latest stable release
    lazypath,
  })
end
vim.opt.rtp:prepend(lazypath)

require("hans.options")
-- Plugins always first for dependency order.
require("hans.plugins")
require("hans.auto-dark-mode")
require("hans.fzf-lua")
require("hans.keymaps")
require("hans.lsp")
require("hans.nvimtree")
-- require("hans.scio")
