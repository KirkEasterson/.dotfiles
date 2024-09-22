return {
  "echasnovski/mini.starter",
  enabled = false,
  lazy = false,
  priority = 998, -- 1 less than gruvbox
  config = function(_, opts)
    local starter = require("mini.starter")
    starter.setup({
      items = {
        starter.sections.telescope(),
      },
      content_hooks = {
        starter.gen_hook.adding_bullet(" "),
        starter.gen_hook.aligning("center", "center"),
      },
    })
  end,
}
