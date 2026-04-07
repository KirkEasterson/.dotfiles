vim.pack.add({
  -- ALREADY LOADED DEPENDENCIES
  -- "https://github.com/rmagatti/auto-session",
  -- "https://github.com/folke/snacks.nvim",
  -- "https://github.com/echasnovski/mini.icons",

  "https://github.com/nvim-lua/plenary.nvim",
  "https://github.com/ruifm/gitlinker.nvim",
  "https://github.com/lewis6991/gitsigns.nvim",
  "https://github.com/sindrets/diffview.nvim",
  { src = "https://github.com/kirkeasterson/neogit", version = "kirk/hooks" },
})

require("gitlinker").setup({
  mappings = "<leader>gy",
  opts = {
    print_url = false,
    add_current_line_on_normal_mode = false,
  },
})

require("gitsigns").setup({
  trouble = false,
  attach_to_untracked = false,
  linehl = false,
  numhl = false,
  -- word_diff = true,
  watch_gitdir = {
    follow_files = true,
  },

  signs = {
    add = { text = "┃" },
    change = { text = "┃" },
    changedelete = { text = "┃" },
    delete = { text = "┃" },
    topdelete = { text = "┃" },
    untracked = { text = "┃" },
  },

  signs_staged = {
    add = { text = "║" },
    change = { text = "║" },
    changedelete = { text = "║" },
    delete = { text = "║" },
    topdelete = { text = "║" },
  },

  current_line_blame = false,
  current_line_blame_opts = {
    delay = 10,
  },
  current_line_blame_formatter = function(name, blame_info)
    if blame_info.author == name then
      blame_info.author = "You"
    end

    local message = string.format(
      "%s  %s  %s",
      blame_info.author,
      os.date("%Y-%b-%d", blame_info.author_time),
      blame_info.summary
    )

    return { { "  " .. message, "GitSignsCurrentLineBlame" } }
  end,
})

--- toggle diffview views
--- @param open_view function function to open the view
local function toggle_view(open_view)
  if next(require("diffview.lib").views) == nil then
    open_view()
  else
    require("diffview").close()
  end
end

require("diffview").setup({
  enhanced_diff_hl = true,
  show_help_hints = false,
  view = {
    default = {
      winbar_info = true,
    },
    merge_tool = {
      winbar_info = true,
    },
    file_history = {
      winbar_info = true,
    },
  },
  file_panel = {
    win_config = {
      position = "bottom",
      height = 10,
    },
  },
  file_history_panel = {
    win_config = {
      position = "bottom",
      height = 10,
    },
  },
})

require("neogit").setup({
  hooks = {
    ["PreBranchCheckout"] = function()
      local neogit = require("neogit")
      local autosession = require("auto-session")

      neogit.close()
      autosession.SaveSession(nil, false)
      neogit.open()
    end,
  },
  auto_show_console = false,
  console_timeout = 5000,
  disable_commit_confirmation = true,
  disable_hint = true,
  disable_insert_on_commit = false, -- start commits in insert mode
  prompt_amend_commit = false, -- no confirmation for already published commits
  process_spinner = true,
  graph_style = "unicode",
  use_per_project_settings = false,
  -- telescope_sorter = function()
  --   return require("telescope").extensions.fzf.native_fzf_sorter()
  -- end,
  signs = {
    -- { CLOSED, OPENED }
    hunk = { "", "" },
    item = { "", "" },
    section = { "", "" },
  },
  diff_viewer = "diffview",
  integrations = {
    snacks = true,
    diffview = true,
    fzf_lua = false,
    telescope = false,
    mini_pick = false,
    codediff = false,
  },
})

local neogit_group = vim.api.nvim_create_augroup("UserNeogitEvents", { clear = true })

vim.api.nvim_create_autocmd({ "User" }, {
  desc = "Load session for checked out branch",
  pattern = "NeogitBranchCheckout",
  group = neogit_group,
  callback = function()
    local neogit = require("neogit")
    local autosession = require("auto-session")

    neogit.close()
    vim.cmd([[%bd!]])
    autosession.RestoreSession("", { show_message = false })
    autosession.SaveSession(nil, false) -- in case there was no session to restore
    neogit.open()
  end,
})

vim.api.nvim_create_autocmd({ "User" }, {
  desc = "Create new session for new branches",
  pattern = { "NeogitBranchCreate", "NeogitBranchRename" },
  group = neogit_group,
  callback = function()
    local neogit = require("neogit")
    local autosession = require("auto-session")

    neogit.close()
    autosession.SaveSession(nil, false)
    neogit.open()
  end,
})

vim.keymap.set({ "n" }, "<leader>bt", function()
  require("gitsigns").toggle_current_line_blame()
end, { desc = "Toggle line blame" })
vim.keymap.set({ "n" }, "[c", function()
  require("gitsigns").nav_hunk("prev", { wrap = true })
end, { desc = "Prev hunk" })
vim.keymap.set({ "n" }, "]c", function()
  require("gitsigns").nav_hunk("next", { wrap = true })
end, { desc = "Next hunk" })
vim.keymap.set({ "n" }, "[C", function()
  require("gitsigns").nav_hunk("first")
end, { desc = "First hunk" })
vim.keymap.set({ "n" }, "]C", function()
  require("gitsigns").nav_hunk("last")
end, { desc = "Last hunk" })

vim.keymap.set({ "n" }, "<leader>dvo", function()
  toggle_view(function()
    require("diffview").open({
      require("util").git_default_branch(),
      "--untracked-files=no",
    })
  end)
end, { desc = "Toggle diff view" })
vim.keymap.set({ "n" }, "<leader>dvh", function()
  toggle_view(function()
    vim.cmd.DiffviewFileHistory("%")
  end)
end, { desc = "Diff view file history" })
vim.keymap.set({ "n" }, "<leader>dvH", function()
  toggle_view(function()
    require("diffview").file_history(nil, {})
  end)
end, { desc = "Diff view branch history" })

vim.keymap.set({ "n" }, "<leader>gg", function()
  -- TODO: make this toggle neogit
  require("neogit").open()
end, { desc = "Neogit" })
