return {
  "kevinhwang91/nvim-ufo",
  enabled = false,
  dependencies = {
    "kevinhwang91/promise-async",
    "nvim-treesitter/nvim-treesitter",
  },
  event = {
    "BufNewFile",
    "BufReadPost",
  },
  cmd = {
    "UfoEnable",
    "UfoDisable",
    "UfoInspect",
    "UfoAttach",
    "UfoDetach",
    "UfoEnableFold",
    "UfoDisableFold",
  },
  keys = {
    {
      "z", -- prefix for fold functionality
      -- "zo", -- open fold under cursor
      -- "zc", -- close fold under cursor
      -- "za", -- toggle fold under cursor
    },
    {
      "zR",
      function()
        require("ufo").openAllFolds()
      end,
      desc = "Open all folds",
    },
    {
      "zM",
      function()
        require("ufo").closeAllFolds()
      end,
      desc = "Close all folds",
    },
  },
  opts = {
    provider_selector = function(bufnr, filetype, buftype)
      return { "treesitter", "indent" }
    end,
  },
  config = function(_, opts)
    require("ufo").setup(opts)

    -- disable UFO for certain filetypes
    vim.api.nvim_create_autocmd("FileType", {
      pattern = {
        "NeogitStatus",
        "git",
        "markdown",
      },
      callback = function()
        require("ufo").detach()
        vim.opt_local.foldenable = false
        vim.opt_local.foldcolumn = "0"
      end,
    })
  end,
  init = function()
    vim.o.foldcolumn = "1" -- '0' is not bad
    vim.o.foldlevel = 99 -- Using ufo provider need a large value, feel free to decrease the value
    vim.o.foldlevelstart = 99
    vim.o.foldenable = true
  end,
}
