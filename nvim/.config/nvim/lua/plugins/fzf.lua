return {
	'ibhagwan/fzf-lua',
	enabled = true,
	dependencies = {
		'nvim-tree/nvim-web-devicons',
	},
	keys = {
		-- fzf file helpers
		{ "<leader>ff", function() require('fzf-lua').files() end },
		{ "<leader>fo", function() require('fzf-lua').oldfiles() end },
		{ "<leader>FF", function() require('fzf-lua').lgrep_curbuf() end },
		{ "<leader>fg", function() require('fzf-lua').live_grep_resume() end },
		{ "<leader>fG", function() require('fzf-lua').grep_cword() end, mode = { "n" } },
		{ "<leader>fG", function() require('fzf-lua').grep_visual() end, mode = { "v" } },
		{ "<leader>fb", function() require('fzf-lua').buffers() end },

		-- fzf lsp/treesitter helpers
		{ "<leader>fr", function() require('fzf-lua').lsp_references() end },
		{ "<leader>fs", function() require('fzf-lua').lsp_document_symbols() end },
		{ "<leader>dd", function() require('fzf-lua').diagnostics_document() end },
		{ "<leader>dD", function() require('fzf-lua').diagnostics_workspace() end },

		-- fzf git helpers
		{ "<leader>gf", function() require('fzf-lua').git_files() end },
		{ "<leader>gb", function() require('fzf-lua').git_branches() end },
		{ "<leader>gc", function() require('fzf-lua').git_commits() end },
		{ "<leader>bc", function() require('fzf-lua').git_bcommits() end },

		-- fzf util helpers
		{ "<leader>fk", function() require('fzf-lua').keymaps() end },
		{ "<leader>fS", function() require('fzf-lua').spell_suggest() end },
	},
	opts = {
		grep = {
			rg_opts = "--column --line-number --no-heading --color=always --smart-case --max-columns=4096 --max-depth=99 --hidden",
		},
		oldfiles = {
			cwd_only = true,
			include_current_session = true,
		},
		lsp = {
			git_icons = true,
		},
		diagnostics = {
			git_icons = true,
		},
	},
}
