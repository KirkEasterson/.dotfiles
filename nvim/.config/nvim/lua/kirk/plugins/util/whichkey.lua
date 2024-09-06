-- local function create_goto_keymap(number)
--   return {
--     "<leader>" .. number,
--     function()
--       require("bufferline").go_to(number, true)
--     end,
--     desc = function()
--       local lazy = require("bufferline.lazy")
--       local state = lazy.require("bufferline.state")
--       local element = state.components[number]
--       local filename = element and element.name or "-"
--       return "Go to " .. filename
--     end,
--   }
-- end

return {
  "folke/which-key.nvim",
  dependencies = {
    "akinsho/bufferline.nvim",
  },
  event = "VeryLazy",
  cmd = "WhichKey",
  opts = {
    preset = "modern",
    delay = 1000,
    notify = false,
    show_help = false,
    spec = {
      -- create_goto_keymap(1),
      -- create_goto_keymap(2),
      -- create_goto_keymap(3),
      -- create_goto_keymap(4),
      -- create_goto_keymap(5),
      -- create_goto_keymap(6),
      -- create_goto_keymap(7),
      -- create_goto_keymap(8),
      -- create_goto_keymap(9),
      -- create_goto_keymap(0),
    },
  },
}
