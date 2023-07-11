local conn_file = vim.fn.stdpath("cache") .. "/dbee/persistence.json"

return {
	"kristijanhusak/vim-dadbod-ui",
	dependencies = {
		"tpope/vim-dadbod",
		"kristijanhusak/vim-dadbod-completion",
		'hrsh7th/nvim-cmp',
	},
	cmd = {
		"DBUIToggle",
		"DBUIFindBuffer",
		"DBUIRenameBuffer",
		"DBUILastQueryInfo",
	},
	keys = {
		-- TODO: use this and find more keys needed
		{
			"<leader>db",
			'<Cmd>DBUIToggle<CR>',
			desc = "Toggle database UI",
		},
	},
	config = function(_, opts)
		vim.g.db_ui_save_location = "~/.config/nvim/db_ui"

		vim.api.nvim_create_autocmd({ "FileType" }, {
			pattern = { 'sql', 'mysql', 'plsql' },
			callback = function()
				require('cmp').setup.buffer({
					sources = {
						{ name = 'vim-dadbod-completion' },
					}
				})
			end,
			desc = 'Add completion for vim-dadbod'
		})
	end,
}
