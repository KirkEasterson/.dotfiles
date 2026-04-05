-- disable netrw
vim.g.loaded_netrw = 1
vim.g.loaded_netrwPlugin = 1

vim.pack.add({
  -- ALREADY LOADED DEPENDENCIES
  -- "https://github.com/echasnovski/mini.icons",

  "https://github.com/nvim-tree/nvim-tree.lua",
})

require("nvim-tree").setup({
  on_attach = function(bufnr)
    local api = require("nvim-tree.api")
    local function opts(desc)
      return {
        desc = "nvim-tree: " .. desc,
        buffer = bufnr,
        noremap = true,
        silent = true,
        nowait = true,
      }
    end

    api.config.mappings.default_on_attach(bufnr)
    vim.keymap.set("n", "<C-s>", api.node.open.horizontal, opts("Open: Horizontal Split"))
    vim.keymap.set("n", "[d", api.node.navigate.diagnostics.prev, opts("Prev Diagnostic"))
    vim.keymap.set("n", "]d", api.node.navigate.diagnostics.next, opts("Next Diagnostic"))
  end,
  sort_by = "case_sensitive",
  sync_root_with_cwd = true,
  respect_buf_cwd = true,
  disable_netrw = true,
  update_focused_file = {
    enable = true,
    update_root = {
      enable = true,
    },
  },
  view = {
    adaptive_size = false,
    side = "right",
    signcolumn = "yes",
    number = false,
    relativenumber = false,
  },
  renderer = {
    add_trailing = true,
    highlight_git = "all",
    highlight_modified = "all",
    icons = {
      git_placement = "after",
      modified_placement = "after",
      show = {
        folder_arrow = false,
      },
    },
    indent_markers = {
      enable = true,
      icons = {
        corner = "└",
        edge = "│",
        item = "├",
        bottom = "─",
        none = " ",
      },
    },
  },
  diagnostics = {
    enable = true,
    show_on_dirs = true,
  },
  git = {
    ignore = false,
  },
  actions = {
    change_dir = {
      enable = false,
    },
  },
  notify = {
    threshold = vim.log.levels.WARN,
  },
})

vim.keymap.set({ "n" }, "<leader>e", function()
  require("nvim-tree.api").tree.toggle()
end, { desc = "File tree" })
