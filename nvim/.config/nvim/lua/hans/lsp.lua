local lsp = require('lspconfig')

local servers = { "tsserver", "eslint", "gopls" }

for _, server in pairs(servers) do
  lsp[server].setup {}
end
