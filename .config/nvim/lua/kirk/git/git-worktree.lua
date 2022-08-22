local worktree = require("git-worktree")

require("git-worktree").setup({
	clear_jumps_on_change = false, -- this is handled by auto-session
	update_on_change = false,
})

worktree.on_tree_change(function(op, metadata)
	if op == worktree.Operations.Switch then
		vim.api.nvim_command("RestoreSession")
	end
end)
