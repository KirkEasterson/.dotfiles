local function create_grapple_mapping(k)
  return {
    "<leader>" .. tostring(k),
    function()
      local grapple = require("grapple")
      if grapple.exists({ index = k }) then
        grapple.select({ index = k })
      end
    end,
    desc = "Grapple file " .. tostring(k),
  }
end

return {
  "cbochs/grapple.nvim",
  dependencies = {
    "echasnovski/mini.icons",
  },
  event = "VeryLazy",
  cmd = "Grapple",
  opts = {
    scope = "git_branch",
  },
  keys = {
    {
      "<leader>ht",
      function()
        require("grapple").toggle()
      end,
      desc = "Grapple toggle tag",
    },
    {
      "<leader>hr",
      function()
        require("grapple").reset()
      end,
      desc = "Grapple reset tags",
    },
    {
      "<leader>hw",
      function()
        require("grapple").toggle_tags()
      end,
      desc = "Grapple open tags window",
    },
    create_grapple_mapping(1),
    create_grapple_mapping(2),
    create_grapple_mapping(3),
    create_grapple_mapping(4),
  },
  -- keys = vim.tbl_extend(
  --   "error",
  --   require("util").fmap({ 1, 2, 3, 4 }, function(v)
  --     return {
  --       "<leader>" .. tostring(v),
  --       function()
  --         local grapple = require("grapple")
  --         if grapple.exists({ index = v }) then
  --           grapple.select({ index = v })
  --         end
  --       end,
  --       desc = "Grapple file " .. tostring(v),
  --     }
  --   end),
  --   {
  --
  --     {
  --       "<leader>ht",
  --       function()
  --         require("grapple").toggle()
  --       end,
  --       desc = "Grapple toggle tag",
  --     },
  --     {
  --       "<leader>hr",
  --       function()
  --         require("grapple").reset()
  --       end,
  --       desc = "Grapple reset tags",
  --     },
  --     {
  --       "<leader>hw",
  --       function()
  --         require("grapple").toggle_tags()
  --       end,
  --       desc = "Grapple open tags window",
  --     },
  --   }
  -- ),
}
