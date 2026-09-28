local ns = vim.api.nvim_create_namespace("live_command_preview")
local group = vim.api.nvim_create_augroup("LiveCommandPreview", { clear = true })

local function clear_preview(bufnr)
  vim.api.nvim_buf_clear_namespace(bufnr, ns, 0, -1)
end

vim.api.nvim_create_autocmd("CmdlineChanged", {
  group = group,
  callback = function()
    if vim.fn.getcmdtype() ~= ":" then
      return
    end

    local bufnr = vim.api.nvim_get_current_buf()
    clear_preview(bufnr)

    local cmd = vim.fn.getcmdline()
    if cmd == "" then
      return
    end

    local lines = vim.api.nvim_buf_get_lines(bufnr, 0, -1, false)

    -- substitute (e.g., :s/foo/bar/g)
    local search, replace = cmd:match("^s/([^/]*)/([^/]*)")
    if search then
      for i, line in ipairs(lines) do
        local new_line, matched = line:gsub(search, replace)
        if matched > 0 then
          vim.api.nvim_buf_set_extmark(bufnr, ns, i - 1, 0, {
            virt_text = { { new_line, "IncSearch" } },
            virt_text_pos = "overlay",
          })
        end
      end
      return
    end
  end,
})

vim.api.nvim_create_autocmd("CmdlineLeave", {
  group = group,
  callback = function()
    clear_preview(vim.api.nvim_get_current_buf())
  end,
})
