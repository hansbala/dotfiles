-------------------------------------------------------
-- Plugins may use leader so necessary to be first.
-------------------------------------------------------
vim.g.mapleader = ' '

-------------------------------------------------------
-- Plugin Defs
-------------------------------------------------------
vim.pack.add({
  "https://github.com/neovim/nvim-lspconfig",
  "https://github.com/williamboman/mason.nvim",
  "https://github.com/saghen/blink.lib",
  "https://github.com/saghen/blink.cmp",
  "https://github.com/ibhagwan/fzf-lua",
  "https://github.com/nvim-tree/nvim-tree.lua",
  "https://github.com/tpope/vim-fugitive",
  "https://github.com/f-person/auto-dark-mode.nvim",
  "https://github.com/sindrets/diffview.nvim",
  "https://github.com/nvim-tree/nvim-web-devicons",
  "https://github.com/khoido2003/monokai-v2.nvim",
  "https://github.com/hansbala/raycast.nvim"
})

-------------------------------------------------------
-- Plugin Configuration
-------------------------------------------------------
local plugin_mason = require('mason')
local plugin_mason_registry = require('mason-registry')
local plugin_blink_cmp = require('blink.cmp')
local plugin_nvim_tree = require('nvim-tree')
local plugin_fzf_lua = require('fzf-lua')
local plugin_diffview = require('diffview')
local plugin_auto_darkmode = require('auto-dark-mode')
local plugin_nvim_web_devicons = require('nvim-web-devicons')

-- LSP Stuff
plugin_mason.setup({})
local lsp_packages = {
  gopls = 'gopls',
  ts_ls = 'typescript-language-server',
  lua_ls = 'lua-language-server',
}
local missing_lsp_packages = vim.tbl_filter(
  function(pkg) return not plugin_mason_registry.is_installed(pkg) end,
  vim.tbl_values(lsp_packages)
)
if #missing_lsp_packages > 0 then
  vim.cmd.MasonInstall({ args = missing_lsp_packages })
end
-- Autocomplete for neovim :)
vim.lsp.config('lua_ls', {
  settings = {
    Lua = {
      runtime = { version = 'LuaJIT' },
      workspace = { library = { vim.env.VIMRUNTIME .. '/lua' } },
    },
  },
})
vim.lsp.enable(vim.tbl_keys(lsp_packages))

-- Other plugins
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
  sort = { sorter = 'case_sensitive' },
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
  fzf_colors = true,
  keymap = {
    fzf = {
      ["ctrl-q"] = "select-all+accept",
    }
  }
})
plugin_diffview.setup({
  use_icons = false,
})
plugin_auto_darkmode.setup({
  update_interval = 1000,
  set_dark_mode = function()
    vim.cmd.colorscheme('monokai-pro-classic')
  end,
  set_light_mode = function()
    vim.cmd.colorscheme('raycast-light')
  end,
})
plugin_nvim_web_devicons.setup({})

-------------------------------------------------------
-- Options
-------------------------------------------------------
vim.opt.number = true
vim.opt.relativenumber = true
vim.opt.wrap = false
vim.opt.tabstop = 2
vim.opt.shiftwidth = 2
vim.opt.shiftround = true
vim.opt.expandtab = true
vim.opt.signcolumn = "yes"
vim.opt.cursorline = true
vim.opt.colorcolumn = "100"
vim.opt.splitright = true
vim.opt.splitbelow = true
vim.opt.swapfile = false

-------------------------------------------------------
-- Keymaps
-------------------------------------------------------
local map = vim.keymap.set

-- Keymap Helpers.
local function refresh_diffview()
  local view = require('diffview.lib').get_current_view()
  local file = view and view.panel and view.panel.cur_file
  local path = file and file.absolute_path

  vim.cmd.DiffviewClose()
  require('diffview').open(path and { '--selected-file=' .. path } or {})
end

local function find_all_files()
  plugin_fzf_lua.files({ hidden = true, no_ignore = true, follow = true })
end

local function copy_path_with_lines()
  local path = vim.fn.expand('%:.')
  local anchor = vim.fn.line('v')
  local cursor = vim.fn.line('.')
  local first, last = math.min(anchor, cursor), math.max(anchor, cursor)

  vim.fn.setreg('+', ('%s(%d-%d)'):format(path, first, last))
  print('Path with lines copied!')
end

local function jump_diagnostic(count)
  return function()
    vim.diagnostic.jump({ count = count, float = true })
  end
end

-- Movement
map('n', 'K', '7k')
map('n', 'J', '7j')
map('v', 'K', '7k')
map('v', 'J', '7j')
-- Windows and tabs
map('n', '<C-h>', '<C-w>h')
map('n', '<C-j>', '<C-w>j')
map('n', '<C-k>', '<C-w>k')
map('n', '<C-l>', '<C-w>l')
map('n', '<C-t>', '<Cmd>tabnew<CR>')
map('n', '<leader>w', '<Cmd>tabclose<CR>')
map('n', '<leader>q', '<Cmd>qa<CR>')
map('n', '[t', '<Cmd>tabprevious<CR>')
map('n', ']t', '<Cmd>tabnext<CR>')
-- Files and search
map('n', '<C-n>', '<Cmd>NvimTreeFindFileToggle<CR>')
map('n', '<leader>h', '<Cmd>nohlsearch<CR>')
map('n', '<leader>ff', plugin_fzf_lua.files)
map('n', '<leader>fa', find_all_files)
map('n', '<leader>fg', plugin_fzf_lua.live_grep)
map('n', '<leader>/', plugin_fzf_lua.lines)
-- Git
map('n', '<leader>g', '<Cmd>Git blame<CR>')
map('n', '<leader>dd', '<Cmd>DiffviewOpen<CR>')
map('n', '<leader>dr', refresh_diffview)
-- Clipboard
map('n', '<leader>y', '"+y')
map('v', '<leader>y', '"+y')
map('n', '<leader>Y', '"+Y')
map('v', '<leader>cp', copy_path_with_lines)
-- LSP and diagnostics
map('n', 'gd', vim.lsp.buf.definition)
map('n', 'gi', vim.lsp.buf.implementation)
map('n', 'gh', vim.lsp.buf.hover)
map('n', 'gr', vim.lsp.buf.references)
map('n', '<leader>ca', vim.lsp.buf.code_action)
map('n', '<leader>rr', vim.lsp.buf.rename)
map('n', '<leader>fm', vim.lsp.buf.format)
map('i', '<C-h>', vim.lsp.buf.signature_help)
map('n', '<leader>vd', vim.diagnostic.open_float)
map('n', '[d', jump_diagnostic(-1))
map('n', ']d', jump_diagnostic(1))

-------------------------------------------------------
-- User commands
-------------------------------------------------------
-- Cleanup unused packages from vim.pack.
  -- Remove once merged into release from upstream
vim.api.nvim_create_user_command(
  'PackClean',
  function()
    local unused = {}
    for _, plugin in ipairs(vim.pack.get(nil, { info = false })) do
      if not plugin.active then
        table.insert(unused, plugin.spec.name)
      end
    end
    vim.pack.del(unused)
  end,
  {}
)

