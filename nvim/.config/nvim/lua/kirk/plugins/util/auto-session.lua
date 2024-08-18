return {
  "rmagatti/auto-session",
  version = false,
  cmd = {
    "Autosession",
    "SessionDelete",
    "SessionPurgeOrphaned",
    "SessionRestore",
    "SessionRestoreFromFile",
    "SessionSave",
  },
  opts = {
    log_level = vim.log.levels.ERROR,
    auto_session_enable_last_session = false,
    auto_session_enabled = true,
    auto_session_create_enabled = true,
    auto_save_enabled = true,
    auto_restore_enabled = false,
    auto_session_use_git_branch = true,
    pre_save_cmds = {
      "NvimTreeClose",
    },
    session_lens = {
      load_on_setup = false,
    },
  },
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
