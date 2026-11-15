local session_opts = {
  "buffers",
  "curdir",
  "folds",
  "globals",
  "help",
  "localoptions",
  "options",
  -- "resize", -- DO NOT ENABLE: this cause rendering issues with tiling window managers
  "tabpages",
  "terminal",
  "winpos",
  "winsize",
}
vim.o.sessionoptions = table.concat(session_opts, ",")

-- USER COMMAND

local cmd_handler = function(opts)
  local sessions = require("kirk.export.session")
  local args = vim.split(vim.trim(opts.args), " ", { trimempty = true })
  if args[1] == "save" then
    sessions.save_session(vim.list_slice(args, 2))
  elseif args[1] == "load" then
    sessions.load_session(vim.list_slice(args, 2))
  elseif args[1] == "delete" then
    sessions.delete_session(vim.list_slice(args, 2))
  else
    vim.notify("invalid argument to [Session]", vim.log.levels.ERROR)
  end
end

vim.api.nvim_create_user_command("Session", cmd_handler, { desc = "Manage sessions", nargs = "+" })

-- AUTOCMDS

local session_group = vim.api.nvim_create_augroup("Sessions", {})
vim.api.nvim_create_autocmd({ "VimEnter" }, {
  desc = "Load session at startup",
  group = session_group,
  callback = function()
    require("kirk.export.session").load_session()
  end,
})
vim.api.nvim_create_autocmd({ "VimLeavePre" }, {
  desc = "Load session at startup",
  group = session_group,
  callback = function()
    if disable_autosave then
      return
    end
    require("kirk.export.session").save_session()
  end,
})
