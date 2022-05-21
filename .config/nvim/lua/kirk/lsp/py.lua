require('kirk.lsp.on_attach')

-- https://github.com/microsoft/pyright
require'lspconfig'.pyright.setup{
  capabilities=capabilities,
  on_attach = on_attach,
}

