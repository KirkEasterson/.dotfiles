return {
  "goolord/alpha-nvim",
  enabled = false,
  dependencies = {
    "echasnovski/mini.icons",
    "BlakeJC94/alpha-nvim-fortune",
    -- "folke/drop.nvim",
  },
  lazy = false,
  priority = 998, -- 1 less than gruvbox
  config = function(_, opts)
    local art = require("art")

    local dashboard = require("alpha.themes.dashboard")

    local fortune = require("alpha.fortune")
    dashboard.section.footer.val = fortune()
    dashboard.section.header.val = art.fish
    dashboard.section.buttons.val = {
      dashboard.button("n", "  > New file", ":ene <BAR> startinsert <CR>"),
      dashboard.button("e", "  > File tree", ":NvimTreeOpen<CR>"),
      dashboard.button("q", "󰅚  > Quit NVIM", ":qa<CR>"),
    }

    require("alpha").setup(dashboard.opts)
  end,
  init = function()
    vim.api.nvim_create_autocmd({ "FileType" }, {
      pattern = { "alpha" },
      callback = function()
        vim.opt_local.foldenable = false
      end,
      desc = "Disable folding in Alpha",
    })

    vim.api.nvim_create_autocmd("User", {
      pattern = { "AlphaReady" },
      callback = function()
        local prev_cmdheight = vim.opt.cmdheight
        local prev_showtabline = vim.opt.showtabline
        local prev_laststatus = vim.opt.laststatus

        vim.opt.cmdheight = 0
        vim.opt.showtabline = 0
        vim.opt.laststatus = 0

        vim.api.nvim_create_autocmd("BufUnload", {
          pattern = "<buffer>",
          callback = function()
            vim.opt.cmdheight = prev_cmdheight
            vim.opt.showtabline = prev_showtabline
            vim.opt.laststatus = prev_laststatus
          end,
        })
      end,
      desc = "Disable Bufferline And Lualine in Alpha",
    })
  end,
}
