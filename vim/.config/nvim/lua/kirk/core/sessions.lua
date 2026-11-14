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

-- ensure sessions dir exists
local sessions_dir = vim.fn.stdpath("data") .. "/sessions"
vim.fn.mkdir(sessions_dir, "p")

-- CORE FUNCTIONALITY

local disable_autosave = false -- to avoid delete-then-autosave loops

local function encode(str)
  if not str then
    return ""
  end
  -- include periods to avoid path traversal
  -- uppercase encodings for readability
  return vim.uri_encode(str, "rfc2732"):gsub("%.", "%%2e"):gsub("%%%x%x", string.upper)
end

local vim_escape = function(str)
  -- vim cmds require % (and others) is escaped with \%
  -- :sub() strips the single quotes
  return vim.fn.shellescape(str, 1):sub(2, -2)
end

local get_session_filepath = function()
  local cwd = vim.uv.cwd()
  local filename = encode(cwd) .. ".vim"
  return sessions_dir .. "/" .. filename
end

local load_session = function()
  local session_filepath = get_session_filepath()
  if vim.uv.fs_stat(session_filepath) == nil then
    return
  end
  vim.cmd.source({
    args = { vim_escape(session_filepath) },
  })
end

local save_session = function()
  local session_filepath = get_session_filepath()
  vim.cmd.mksession({
    args = { vim_escape(session_filepath) },
    bang = true,
  })
  disable_autosave = false
end

local delete_session = function()
  local session_filepath = get_session_filepath()
  if vim.fn.filereadable(session_filepath) ~= 1 then
    return
  end
  os.remove(session_filepath)
  disable_autosave = true
end

-- USER COMMAND

local cmd_handler = function(opts)
  local args = vim.trim(opts.args)
  if args == "save" then
    save_session()
  elseif args == "load" then
    load_session()
  elseif args == "delete" then
    delete_session()
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
    load_session()
  end,
})
vim.api.nvim_create_autocmd({ "VimLeavePre" }, {
  desc = "Load session at startup",
  group = session_group,
  callback = function()
    if disable_autosave then
      return
    end
    save_session()
  end,
})
