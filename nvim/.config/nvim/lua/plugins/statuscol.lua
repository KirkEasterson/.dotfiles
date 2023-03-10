return {
	"luukvbaal/statuscol.nvim",
	enabled = false,
	config = function()
		if vim.fn.has('nvim-0.9') == 1 then
			require("statuscol").setup({})
		end
	end
}
