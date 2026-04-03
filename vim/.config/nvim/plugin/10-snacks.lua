vim.pack.add({
  "https://github.com/folke/snacks.nvim",
})

require("snacks").setup({
  picker = {
    enabled = true,
    prompt = " ",
    filename_bonus = true,
    cwd_bonus = true,
    layout = {
      preset = "ivy_split",
    },
  },
  image = {
    enabled = false,
  },
})

vim.keymap.set({ "n" }, "<leader>fk", function()
  require("snacks").picker.keymaps()
end, { desc = "Keymaps" })
vim.keymap.set({ "n" }, "<leader>fm", function()
  require("snacks").picker.marks()
end, { desc = "Marks" })

vim.keymap.set({ "n" }, "<leader>ff", function()
  require("snacks").picker.files({ hidden = true })
end, { desc = "Files" })
vim.keymap.set({ "n" }, "<leader>fb", function()
  require("snacks").picker.buffers()
end, { desc = "Buffers" })

vim.keymap.set({ "n" }, "<leader>fB", function()
  require("snacks").picker.lines()
end, { desc = "Current buffer" })
vim.keymap.set({ "n" }, "<leader>fg", function()
  require("snacks").picker.grep({ hidden = true })
end, { desc = "Grep" })
vim.keymap.set({ "n", "v" }, "<leader>fG", function()
  require("snacks").picker.grep_word({ hidden = true })
end, { desc = "Grep word" })

vim.keymap.set({ "n" }, "<leader>fd", function()
  require("snacks").picker.diagnostics({ hidden = true })
end, { desc = "Diagnostics" })
vim.keymap.set({ "n" }, "<leader>fD", function()
  require("snacks").picker.diagnostics_buffer({ hidden = true })
end, { desc = "Buffer diagnostics" })

vim.keymap.set({ "n" }, "<leader>fr", function()
  require("snacks").picker.lsp_references()
end, { desc = "LSP references" })
vim.keymap.set({ "n" }, "<leader>fi", function()
  require("snacks").picker.lsp_implementations()
end, { desc = "LSP implementations" })
vim.keymap.set({ "n" }, "<leader>fs", function()
  require("snacks").picker.lsp_symbols()
end, { desc = "LSP symbols" })
vim.keymap.set({ "n" }, "<leader>fS", function()
  require("snacks").picker.lsp_workspace_symbols()
end, { desc = "LSP workspace symbols" })

vim.keymap.set({ "n" }, "<leader>fl", function()
  require("snacks").picker.git_log()
end, { desc = "Git log" })
vim.keymap.set({ "n" }, "<leader>fL", function()
  require("snacks").picker.git_log_file()
end, { desc = "Git log file" })
