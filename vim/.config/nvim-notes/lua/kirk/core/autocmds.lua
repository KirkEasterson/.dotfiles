local augroup = vim.api.nvim_create_augroup
local autocmd = vim.api.nvim_create_autocmd

local notes_group = augroup("Notes", {})
autocmd("BufwritePost", {
  desc = "Build notes",
  group = notes_group,
  pattern = "*note-*.md",
  callback = function()
    local fn = vim.fn
    if not fn.executable("notes.sh") then
      return
    end
    fn.jobstart("notes.sh build " .. fn.expand("%%"))
  end,
})

local trailing_space = augroup("TrailingSpace", {})
autocmd({ "BufWritePre" }, {
  desc = "Remove trailing-space",
  group = trailing_space,
  pattern = { "*" },
  callback = function()
    -- 'substitute' will move the cursor, so we save the position to restore
    -- it. this causes the cursor to flash, which isn't ideal, but it's
    -- unavoidable and not that big of a deal.
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
