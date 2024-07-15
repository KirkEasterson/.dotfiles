return {
  "akinsho/bufferline.nvim",
  dependencies = {
    -- 'neovim/nvim-lspconfig',
    "nvim-tree/nvim-web-devicons",
  },
  lazy = false,
  event = {
    "BufNewFile",
    "BufReadPost",
  },
  keys = {
    {
      "<C-S-Tab>",
      function()
        require("bufferline").cycle(-1)
      end,
      desc = "Go to previous buffer",
    },
    {
      "<C-Tab>",
      function()
        require("bufferline").cycle(1)
      end,
      desc = "Go to next buffer",
    },
    {
      "<C-<>",
      function()
        require("bufferline").move(-1)
      end,
      desc = "Move buffer to the left",
    },
    {
      "<C->>",
      function()
        require("bufferline").move(1)
      end,
      desc = "Move buffer to the right",
    },
    {
      "<A-w>",
      function()
        require("bufferline").close_others()
      end,
      desc = "Close other buffers",
    },
  },
  opts = {
    options = {
      themable = true,
      right_mouse_command = "",
      middle_mouse_command = "bdelete! %d",
      separator_style = "thin",
      diagnostics = false,
      offsets = {
        {
          filetype = "NvimTree",
          text = "Files",
          text_align = "center",
          separator = true,
        },
      },
      hover = {
        enabled = true,
        delay = 10,
        reveal = { "close" },
      },
      numbers = function(opts)
        return opts.raise(opts.ordinal)
      end,
    },
  },
}
