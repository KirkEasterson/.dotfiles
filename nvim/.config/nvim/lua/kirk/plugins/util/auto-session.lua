return {
  "rmagatti/auto-session",
  lazy = false,
  cmd = {
    "Autosession",
    "SessionDelete",
    "SessionDisableAutoSave",
    "SessionPurgeOrphaned",
    "SessionRestore",
    "SessionSave",
    "SessionSearch",
    "SessionToggleAutoSave",
  },
  config = function(_, opts)
    local function get_cwd_as_name()
      local dir = vim.fn.getcwd(0)
      return dir:gsub("[^A-Za-z0-9]", "_")
    end

    require("auto-session").setup({
      log_level = vim.log.levels.ERROR,
      use_git_branch = true,
      continue_restore_on_error = false,
      session_lens = {
        load_on_setup = false,
      },
      bypass_save_filetypes = {
        "alpha",
        "dashboard",
      },
      pre_save_cmds = {
        "NvimTreeClose",
      },
    })
  end,
  init = function()
    local session_opts = {
      "blank",
      "buffers",
      "curdir",
      "folds",
      "help",
      "localoptions",
      "tabpages",
      "terminal",
      "winpos",
      "winsize",
    }
    vim.o.sessionoptions = table.concat(session_opts, ",")
  end,
}
