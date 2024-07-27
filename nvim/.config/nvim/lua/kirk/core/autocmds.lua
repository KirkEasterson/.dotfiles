local augroup = vim.api.nvim_create_augroup
local autocmd = vim.api.nvim_create_autocmd

autocmd({ "FileType" }, {
  desc = "Enable wrapping and easy-undo for text, markdown, and tex files",
  pattern = { "markdown", "tex", "text" },
  callback = function()
    vim.opt_local.wrap = true

    -- easier undos
    local util = require("util")
    util.map("i", ",", ",<c-g>u")
    util.map("i", ".", ".<c-g>u")
    util.map("i", "[", "[<c-g>u")
    util.map("i", "!", "!<c-g>u")
    util.map("i", "?", "?<c-g>u")
  end,
})

autocmd({ "FileType" }, {
  desc = "Disable spell for certain filetypes",
  pattern = { "dotenv" },
  callback = function()
    vim.opt.spell = false
  end,
})

autocmd({ "BufWritePre" }, {
  desc = "Remove trailing-space",
  pattern = { "*" },
  callback = function()
    if vim.bo.filetype == "markdown" then
      return -- trailing space in md is a newline
    end
    if not not vim.g.started_by_firenvim then
      return -- it will save on keypress, so this autocmd is annoying
    end
    vim.cmd([[%s/\s\+$//e]])
  end,
})

autocmd("TextYankPost", {
  desc = "Highlight yanked text",
  group = augroup("highlight_yank", { clear = true }),
  pattern = "*",
  callback = function()
    vim.highlight.on_yank({
      higroup = "IncSearch",
      timeout = 100,
    })
  end,
})

autocmd("BufwritePost", {
  desc = "Build notes",
  pattern = "*note-*.md",
  callback = function()
    if not vim.fn.executable("notes.sh") then
      return
    end
    vim.fn.jobstart("notes.sh build " .. vim.fn.expand("%%"))
  end,
})

autocmd("TermOpen", {
  desc = "Start terminal in insert mode",
  callback = function()
    local wininfo = vim.api.nvim_buf_get_name(0)
    if wininfo == nil or wininfo == "" then
      return
    end

    -- ignore output panels
    local ignore = {
      "Neotest Output Panel",
    }
    for _, v in pairs(ignore) do
      if string.find(wininfo, v) then
        return
      end
    end

    vim.opt_local.number = false
    vim.opt_local.relativenumber = false
    vim.cmd("startinsert!")
  end,
})

autocmd("FileType", {
  desc = "Start git entries in insert mode",
  pattern = { "gitcommit", "gitrebase" },
  command = "startinsert | 1",
})

local reload_file_group = augroup("ReloadFile", {})
autocmd({ "FocusGained", "BufEnter" }, {
  desc = "Auto load file changes when focus or buffer is entered",
  group = reload_file_group,
  pattern = "*",
  command = "if &buftype == \"nofile\" | checktime | endif",
})

autocmd("FileChangedShellPost", {
  desc = "Actions when the file is changed outside of Neovim",
  group = reload_file_group,
  callback = function()
    vim.notify("File changed, reloading the buffer", vim.log.levels.WARN)
  end,
})

autocmd("QuickFixCmdPost", {
  desc = "Automatically open quickfix list",
  group = augroup("AutoOpenQuickfix", { clear = true }),
  pattern = { "[^l]*" },
  command = "cwindow",
})

autocmd({ "QuickFixCmdPost" }, {
  desc = "Automatically open location list",
  group = augroup("LocationList", {}),
  pattern = "l*",
  command = "lopen",
})

autocmd("BufReadPost", {
  desc = "Goto last location in newly opened buffer",
  group = augroup("BufferSettings", { clear = true }),
  callback = function()
    local mark = vim.api.nvim_buf_get_mark(0, "\"")
    local lcount = vim.api.nvim_buf_line_count(0)
    if mark[1] > 0 and mark[1] <= lcount then
      pcall(vim.api.nvim_win_set_cursor, 0, mark)
    end
  end,
})

autocmd("BufWritePost", {
  group = augroup("CustomSettings", {}),
  desc = "Make sh file executable if a shebang is deteced",
  pattern = "*",
  callback = function(args)
    local shebang = vim.api.nvim_buf_get_lines(0, 0, 1, true)[1]
    if not shebang or not shebang:match("^#!.+") then
      return
    end
    local filename = vim.api.nvim_buf_get_name(args.buf)
    local fileinfo = vim.uv.fs_stat(filename)
    if not fileinfo or bit.band(fileinfo.mode - 32768, 0x40) ~= 0 then
      return
    end

    vim.notify("File made executable")
    vim.uv.fs_chmod(filename, bit.bor(fileinfo.mode, 493))
  end,
  once = false,
})

autocmd("User", {
  group = augroup("CustomSettings", {}),
  desc = "Auto-commit updates to lazy-lock",
  pattern = "LazyUpdate",
  callback = function()
    local dotfiles_dir = os.getenv("DOTFILES")
    local lockfile = dotfiles_dir .. "/nvim/.config/nvim/lazy-lock.json"

    local cmd = {
      "git",
      "-C",
      dotfiles_dir,
      "commit",
      lockfile,
      "-m",
      "'chore(nvim): update lazy-lock'",
    }

    local success, process = pcall(function()
      return vim.system(cmd):wait()
    end)

    if process and process.code == 0 then
      vim.notify("Committed lazy-lock.json")
      vim.notify(process.stdout)
    else
      if not success then
        vim.notify("Failed to run command '" .. table.concat(cmd, " ") .. "':", vim.log.levels.WARN, {})
        vim.notify(tostring(process), vim.log.levels.WARN, {})
      else
        vim.notify("git ran but failed to commit:")
        vim.notify(process.stdout, vim.log.levels.WARN, {})
      end
    end
  end,
  once = false,
})
