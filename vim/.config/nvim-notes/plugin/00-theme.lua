vim.pack.add({
	"https://github.com/Tsuzat/NeoSolarized.nvim",
	"https://github.com/nvim-mini/mini.icons",
})

require("NeoSolarized").setup({
	terminal_colors = false,
})

vim.cmd.colorscheme("NeoSolarized")

local mini_icons = require("mini.icons")
mini_icons.setup()
mini_icons.mock_nvim_web_devicons()
