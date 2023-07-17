return {
	"svermeulen/text-to-colorscheme",
	enabled = function()
		local openapikey = os.getenv("OPENAI_API_KEY")
		return openapikey ~= nil and openapikey ~= ""
	end,
	cmd = {
		"T2CAddContrast",
		"T2CAddSaturation",
		"T2CResetChanges",
		"T2CSGenerate",
		"T2CSSave",
		"T2CShuffleAccents",
	},
	keys = {
		{
			"<leader>bb",
			"<Cmd>Block<CR>",
			desc = "Toggle blocks",
		},
	},
	opts = {
		ai = {
			openai_api_key = os.getenv("OPENAI_API_KEY"),
			gpt_model = "gpt-3.5-turbo-0613",
		},
	},
	config = function(_, opts)
		require("test-to-colorscheme").setup(opts)
		vim.cmd([[colorscheme text-to-colorscheme]])
	end
}
