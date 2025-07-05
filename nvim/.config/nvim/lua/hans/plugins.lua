require("lazy").setup({
  ---------- UI ----------
  { "ellisonleao/gruvbox.nvim",    priority = 1000,      config = true, opts = ... },
  "tanvirtin/monokai.nvim",
  { 'projekt0n/github-nvim-theme', name = 'github-theme' },
  { 'f-person/auto-dark-mode.nvim' },
  -------- END UI --------

  ------- Utilities -------
  "nvim-tree/nvim-tree.lua",
  "tpope/vim-fugitive",
  "tpope/vim-unimpaired",
  {
    "zbirenbaum/copilot.lua",
    cmd = "Copilot",
    event = "InsertEnter",
    config = function()
      require("hans.copilot")()
    end,
  },
  {
    "ibhagwan/fzf-lua",
    dependencies = { "nvim-tree/nvim-web-devicons" },
  },
  ----- END Utilities -----

  ---------- LSP ----------
  {
    'VonHeikemen/lsp-zero.nvim',
    branch = 'v1.x',
    dependencies = {
      -- LSP Support
      {
        'neovim/nvim-lspconfig',
        event = { "BufReadPre", "BufNewFile" }, -- Load LSP-related plugins on file read or creation
      },
      {
        'williamboman/mason.nvim',
        cmd = { "Mason", "MasonInstall" }, -- Load Mason on demand
      },
      {
        'williamboman/mason-lspconfig.nvim',
        event = { "BufReadPre", "BufNewFile" }, -- Load along with lspconfig
      },
      -- Autocompletion
      {
        'hrsh7th/nvim-cmp',
        event = "InsertEnter",            -- Load nvim-cmp on entering Insert mode
        dependencies = {
          { 'hrsh7th/cmp-buffer' },       -- Buffer completion source
          { 'hrsh7th/cmp-path' },         -- File path completion source
          { 'hrsh7th/cmp-nvim-lsp' },     -- LSP completion source
          { 'hrsh7th/cmp-nvim-lua' },     -- Neovim Lua API completion
          { 'saadparwaiz1/cmp_luasnip' }, -- Snippet completions
        },
      },
      -- Snippets
      {
        'L3MON4D3/LuaSnip',
        event = "InsertEnter", -- Load snippets when entering Insert mode
      },
      {
        'rafamadriz/friendly-snippets',
        event = "InsertEnter", -- Load snippets when entering Insert mode
      },
    },
  },
  ---------- END LSP ----------
})
