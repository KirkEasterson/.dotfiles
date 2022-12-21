-- https://github.com/latex-lsp/texlab

require'lspconfig'.texlab.setup{
  settings = {
    texlab = {
      build = {
        onSave = true
      }
    }
  }
}

