local worktree = require("git-worktree")
local autosession = require("auto-session")

require("git-worktree").setup({
	clear_jumps_on_change = true, -- this is handled by auto-session
	update_on_change = false,
	update_on_change_command = nil,
})

vim.g.git_worktree_log_level = "debug"

worktree.on_tree_change(function(op, metadata)
	if op == worktree.Operations.Switch then
		print("Switched from " .. metadata.prev_path .. " to " .. metadata.path)
		vim.api.nvim_command("RestoreSession")
	end
end)
