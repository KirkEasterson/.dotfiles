return {
  "NeogitOrg/neogit",
  dependencies = {
    "nvim-lua/plenary.nvim",
    "sindrets/diffview.nvim",

    "nvim-telescope/telescope.nvim",
    "nvim-telescope/telescope-fzf-native.nvim",
  },
  cmd = "Neogit",
  keys = {
    {
      "<leader>gg",
      function()
        -- TODO: make this toggle neogit
        require("neogit").open()
      end,
      desc = "Neogit",
    },
  },
  opts = {
    disable_commit_confirmation = true,
    disable_insert_on_commit = false, -- start commits in insert mode
    use_per_project_settings = false,
    kind = "split",
    graph_style = "unicode",
    telescope_sorter = function()
      return require("telescope").extensions.fzf.native_fzf_sorter()
    end,
    signs = {
      -- { CLOSED, OPENED }
      hunk = { "", "" },
      item = { "", "" },
      section = { "", "" },
    },
    integrations = {
      diffview = true,
      telescope = true,
      -- fzf_lua = true,
    },
    mappings = {
      status = {
        ["="] = "Toggle",
      },
    },
  },
}
