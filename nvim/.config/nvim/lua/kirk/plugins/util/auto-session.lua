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
  opts = {
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
  },
  init = function()
    local session_opts = {
      "buffers",
      "curdir",
      -- "folds",
      -- "globals",
      "help",
      "localoptions",
      "options",
      "resize",
      "tabpages",
      "terminal",
      "winpos",
      "winsize",
    }
    vim.o.sessionoptions = table.concat(session_opts, ",")
  end,
}
