return {
	"iamcco/markdown-preview.nvim",
	ft = {
		"markdown",
	},
	cmd = {
		"MarkdownPreview",
		"MarkdownPreviewStop",
		"MarkdownPreviewToggle",
	},
	keys = {
		{ "<leader>mdp", "<Cmd>MarkdownPreview<CR>" },
		{ "<leader>mds", "<Cmd>MarkdownPreviewStop<CR>" },
		{ "<leader>mdt", "<Cmd>MarkdownPreviewToggle<CR>" },
	},
	build = function() vim.fn["mkdp#util#install"]() end,
	config = function()
		-- vim.api.nvim_set_var("mkdp_auto_start", 1)
		-- vim.api.nvim_set_var("mkdp_echo_preview_url", 1)
	end,
}
