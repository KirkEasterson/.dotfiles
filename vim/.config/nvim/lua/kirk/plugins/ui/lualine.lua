return {
  "nvim-lualine/lualine.nvim",
  dependencies = {
    "echasnovski/mini.icons",
  },
  event = "UIEnter",
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
      theme = "16color",
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
      lualine_b = {},
      lualine_c = {
        {
          "filename",
          color = {
            gui = "bold",
          },
        },
        "diagnostics",
        {
          "branch",
          fmt = function(str)
            -- max_length = 20,
            if #str > 20 then
              str = str:sub(1, 19) .. "…"
            end
            return str
          end,
        },
        "diff",
      },
      lualine_x = {
        "overseer",
        "grapple",
        {
          "macro-recording",
          fmt = function()
            local reg = vim.fn.reg_recording()
            if reg == "" then
              return ""
            end
            return "recording @" .. reg
          end,
        },
      },
    },
  },
}
