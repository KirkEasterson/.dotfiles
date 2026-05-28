vim.pack.add({ "https://github.com/rmagatti/auto-session" })

require("auto-session").setup({
  log_level = vim.log.levels.ERROR,
  use_git_branch = true,
  continue_restore_on_error = false,
  session_lens = {
    load_on_setup = false,
  },
  close_unsupported_windows = true,
  close_filetypes_on_save = {
    "dashboard",
    "NeogitStatus",
    "NvimTree",
  },
})
