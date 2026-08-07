vim.keymap.set("n", "%", function()
  local fname = vim.fn.input("Enter filename: ")
  if fname == "" then
    return
  end

  local dir = vim.b.netrw_curdir or vim.fn.getcwd()
  local path = dir .. "/" .. fname

  if vim.fn.filereadable(path) == 1 or vim.fn.isdirectory(path) == 1 then
    vim.notify("Already exists: " .. fname, vim.log.levels.WARN)
    return
  end

  if fname:match("/$") then
    vim.fn.mkdir(path, "p")
    vim.cmd("edit")
  else
    local f = io.open(path, "w")
    if not f then
      vim.notify("Failed to create: " .. fname, vim.log.levels.ERROR)
      return
    end
    f:close()

    local escaped = vim.fn.fnameescape(path)
    if vim.fn.winnr("#") == 0 then
      vim.cmd("edit " .. escaped)
    else
      vim.cmd("wincmd p")
      vim.cmd("edit " .. escaped)
    end
  end
end, { buffer = true, silent = true, noremap = true, desc = "Create file in previous window" })
