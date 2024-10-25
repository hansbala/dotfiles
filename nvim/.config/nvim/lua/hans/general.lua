-- General functions that aren't related to any plugins.
-- This is the stuff I find really useful to have around when I need it.

-- Create a function to reload the config
function ReloadConfig()
  for name,_ in pairs(package.loaded) do
    if name:match('^user') or name:match('^plugins') then
      package.loaded[name] = nil
    end
  end
  dofile(vim.fn.stdpath('config') .. '/init.lua')
  print("Neovim configuration reloaded!")
end

vim.keymap.set('n', '<leader>nr', ':lua ReloadConfig()<CR>', { noremap = true, silent = true })
