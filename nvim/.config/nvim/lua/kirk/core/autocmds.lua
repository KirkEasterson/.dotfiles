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

local trailing_space = augroup("TrailingSpace", {})
autocmd({ "BufWritePre" }, {
  desc = "Remove trailing-space",
  group = trailing_space,
  pattern = { "*" },
  callback = function()
    if vim.bo.filetype == "markdown" then
      return -- trailing space in md is a newline
    end
    if not not vim.g.started_by_firenvim then
      return -- it will save on keypress, so this autocmd is annoying
    end

    -- 'substitute' will move the cursor, so we save the position to restore it.
    -- this causes the cursor to flash, which isn't ideal, but it's unavoidable
    -- and not that big of a deal.
    local pre_pos = vim.api.nvim_win_get_cursor(0)
    vim.cmd([[%s/\s\+$//e]])
    vim.api.nvim_win_set_cursor(0, pre_pos)
  end,
})
autocmd({ "InsertEnter" }, {
  desc = "Remove trailing space character for insert mode",
  group = trailing_space,
  pattern = { "*" },
  -- command = "set listchars-=trail:·",
  callback = function()
    vim.opt.listchars:remove("trail")
  end,
})
autocmd({ "InsertLeave" }, {
  desc = "Enable trailing space character for non-insert mode",
  group = trailing_space,
  pattern = { "*" },
  -- command = "set listchars+=trail:·",
  callback = function()
    vim.opt.listchars:append({
      trail = "·",
    })
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
    local fn = vim.fn
    if not fn.executable("notes.sh") then
      return
    end
    fn.jobstart("notes.sh build " .. fn.expand("%%"))
  end,
})

-- terminal
-- inspired by:
--  - https://github.com/catgoose/nvim/blob/30a0af45401aefc305afabc600d093037f5c9894/lua/config/autocmd.lua#L93
local terminal = augroup("TerminalLocalOptions", {})
autocmd({ "TermOpen" }, {
  group = terminal,
  pattern = { "*" },
  desc = "Set terminal mappings",
  callback = function(event)
    -- ignore output panels
    local wininfo = vim.api.nvim_buf_get_name(0)
    if wininfo == nil or wininfo == "" then
      return
    end
    local ignore = {
      "Neotest Output Panel",
    }
    for _, v in pairs(ignore) do
      if string.find(wininfo, v) then
        return
      end
    end

    -- remove vim things
    vim.opt_local.number = false
    vim.opt_local.relativenumber = false
    vim.opt_local.cursorline = false
    vim.opt_local.signcolumn = "no"
    vim.opt_local.statuscolumn = ""

    -- allow ctrl+vimkeys in terminal mode
    local code_term_esc = vim.api.nvim_replace_termcodes("<C-\\><C-n>", true, true, true)
    for _, key in ipairs({ "h", "j", "k", "l" }) do
      vim.keymap.set("t", "<C-" .. key .. ">", function()
        local code_dir = vim.api.nvim_replace_termcodes("<C-" .. key .. ">", true, true, true)
        vim.api.nvim_feedkeys(code_term_esc .. code_dir, "t", true)
      end, { noremap = true })
    end

    if vim.bo.filetype == "" then
      vim.api.nvim_set_option_value("filetype", "terminal", { buf = event.bufnr })
      -- TODO: what is this?
      -- if vim.g.catgoose_terminal_enable_startinsert == 1 then
      vim.cmd.startinsert()
      -- end
    end
  end,
})
autocmd({ "WinEnter" }, {
  group = terminal,
  pattern = { "*" },
  callback = function()
    -- ignore non-terminal windows
    if vim.bo.filetype ~= "terminal" then
      return
    end

    -- -- TODO: what is this?
    -- if not vim.g.catgoose_terminal_enable_startinsert then
    --   return
    -- end

    vim.cmd.startinsert()
  end,
})

autocmd("FileType", {
  desc = "Start git entries in insert mode",
  pattern = {
    "NeogitCommitMessage",
    "gitcommit",
    "gitrebase",
  },
  callback = function()
    vim.opt_local.formatoptions = ""
    vim.cmd.startinsert()
  end,
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
  desc = "Make sh file executable if a shebang is detected",
  pattern = "*",
  callback = function(args)
    local uv = vim.uv
    local api = vim.api

    local shebang = api.nvim_buf_get_lines(0, 0, 1, true)[1]
    if not shebang or not shebang:match("^#!.+") then
      return
    end
    local filename = api.nvim_buf_get_name(args.buf)
    local fileinfo = uv.fs_stat(filename)
    if not fileinfo or bit.band(fileinfo.mode - 32768, 0x40) ~= 0 then
      return
    end

    vim.notify("File made executable")
    uv.fs_chmod(filename, bit.bor(fileinfo.mode, 493))
  end,
  once = false,
})

local winbar = augroup("Winbar", {})
autocmd({ "VimEnter", "BufWinEnter" }, {
  desc = "Remove winbar for some buffers",
  group = winbar,
  pattern = { "*" },
  callback = function()
    if vim.bo.buftype == "" then
      vim.opt.winbar = ""
    end
  end,
})
