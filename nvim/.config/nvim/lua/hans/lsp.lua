local lsp = require('lspconfig')
local cfg = {}

local servers = {"tsserver", "eslint"}

for _, server in pairs(servers) do
  lsp[server].setup {}
end


