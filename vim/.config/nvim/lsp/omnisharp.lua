---@type vim.lsp.Config
return {
  -- handlers = {
  -- 	["textDocument/definition"] = require("omnisharp_extended").handler,
  -- },
  cmd = {
    "omnisharp",
    "--languageserver",
    "--hostPID",
    tostring(vim.fn.getpid()),
  },
  enable_import_completion = true,
  organize_imports_on_format = true,
}
