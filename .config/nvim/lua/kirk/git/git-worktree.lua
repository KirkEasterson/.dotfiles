local worktree = require("git-worktree")

local update_on_new_worktree = function(op, metadata)
	vim.api.nvim_command("RestoreSession")
	-- TODO: add handling for when a session can't be restored
end

require("git-worktree").setup({
	clear_jumps_on_change = false, -- this is handled by auto-session
	update_on_change = false,
	-- update_on_new_worktree = update_on_new_worktree,
})

worktree.on_tree_change(function(op, metadata)
	if op == worktree.Operations.Switch then
		update_on_new_worktree(op, metadata)
	end
end)
