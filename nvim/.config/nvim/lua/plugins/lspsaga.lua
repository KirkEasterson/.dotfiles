return {
	"glepnir/lspsaga.nvim",
	event = "BufRead",
	dependencies = {
		'neovim/nvim-lspconfig',
		"nvim-tree/nvim-web-devicons",
		"nvim-treesitter/nvim-treesitter",
	},
	keys = {
		-- { "<leader><leader>o", "<cmd>Lspsaga outline<CR>" },
		{ "ga", "<cmd>Lspsaga code_action<CR>" },
		{ "<leader>e", "<cmd>Lspsaga show_line_diagnostics<CR>" },
		{ "<leader>gh", "<cmd>Lspsaga lsp_finder<CR>" },
		-- { "<leader>rn", "<cmd>Lspsaga rename<CR>" },
		{ "K", "<cmd>Lspsaga hover_doc<CR>" },
		{ "[d", "<cmd>Lspsaga diagnostic_jump_prev<CR>" },
		{ "]d", "<cmd>Lspsaga diagnostic_jump_next<CR>" },
		{ "gb", "<cmd>Lspsaga show_buf_diagnostics<CR>" },
		-- { "gd", "<cmd>Lspsaga goto_definition<CR>" },
		-- { "gt", "<cmd>Lspsaga goto_type_definition<CR>" },
		{ "<leader>gd", "<cmd>Lspsaga peek_goto_definition<CR>" },
		{ "<leader>gt", "<cmd>Lspsaga peek_goto_type_definition<CR>" },
	},
	opts = {
		lightbulb = {
			virtual_text = false,
		},
		symbol_in_winbar = {
			separator = "  ",
			folder_level = 8,
			respect_root = true,
		},
	},
}
