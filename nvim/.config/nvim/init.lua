-- Plugins
vim.pack.add({
  "https://github.com/neovim/nvim-lspconfig",
  "https://github.com/williamboman/mason.nvim",
  "https://github.com/saghen/blink.cmp",
  "https://github.com/nvim-treesitter/nvim-treesitter",
  "https://github.com/ibhagwan/fzf-lua",
  "https://github.com/nvim-tree/nvim-tree.lua",
  "https://github.com/tpope/vim-fugitive",
  "https://github.com/EdenEast/nightfox.nvim",
  "https://github.com/f-person/auto-dark-mode.nvim",
})
plugin_lspconfig = require('lspconfig')
plugin_mason = require('mason')
plugin_blink_cmp = require('blink.cmp')
plugin_nvim_tree = require('nvim-tree')
plugin_fzf_lua = require('fzf-lua')
plugin_nvim_treesitter = require('nvim-treesitter.configs')
plugin_auto_darkmode = require('auto-dark-mode')

-- Plugin configuration
plugin_nvim_treesitter.setup({
  ensure_installed = { "go", "tsx", "typescript", "nix" },
})
plugin_mason.setup({})
plugin_blink_cmp.setup({
  keymap = { preset = "enter" },
  sources = {
    default = { "lsp", "path", "buffer" },
  },
  completion = {
    documentation = { auto_show = true },
    accept = { auto_brackets = { enabled = true } },
  },
  fuzzy = { implementation = "lua" },
})
plugin_nvim_tree.setup({
  sort_by = "case_sensitive",
  view = {
    width = 30,
  },
  renderer = {
    group_empty = true,
  },
  filters = {
    dotfiles = false,
    git_ignored = false,
  },
})
plugin_fzf_lua.setup({
  keymap = {
    fzf = {
      ["ctrl-q"] = "select-all+accept",
    }
  }
})
plugin_auto_darkmode.setup({
  update_interval = 1000,
  set_dark_mode = function()
    vim.api.nvim_set_option_value('background', 'dark', {})
    vim.cmd('colorscheme carbonfox')
  end,
  set_light_mode = function()
    vim.api.nvim_set_option_value('background', 'light', {})
    vim.cmd('colorscheme dayfox')
  end,
})

-- Options
vim.g.mapleader = ' '
vim.g.maplocalleader = ' '
vim.opt.tabstop = 2
vim.opt.shiftwidth = 2
vim.opt.shiftround = true
vim.opt.expandtab = true
vim.o.signcolumn = "yes"
vim.o.cursorline = true
vim.o.colorcolumn = "100"
vim.o.splitright = true
vim.o.splitbelow = true
vim.o.winborder = 'rounded'
vim.cmd [[ set noswapfile ]]
vim.cmd [[ set nowrap ]]
vim.wo.number = true
vim.wo.relativenumber = true
vim.cmd[[colorscheme carbonfox]]
vim.cmd[[hi statusline guibg=NONE]]

-- Keymaps
vim.keymap.set('n', '<leader>h', ':nohl<CR>')
vim.keymap.set('n', 'K', '7k')
vim.keymap.set('n', 'J', '7j')
vim.keymap.set('v', 'K', '7k')
vim.keymap.set('v', 'J', '7j')
vim.keymap.set('n', '<C-h>', '<C-w>h')
vim.keymap.set('n', '<C-l>', '<C-w>l')
vim.keymap.set('n', '<C-j>', '<C-w>j')
vim.keymap.set('n', '<C-k>', '<C-w>k')
vim.keymap.set('n', '<C-n>', ':NvimTreeFindFileToggle<CR>')
vim.keymap.set('n', '<leader>ff', plugin_fzf_lua.files, {})
vim.keymap.set('n', '<leader>fa', function()
  plugin_fzf_lua.files({
    rg_opts = "--color=never --files --hidden --follow --no-ignore"
  })
end, { desc = "FZF: Find all files (including hidden/unignored)" })
vim.keymap.set('n', '<leader>fg', plugin_fzf_lua.live_grep, {})
vim.keymap.set('n', '<leader>/', plugin_fzf_lua.lines, {})
vim.keymap.set('n', '<C-t>', ':tabnew<CR>', {})
vim.keymap.set('n', '<leader>tn', ':tabn<CR>', {})
vim.keymap.set('n', '[t', ':tabp<CR>', {})
vim.keymap.set('n', ']t', ':tabn<CR>', {})
vim.keymap.set('n', '<leader>g', ':Git blame<CR>')
vim.api.nvim_set_keymap('n', '<leader>y', '"+y', { noremap = true, silent = true })
vim.api.nvim_set_keymap('v', '<leader>y', '"+y', { noremap = true, silent = true })
vim.api.nvim_set_keymap('n', '<leader>Y', '"+Y', { noremap = true, silent = true })
vim.lsp.enable({ 'gopls', 'ts_ls', 'lua_ls' })
vim.keymap.set("n", "gd", vim.lsp.buf.definition)
vim.keymap.set("n", "gh", vim.lsp.buf.hover)
vim.keymap.set("n", "<leader>vd", vim.diagnostic.open_float)
vim.keymap.set("n", "[d", vim.diagnostic.goto_prev)
vim.keymap.set("n", "]d", vim.diagnostic.goto_next)
vim.keymap.set("n", "<leader>ca", vim.lsp.buf.code_action)
vim.keymap.set("n", "gr", vim.lsp.buf.references)
vim.keymap.set("n", "<leader>rr", vim.lsp.buf.rename)
vim.keymap.set("i", "<C-h>", vim.lsp.buf.signature_help)
vim.keymap.set("n", "<leader>f", vim.lsp.buf.format)
