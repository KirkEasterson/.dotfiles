vim.o.autocomplete = true
vim.o.autocompletedelay = 200
vim.opt.complete:append("o") -- append omnifunc
vim.opt.completeopt = {
  "menuone",
  "noselect",
  -- "popup", -- TODO: see if I want this, and if it can be formatted
  "fuzzy",
}

vim.api.nvim_set_hl(0, "Pmenu", { bg = "#444444", fg = "#ffffff" })
vim.api.nvim_set_hl(0, "PmenuKind", { bg = "#333333", fg = "#ffffff" })
vim.api.nvim_set_hl(0, "PmenuExtra", { bg = "#222222", fg = "#ffffff" })
vim.api.nvim_set_hl(0, "PmenuSel", { bg = "#555555", fg = "#ffffff" })
vim.api.nvim_set_hl(0, "PmenuBorder", { bg = "#000000", fg = "#ffffff" })

-- default to first match if none selected
vim.keymap.set("i", "<C-y>", function()
  if vim.fn.pumvisible() ~= 0 then
    if vim.fn.complete_info()["selected"] == -1 then
      return "<C-n><C-y>"
    end
    return "<C-y>"
  end
  return "<CR>"
end, { expr = true })

vim.api.nvim_create_autocmd("LspAttach", {
  group = vim.api.nvim_create_augroup("native_lsp_completion", { clear = true }),
  desc = "Enable native auto-completion",
  callback = function(args)
    local client = vim.lsp.get_client_by_id(args.data.client_id)
    if client and client.supports_method("textDocument/completion") then
      vim.lsp.completion.enable(true, args.data.client_id, args.buf, {
        autotrigger = true,
      })
    end
  end,
})
