return {
	"iamcco/markdown-preview.nvim",
	cmd = 'MarkdownPreview', -- TODO: make this work somehow
	build = function() vim.fn["mkdp#util#install"]() end,
	config = function()
		-- vim.api.nvim_set_var("mkdp_auto_start", 1)
		vim.api.nvim_set_var("mkdp_echo_preview_url", 1)
	end,
}