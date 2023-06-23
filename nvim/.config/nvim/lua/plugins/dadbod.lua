local conn_file = vim.fn.stdpath("cache") .. "/dbee/persistence.json"

return {
	"tpope/vim-dadbod",
	dependencies = {
		"kristijanhusak/vim-dadbod-ui",
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
		{ "<leader>db", function() vim.cmd('DBUIToggle') end },
	},
	config = function(_, opts)
		-- vim.g.gruvbox_baby_transparent_mode = true
		vim.cmd([[
		  autocmd FileType sql setlocal omnifunc=vim_dadbod_completion#omni
		  autocmd FileType sql,mysql,plsql lua require('cmp').setup.buffer({ sources = {{ name = 'vim-dadbod-completion' }} })
		]])
	end,
	opts = {},
}
