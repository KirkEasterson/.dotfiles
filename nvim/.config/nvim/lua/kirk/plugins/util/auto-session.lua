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
    local overseer = require("overseer")

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
        function()
          overseer.save_task_bundle(
            get_cwd_as_name(),
            -- Passing nil will use config.opts.save_task_opts. You can call list_tasks() explicitly and
            -- pass in the results if you want to save specific tasks.
            nil,
            { on_conflict = "overwrite" } -- Overwrite existing bundle, if any
          )
        end,
      },
      pre_restore_cmds = {
        function()
          for _, task in ipairs(overseer.list_tasks({})) do
            task:dispose(true)
          end
        end,
      },
      post_restore_cmds = {
        function()
          overseer.load_task_bundle(get_cwd_as_name(), { ignore_missing = true })
        end,
      },
    })
  end,
  init = function()
    local session_opts = {
      "blank",
      "buffers",
      "curdir",
      -- "folds",
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
