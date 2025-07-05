return function()
  require("copilot").setup({
    panel = {
      enabled = true,
      auto_refresh = true,
      keymap = {
        open = "<M-CR>",
        jump_prev = "[[",
        jump_next = "]]",
        accept = "<CR>",
        refresh = "gr",
        open_split = "<C-s>",
      },
      layout = {
        position = "bottom",
        ratio = 0.4,
      },
    },
    suggestion = {
      enabled = true,
      auto_trigger = true,
      debounce = 75,
      keymap = {
        accept = "<M-a>",
        next = "<M-n>",
        prev = "<M-p>",
        dismiss = "<M-x>",
      },
    },
    filetypes = {
      yaml = true,
      markdown = true,
      help = false,
      gitcommit = true,
      gitrebase = false,
      ["*"] = true,
    },
    copilot_node_command = "node",
    server_opts_overrides = {},
  })
end
