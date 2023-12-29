return {
	"ibhagwan/fzf-lua",
	cond = not vim.g.started_by_firenvim,
	enabled = false,
	dependencies = {
		"nvim-tree/nvim-web-devicons",
		{ "junegunn/fzf", build = "./install --bin" },
	},
	cmd = "FzfLua",
	keys = {
		-- fzf file helpers
		{
			"<leader>ff",
			function()
				require("fzf-lua").files({ resume = true })
			end,
			desc = "Find files",
		},
		{
			"<leader>fg",
			function()
				require("fzf-lua").live_grep({ resume = true })
			end,
			desc = "Live grep",
		},
		{
			"<leader>fG",
			function()
				require("fzf-lua").grep_cword({ resume = true })
			end,
			mode = { "n" },
			desc = "Grep string",
		},
		{
			"<leader>fo",
			function()
				require("fzf-lua").oldfiles({ resume = true })
			end,
			desc = "Recent files",
		},
		{
			"<leader>fF",
			function()
				require("fzf-lua").lgrep_curbuf({ resume = true })
			end,
			desc = "",
		},
		{
			"<leader>fG",
			function()
				require("fzf-lua").grep_visual({ resume = true })
			end,
			mode = { "v" },
			desc = "Grep selection",
		},
		{
			"<leader>fb",
			function()
				require("fzf-lua").buffers({ resume = true })
			end,
			desc = "Search buffers",
		},

		-- fzf lsp/treesitter helpers
		{
			"<leader>fr",
			function()
				require("fzf-lua").lsp_references({ resume = true })
			end,
			desc = "LSP references",
		},
		{
			"<leader>fs",
			function()
				require("fzf-lua").lsp_document_symbols({ resume = true })
			end,
			desc = "LSP document symbols",
		},
		{
			"<leader>fd",
			function()
				require("fzf-lua").diagnostics_document({ resume = true })
			end,
			desc = "Document diagnostics",
		},
		{
			"<leader>fD",
			function()
				require("fzf-lua").diagnostics_workspace({ resume = true })
			end,
			desc = "Workspace diagnostics",
		},

		-- fzf git helpers
		{
			"<leader>gf",
			function()
				require("fzf-lua").git_files({ resume = true })
			end,
			desc = "Git files",
		},
		{
			"<leader>gb",
			function()
				require("fzf-lua").git_branches({ resume = true })
			end,
			desc = "Git branches",
		},
		{
			"<leader>gc",
			function()
				require("fzf-lua").git_commits({ resume = true })
			end,
			desc = "Git commits",
		},
		{
			"<leader>gr",
			function()
				require("fzf-lua").git_bcommits({ resume = true })
			end,
			desc = "Git branch commits",
		},

		-- fzf util helpers
		{
			"<leader>fh",
			function()
				require("fzf-lua").help_tags({ resume = true })
			end,
			desc = "Keymaps",
		},
		{
			"<leader>fk",
			function()
				require("fzf-lua").keymaps({ resume = true })
			end,
			desc = "Keymaps",
		},
		{
			"<leader>fp",
			function()
				require("fzf-lua").spell_suggest({ resume = true })
			end,
			desc = "Spell suggest",
		},
		{
			"<leader>fe",
			function()
				require("fzf-lua").registers({ resume = true })
			end,
			desc = "Spell suggest",
		},
	},
	opts = {
		grep = {
			rg_opts = {
				-- color codes not yet interpreted
				"--color=never",

				-- the following are required for telescope
				"--no-heading",
				"--with-filename",
				"--line-number",
				"--column",

				"--hidden", -- include hidden files
				"--max-depth=99", -- max num dirs to descend
				"--smart-case", -- use smart case
			},
		},
		oldfiles = {
			cwd_only = true,
			include_current_session = true,
		},
		default = {
			git_icons = true,
		},
		-- TODO: get these bindings to work
		-- keymap = {
		-- 	builtin = {
		-- 		-- ["ctrl-d"] = "preview-page-down",
		-- 		-- ["ctrl-u"] = "preview-page-up",
		-- 	},
		-- 	fzf = {
		-- 		-- ["ctrl-d"] = "preview-page-down",
		-- 		-- ["ctrl-u"] = "preview-page-up",
		-- 	},
		-- },
	},
}
