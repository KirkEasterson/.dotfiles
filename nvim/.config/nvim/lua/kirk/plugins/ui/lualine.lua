return {
  "nvim-lualine/lualine.nvim",
  dependencies = {
    "echasnovski/mini.icons",
  },
  event = {
    "BufNewFile",
    "BufReadPost",
  },
  opts = {
    disabled_filetypes = {
      statusline = {
        "alpha",
        "dashboard",
        "help",
        "lazy",
        "mason",
        "neogitstatus",
        "null-ls-info",
        "nvimtree",
        "packer",
        "scratch",
        "startify",
        "terminal",
        "toggleterm",
        "trouble",
      },
    },
    options = {
      globalstatus = true,
      component_separators = { left = "", right = "" },
      section_separators = { left = "", right = "" },
      refresh = {
        statusline = 50,
        -- tabline = 50,
        -- winbar = 50,
      },
    },
    sections = {
      lualine_b = {
        {
          "grapple",
          "overseer",
        },
      },
      lualine_c = {
        { "filename" },
        {
          "macro-recording",
          fmt = function()
            local reg = vim.fn.reg_recording()
            if reg == "" then
              return ""
            end
            return "Recording @" .. reg
          end,
        },
      },
    },
  },
}
