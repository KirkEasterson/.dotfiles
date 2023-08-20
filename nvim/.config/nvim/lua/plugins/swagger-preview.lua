return {
	"vinnymeller/swagger-preview.nvim",
	cond = not vim.g.started_by_firenvim,
	build = "npm install -g swagger-ui-watcher",
	cmd = {
		"SwaggerPreview",
		"SwaggerPreviewStop",
		"SwaggerPreviewToggle",
	},
	opts = {},
}
