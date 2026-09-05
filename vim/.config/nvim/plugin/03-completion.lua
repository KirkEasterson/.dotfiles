local group = vim.api.nvim_create_augroup("LuasnipSetup", { clear = true })
vim.api.nvim_create_autocmd("PackChanged", {
  group = group,
  desc = "Build luasnip",
  callback = function(ev)
    local name, kind = ev.data.spec.name, ev.data.kind
    if name == "LuaSnip" and (kind == "update" or kind == "install") then
      -- TODO: check that this is correct
      vim.cmd("make install_jsregexp")
    end
  end,
})

vim.schedule(function()
  vim.pack.add({
    -- lua completion
    { src = "https://github.com/folke/lazydev.nvim", version = vim.version.range("*") },
    "https://github.com/Bilal2453/luvit-meta",
    "https://github.com/gonstoll/wezterm-types",

    -- snippets
    "https://github.com/rafamadriz/friendly-snippets",
    { src = "https://github.com/L3MON4D3/LuaSnip", version = vim.version.range("*") },
  })

  require("lazydev").setup({
    library = {
      { path = "${3rd}/luv/library", words = { "vim%.uv" } },
      { path = "wezterm-types", mods = { "wezterm" } },
      { path = "nvim-dap-ui" },
    },
  })

  require("luasnip").setup()
  require("luasnip.loaders.from_vscode").lazy_load()

  -- disable default snippet bindings
  vim.keymap.del({ "s", "i" }, "<Tab>")
  vim.keymap.del({ "s", "i" }, "<S-Tab>")

  local ls = require("luasnip")
  vim.keymap.set({ "i" }, "<C-t>", function()
    ls.expand()
  end, { desc = "Snippet - expand" })

  vim.keymap.set({ "i", "s" }, "<C-j>", function()
    ls.jump(1)
  end, { desc = "Snippet - next" })
  vim.keymap.set({ "i", "s" }, "<C-k>", function()
    ls.jump(-1)
  end, { desc = "Snippet - prev" })

  vim.keymap.set({ "i", "s" }, "<C-S-j>", function()
    if ls.choice_active() then
      ls.change_choice(1)
    end
  end, { desc = "Snippet - next choice" })
  vim.keymap.set({ "i", "s" }, "<C-S-k>", function()
    if ls.choice_active() then
      ls.change_choice(-1)
    end
  end, { desc = "Snippet - prev choice" })
end)
