return {
  "Bekaboo/dropbar.nvim",
  dependencies = {
    "echasnovski/mini.icons",
  },
  event = {
    "BufNewFile",
    "BufReadPost",
  },
  opts = {
    bar = {
      menu = {
        preview = false,
      },
      sources = function(buf, _)
        local sources = require("dropbar.sources")
        if vim.bo[buf].ft == "markdown" then
          return {
            sources.path,
            sources.markdown,
          }
        end
        if vim.bo[buf].buftype == "terminal" then
          return {
            sources.terminal,
          }
        end
        return {
          sources.path,
        }
      end,
    },
  },
}
