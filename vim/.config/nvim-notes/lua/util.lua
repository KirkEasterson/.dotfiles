local M = {}

--- helper function for vim.keymap.set
---@param mode string|table vim mode
---@param lhs string binding
---@param rhs string|function action
---@param opts table|nil options
function M.map(mode, lhs, rhs, opts)
	local options = { noremap = true, silent = true }
	if opts then
		options = vim.tbl_extend("force", options, opts)
	end
	vim.keymap.set(mode, lhs, rhs, options)
end

--- helper function for vim.keymap.del
---@param mode string|table vim mode
---@param lhs string binding
function M.unmap(mode, lhs)
	vim.keymap.del(mode, lhs)
end

function M.winbar()
	local file_path = vim.api.nvim_eval_statusline("%f", {}).str
	local modified = vim.api.nvim_eval_statusline("%M", {}).str == "+" and "()" or ""

	file_path = file_path:gsub("/", "  ")

	return "%#WinBarPath#" .. file_path .. "%*" .. " %#WinBarModified#" .. modified .. "%*"
end

return M
