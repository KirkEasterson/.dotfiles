return {
  "goolord/alpha-nvim",
  dependencies = {
    "nvim-tree/nvim-web-devicons",
    "BlakeJC94/alpha-nvim-fortune",
  },
  lazy = false,
  priority = 998, -- 1 less than gruvbox
  config = function(_, opts)
    local art = require("art")
    local util = require("util")

    local month_arts = {
      [1] = art.new_years3,
      [2] = art.valentines2,
      [3] = art.st_paddys2,
      [4] = art.easter2,
      [5] = art.flowers2,
      [6] = art.summer2,
      [7] = art.moon2,
      [8] = art.summer2,
      [9] = art.fall2,
      [10] = art.halloween2,
      [11] = art.thanksgiving2,
      [12] = art.christmas2,
    }

    local dashboard = require("alpha.themes.dashboard")

    -- local neovimlogo = art.neovim[math.random(#art.neovim)]
    local neovimlogo = art.neovim[1]

    local asciiart = month_arts[os.date("*t").month]
    math.randomseed(os.time(os.date("!*t")))
    if math.random() < 0.01 then
      -- something sus
      asciiart = art.amogus
    end
    asciiart = util.tbl_cpad(asciiart, vim.fn.strdisplaywidth(neovimlogo[1]))

    local completesign = util.table_concat(neovimlogo, { "" }, asciiart)
    dashboard.section.header.val = completesign

    dashboard.section.buttons.val = {
      dashboard.button("n", "  > New file", ":ene <BAR> startinsert <CR>"),
      dashboard.button("f", "󰈞  > Find file", ":Telescope find_files<CR>"),
      dashboard.button("o", "  > Recent", ":Telescope oldfiles<CR>"),
      dashboard.button("r", "󰦛  > Restore session", ":SessionRestore<CR>"),
      dashboard.button("e", "  > File tree", ":NvimTreeOpen<CR>"),
      dashboard.button("q", "󰅚  > Quit NVIM", ":qa<CR>"),
    }

    local fortune = require("alpha.fortune")
    dashboard.section.footer.val = fortune()

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
