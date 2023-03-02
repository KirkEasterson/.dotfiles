return {
	"glepnir/lspsaga.nvim",
	event = "BufRead",
	keys = {
		{ "<leader><leader>o", "<cmd>Lspsaga outline<CR>" },
		{ "<leader>ga", "<cmd>Lspsaga code_action<CR>" },
		{ "<leader>ge", "<cmd>Lspsaga show_cursor_diagnostics<CR>" },
		{ "<leader>gh", "<cmd>Lspsaga lsp_finder<CR>" },
		{ "<leader>gs", "<cmd>Lspsaga show_diagnostics<CR>" }, -- maybe peek?
		{ "<leader>rn", "<cmd>Lspsaga rename<CR>" },
		{ "K", "<cmd>Lspsaga hover_doc<CR>" },
		{ "[d", "<cmd>Lspsaga diagnostic_jump_prev<CR>" },
		{ "]d", "<cmd>Lspsaga diagnostic_jump_next<CR>" },
		{ "gb", "<cmd>Lspsaga show_buf_diagnostics<CR>" },
		{ "gd", "<cmd>Lspsaga goto_definition<CR>" }, -- maybe peek?
		{ "gt", "<cmd>Lspsaga goto_type_definition<CR>" }, -- maybe peek?
	},
	dependencies = {
		{ "nvim-tree/nvim-web-devicons" },
		{ "nvim-treesitter/nvim-treesitter" }
	},
	config = {
		lightbulb = {
			virtual_text = false,
		},
	},
}
