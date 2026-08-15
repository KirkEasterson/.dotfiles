local mode_hls = {
  normal = { bg = "#0000ff", fg = "#ffffff" },
  insert = { bg = "#00ff00", fg = "#000000" },
  visual = { bg = "#ff00ff", fg = "#ffffff" },
  replace = { bg = "#ff0000", fg = "#ffffff" },
  misc = { bg = "#f0f0f0", fg = "#000000" },
}

local modes = {
  ["n"] = { label = "NORMAL", bg = mode_hls.normal.bg, fg = mode_hls.normal.fg },
  ["niI"] = { label = "NORMAL", bg = mode_hls.normal.bg, fg = mode_hls.normal.fg },
  ["niR"] = { label = "NORMAL", bg = mode_hls.normal.bg, fg = mode_hls.normal.fg },
  ["niV"] = { label = "NORMAL", bg = mode_hls.normal.bg, fg = mode_hls.normal.fg },
  ["nt"] = { label = "NORMAL", bg = mode_hls.normal.bg, fg = mode_hls.normal.fg },
  ["ntT"] = { label = "NORMAL", bg = mode_hls.normal.bg, fg = mode_hls.normal.fg },

  ["no"] = { label = "O-PENDING", bg = mode_hls.normal.bg, fg = mode_hls.normal.fg },
  ["nov"] = { label = "O-PENDING", bg = mode_hls.normal.bg, fg = mode_hls.normal.fg },
  ["noV"] = { label = "O-PENDING", bg = mode_hls.normal.bg, fg = mode_hls.normal.fg },
  ["no\22"] = { label = "O-PENDING", bg = mode_hls.normal.bg, fg = mode_hls.normal.fg },

  ["v"] = { label = "VISUAL", bg = mode_hls.visual.bg, fg = mode_hls.visual.fg },
  ["vs"] = { label = "VISUAL", bg = mode_hls.visual.bg, fg = mode_hls.visual.fg },
  ["V"] = { label = "V-LINE", bg = mode_hls.visual.bg, fg = mode_hls.visual.fg },
  ["Vs"] = { label = "V-LINE", bg = mode_hls.visual.bg, fg = mode_hls.visual.fg },
  ["\22"] = { label = "V-BLOCK", bg = mode_hls.visual.bg, fg = mode_hls.visual.fg },
  ["\22s"] = { label = "V-BLOCK", bg = mode_hls.visual.bg, fg = mode_hls.visual.fg },

  ["s"] = { label = "SELECT", bg = mode_hls.visual.bg, fg = mode_hls.visual.fg },
  ["S"] = { label = "S-LINE", bg = mode_hls.visual.bg, fg = mode_hls.visual.fg },
  ["\19"] = { label = "S-BLOCK", bg = mode_hls.visual.bg, fg = mode_hls.visual.fg },

  ["i"] = { label = "INSERT", bg = mode_hls.insert.bg, fg = mode_hls.insert.fg },
  ["ic"] = { label = "INSERT", bg = mode_hls.insert.bg, fg = mode_hls.insert.fg },
  ["ix"] = { label = "INSERT", bg = mode_hls.insert.bg, fg = mode_hls.insert.fg },

  ["r"] = { label = "REPLACE", bg = mode_hls.replace.bg, fg = mode_hls.replace.fg },
  ["R"] = { label = "REPLACE", bg = mode_hls.replace.bg, fg = mode_hls.replace.fg },
  ["Rc"] = { label = "REPLACE", bg = mode_hls.replace.bg, fg = mode_hls.replace.fg },
  ["Rx"] = { label = "REPLACE", bg = mode_hls.replace.bg, fg = mode_hls.replace.fg },
  ["Rv"] = { label = "V-REPLACE", bg = mode_hls.replace.bg, fg = mode_hls.replace.fg },
  ["Rvc"] = { label = "V-REPLACE", bg = mode_hls.replace.bg, fg = mode_hls.replace.fg },
  ["Rvx"] = { label = "V-REPLACE", bg = mode_hls.replace.bg, fg = mode_hls.replace.fg },

  ["c"] = { label = "COMMAND", bg = mode_hls.misc.bg, fg = mode_hls.misc.fg },
  ["cv"] = { label = "EX", bg = mode_hls.misc.bg, fg = mode_hls.misc.fg },
  ["ce"] = { label = "EX", bg = mode_hls.misc.bg, fg = mode_hls.misc.fg },
  ["rm"] = { label = "MORE", bg = mode_hls.misc.bg, fg = mode_hls.misc.fg },
  ["r?"] = { label = "CONFIRM", bg = mode_hls.misc.bg, fg = mode_hls.misc.fg },
  ["!"] = { label = "SHELL", bg = mode_hls.misc.bg, fg = mode_hls.misc.fg },
  ["t"] = { label = "TERMINAL", bg = mode_hls.misc.bg, fg = mode_hls.misc.fg },
}

local mode = function()
  local current_mode = vim.api.nvim_get_mode().mode
  local mode_info = modes[current_mode]
  if mode_info == nil then
    return current_mode
  end

  vim.api.nvim_set_hl(0, "StatusMode", { fg = mode_info.fg, bg = mode_info.bg, bold = true })

  return string.format(" %s ", mode_info.label):upper() .. "%#Normal#"
end

vim.api.nvim_set_hl(0, "Filename", { fg = "#ffffff", bg = "#000000" })
local function filename()
  local fname = vim.fn.expand("%:t")
  if fname == "" then
    return ""
  end
  return "%#Filename#" .. fname .. "%#Normal#"
end

vim.api.nvim_set_hl(0, "GitBranch", { fg = "#888888", bg = "#000000" })
local vcs = function()
  local git_info = vim.b.gitsigns_status_dict
  if not git_info or git_info.head == "" then
    return ""
  end
  local branch_name = git_info.head
  if #branch_name > 30 then
    branch_name = branch_name:sub(1, 19) .. "…"
  end

  local branch = git_info.added and ("%#GitBranch# " .. branch_name .. " ") or ""
  local added = git_info.added and ("%#GitSignsAdd#+" .. git_info.added .. " ") or ""
  local changed = git_info.changed and ("%#GitSignsChange#~" .. git_info.changed .. " ") or ""
  local removed = git_info.removed and ("%#GitSignsDelete#-" .. git_info.removed .. " ") or ""
  if git_info.added == 0 then
    added = ""
  end
  if git_info.changed == 0 then
    changed = ""
  end
  if git_info.removed == 0 then
    removed = ""
  end
  return table.concat({
    branch,
    added,
    changed,
    removed,
    "%#Normal#",
  })
end

local lsp = function()
  local count = {}
  local levels = {
    errors = "Error",
    warnings = "Warn",
    info = "Info",
    hints = "Hint",
  }

  for k, level in pairs(levels) do
    count[k] = vim.tbl_count(vim.diagnostic.get(0, { severity = level }))
  end

  local errors = ""
  local warnings = ""
  local hints = ""
  local info = ""

  if count["errors"] ~= 0 then
    errors = " %#LspDiagnosticsSignError# " .. count["errors"]
  end
  if count["warnings"] ~= 0 then
    warnings = " %#LspDiagnosticsSignWarning# " .. count["warnings"]
  end
  if count["hints"] ~= 0 then
    hints = " %#LspDiagnosticsSignHint# " .. count["hints"]
  end
  if count["info"] ~= 0 then
    info = " %#LspDiagnosticsSignInformation# " .. count["info"]
  end

  return errors .. warnings .. hints .. info .. "%#Normal#"
end

local macroinfo = function()
  local reg = vim.fn.reg_recording()
  if reg == "" then
    return ""
  end
  return "recording @" .. reg
end

local lineinfo = function()
  return " %P %l:%c "
end

Statusline = {}

Statusline.active = function()
  return table.concat({
    "%#StatusMode#",
    mode(),
    " ",
    filename(),
    " ",
    vcs(),
    "%=%#StatusLineExtra#",
    macroinfo(),
    lsp(),
    lineinfo(),
  })
end

function Statusline.inactive()
  return "%F"
end

local group = vim.api.nvim_create_augroup("Statusline", { clear = true })

-- -- uncomment if not using `laststatus = 3`
-- vim.api.nvim_create_autocmd({ "WinEnter", "BufEnter" }, {
--   group = group,
--   desc = "Activate statusline on focus",
--   callback = function()
--     vim.opt_local.statusline = "%!v:lua.Statusline.active()"
--   end,
-- })
--
-- vim.api.nvim_create_autocmd({ "WinLeave", "BufLeave" }, {
--   group = group,
--   desc = "Deactivate statusline when unfocused",
--   callback = function()
--     vim.opt_local.statusline = "%!v:lua.Statusline.inactive()"
--   end,
-- })

vim.api.nvim_create_autocmd("User", {
  group = group,
  pattern = "GitSignsUpdate",
  command = "redrawstatus",
})

vim.o.statusline = "%!v:lua.Statusline.active()"
vim.o.showmode = false -- its already in statusline
