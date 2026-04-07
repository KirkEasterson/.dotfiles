local group = vim.api.nvim_create_augroup("NeotestSetup", { clear = true })
vim.api.nvim_create_autocmd("PackChanged", {
  group = group,
  desc = "Build neotest-golang",
  callback = function(ev)
    local name, kind = ev.data.spec.name, ev.data.kind
    if name == "neotest-golang" and (kind == "update" or kind == "install") then
      vim.system({ "go", "install", "gotest.tools/gotestsum@latest" }):wait()
    end
  end,
})

vim.pack.add({
  -- ALREADY LOADED DEPENDENCIES
  -- "https://github.com/nvim-lua/plenary.nvim",
  -- "https://github.com/nvim-treesitter/nvim-treesitter",
  -- "https://github.com/rcarriga/nvim-dap-ui",

  "https://github.com/nvim-neotest/nvim-nio",
  "https://github.com/antoinemadec/FixCursorHold.nvim",
  "https://github.com/fredrikaverpil/neotest-golang",
  -- "https://github.com/marilari88/neotest-vitest",
  -- "https://github.com/rouge8/neotest-rust",
  -- "https://github.com/lawrence-laz/neotest-zig",

  "https://github.com/nvim-neotest/neotest",
})

-- TODO: find out where I got this from
local neotest_ns = vim.api.nvim_create_namespace("neotest")
vim.diagnostic.config({
  virtual_text = {
    format = function(diagnostic)
      local message = diagnostic.message:gsub("\n", " "):gsub("\t", " "):gsub("%s+", " "):gsub("^%s+", "")
      return message
    end,
  },
}, neotest_ns)

require("neotest").setup({
  level = vim.log.levels.DEBUG,
  adapters = {
    -- require("neotest-go")({
    --   experimental = {
    --     test_table = true,
    --   },
    --   args = { "-race", "-cover", "-timeout=60s" },
    --   recursive_run = true,
    -- }),
    -- require("neotest-rust"),
    -- require("neotest-zig")({
    --   dap = { adapter = "lldb" },
    -- }),
    require("neotest-golang")({
      warn_test_name_dupes = false, -- native go packages have many duplicate tests
    }),
    -- require("neotest-vitest"),
  },
  status = {
    virtual_text = false,
    signs = true,
  },
})

local open_clear_panel = function()
  require("neotest").summary.open()
  require("neotest").output_panel.clear()
  require("neotest").output_panel.open()
end

vim.keymap.set({ "n" }, "<leader>tr", function()
  open_clear_panel()
  require("neotest").run.run()
end, { desc = "Run test" })
vim.keymap.set({ "n" }, "<leader>tR", function()
  open_clear_panel()
  require("neotest").run.stop()
end, { desc = "Stop test" })
vim.keymap.set({ "n" }, "<leader>tf", function()
  open_clear_panel()
  require("neotest").run.run(vim.fn.expand("%"))
end, { desc = "Run test file" })
vim.keymap.set({ "n" }, "<leader>ts", function()
  open_clear_panel()
  require("neotest").run.run(vim.fn.getcwd())
end, { desc = "Run test suite" })
vim.keymap.set({ "n" }, "<leader>td", function()
  require("neotest").summary.open()
  require("neotest").run.run({ strategy = "dap" })
end, { desc = "Debug test" })

vim.keymap.set({ "n" }, "<leader>tt", function()
  require("neotest").summary.toggle()
  require("neotest").output_panel.toggle()
end, { desc = "Toggle test panel" })
vim.keymap.set({ "n" }, "<leader>ts", function()
  require("neotest").summary.toggle()
end, { desc = "Toggle test summary" })
vim.keymap.set({ "n" }, "<leader>to", function()
  require("neotest").output_panel.toggle()
end, { desc = "Toggle output panel" })

vim.keymap.set({ "n" }, "[t", function()
  require("neotest").jump.prev({ status = "failed" })
end, { desc = "Prev failing test" })
vim.keymap.set({ "n" }, "]t", function()
  require("neotest").jump.next({ status = "failed" })
end, { desc = "Next failing test" })
