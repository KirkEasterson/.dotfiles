-- https://github.com/microsoft/pyright

require'lspconfig'.pyright.setup{
  capabilities=capabilities,
  on_attach = function()
    vim.keymap.set("n", "K", vim.lsp.buf.hover, {buffer=0})
    vim.keymap.set("n", "gd", vim.lsp.buf.definition, {buffer=0})
    vim.keymap.set("n", "gt", vim.lsp.buf.type_definition, {buffer=0})
    vim.keymap.set("n", "gi", vim.lsp.buf.implementation, {buffer=0})
    vim.keymap.set("n", "ga", vim.lsp.buf.code_action, {buffer=0})
    vim.keymap.set("n", "ff", vim.lsp.buf.formatting, {buffer=0})
    vim.keymap.set("n", "<leader>dj", vim.diagnostic.goto_next, {buffer=0})
    vim.keymap.set("n", "<leader>dk", vim.diagnostic.goto_prev, {buffer=0})
    vim.keymap.set("n", "<leader>r", vim.lsp.buf.rename, {buffer=0})
  end,
}

