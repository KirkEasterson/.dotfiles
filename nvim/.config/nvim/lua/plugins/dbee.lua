local conn_file = vim.fn.stdpath("cache") .. "/dbee/persistence.json"

return {
	"kndndrj/nvim-dbee",
	cond = not vim.g.started_by_firenvim,
	enabled = false,
	dependencies = {
		"MunifTanjim/nui.nvim",
	},
	build = function()
		require("dbee").install()
	end,
	keys = {
		{
			"<leader>db",
			function() vim.cmd('e ' .. conn_file) end,
			desc = "Edit DBee connection file",
		},
	},
	opts = {
		sources = {
			-- require("dbee.sources").FileSource:new(vim.fn.stdpath("cache") .. "/dbee/persistence.json"),
		},
	},
}
