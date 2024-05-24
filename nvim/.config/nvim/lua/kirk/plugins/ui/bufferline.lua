return {
  "akinsho/bufferline.nvim",
  dependencies = {
    -- 'neovim/nvim-lspconfig',
    "nvim-tree/nvim-web-devicons",
  },
  event = {
    "BufNewFile",
    "BufReadPost",
  },
  branch = "main", -- TODO: remove this when new version is released
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
      "<C-1>",
      function()
        require("bufferline").go_to_buffer(1, true)
      end,
      desc = "Go to buffer 1",
    },
    {
      "<C-2>",
      function()
        require("bufferline").go_to_buffer(2, true)
      end,
      desc = "Go to buffer 2",
    },
    {
      "<C-3>",
      function()
        require("bufferline").go_to_buffer(3, true)
      end,
      desc = "Go to buffer 3",
    },
    {
      "<C-4>",
      function()
        require("bufferline").go_to_buffer(4, true)
      end,
      desc = "Go to buffer 4",
    },
    {
      "<C-5>",
      function()
        require("bufferline").go_to_buffer(5, true)
      end,
      desc = "Go to buffer 5",
    },
    {
      "<C-6>",
      function()
        require("bufferline").go_to_buffer(6, true)
      end,
      desc = "Go to buffer 6",
    },
    {
      "<C-7>",
      function()
        require("bufferline").go_to_buffer(7, true)
      end,
      desc = "Go to buffer 7",
    },
    {
      "<C-8>",
      function()
        require("bufferline").go_to_buffer(8, true)
      end,
      desc = "Go to buffer 8",
    },
    {
      "<C-9>",
      function()
        require("bufferline").go_to_buffer(9, true)
      end,
      desc = "Go to buffer 9",
    },
    -- { -- conflicts with resetting font size in terminals
    -- 	'<C-0>',
    -- 	function() require('bufferline').go_to_buffer(10, true) end,
    -- 	desc = "Go to buffer 10",
    -- },
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
