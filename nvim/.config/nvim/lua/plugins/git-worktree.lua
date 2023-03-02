return {
	'ThePrimeagen/git-worktree.nvim',
	enabled = false,
	dependencies = 'nvim-telescope/telescope.nvim',
	keys = {
		{ "<leader>gw", function() require('telescope').extensions.git_worktree.git_worktrees() end },
		{ "<leader>gW", function() require('telescope').extensions.git_worktree.create_git_worktree() end },
	},
	config = function()

		local worktree = require("git-worktree")

		worktree.setup({
			clear_jumps_on_change = false, -- this is handled by auto-session
			update_on_change = false,
			-- update_on_new_worktree = update_on_new_worktree,
		})

		local update_on_new_worktree = function(op, metadata)
			vim.api.nvim_command("RestoreSession")
			-- TODO: add handling for when a session can't be restored
		end

		worktree.on_tree_change(function(op, metadata)
			if op == worktree.Operations.Switch then
				update_on_new_worktree(op, metadata)
			end
		end)


		require("telescope").load_extension("git_worktree")
	end,
}