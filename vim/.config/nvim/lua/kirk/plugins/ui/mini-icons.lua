return {
  "nvim-mini/mini.icons",
  opts = {},
  config = function(_, opts)
    local mini_icons = require("mini.icons")
    mini_icons.setup(opts)
    mini_icons.mock_nvim_web_devicons()
  end,
}
