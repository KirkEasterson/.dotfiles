local sessions_dir = vim.fn.stdpath("data") .. "/sessions"
vim.fn.mkdir(sessions_dir, "p")

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

local function get_git_branch()
  local branch = vim.fn.system("git branch --show-current")
  if vim.v.shell_error ~= 0 then
    return nil -- Not a git repository
  end
  return vim.trim(branch)
end

local get_session_filepath = function()
  local cwd = vim.uv.cwd()
  local git_branch = get_git_branch()
  if git_branch ~= "" then
    cwd = cwd .. "|" .. git_branch
  end
  local filename = encode(cwd) .. ".vim"
  return sessions_dir .. "/" .. filename
end

local parse_session_file_path = function(session_filepath)
  if session_filepath == nil or next(session_filepath) == nil then
    return get_session_filepath()
  end
  return session_filepath[1]
end

local M = {}

-- to avoid delete-then-autosave loops
M.disable_autosave = false

function M.load_session(session_filepath)
  -- TODO: close all current buffers before loading
  session_filepath = parse_session_file_path(session_filepath)
  if vim.uv.fs_stat(session_filepath) == nil then
    return
  end
  vim.cmd.source({
    args = { vim_escape(session_filepath) },
  })
end

function M.save_session(session_filepath)
  session_filepath = parse_session_file_path(session_filepath)
  vim.cmd.mksession({
    args = { vim_escape(session_filepath) },
    bang = true,
  })
  M.disable_autosave = false
end

function M.delete_session(session_filepath)
  session_filepath = parse_session_file_path(session_filepath)
  if vim.fn.filereadable(session_filepath) ~= 1 then
    return
  end
  os.remove(session_filepath)
  M.disable_autosave = true
end

return M
