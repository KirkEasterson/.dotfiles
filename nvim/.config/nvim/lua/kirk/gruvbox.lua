require("gruvbox").setup({
	undercurl = true,
	underline = true,
	bold = true,
	italic = true,
	strikethrough = true,
	invert_selection = false,
	invert_signs = false,
	invert_tabline = false,
	invert_intend_guides = false,
	inverse = true,
	contrast = "hard",
	transparent_mode = true,
})

vim.cmd([[colorscheme gruvbox]])

palette = require('gruvbox.palette')
vim.cmd("highlight NvimTreeNormal guibg=" .. palette.dark0_hard)
vim.cmd("highlight NvimTreeWinSeparator guibg=" .. palette.dark0_hard .. " guifg=" .. palette.dark0_hard)

-- uncomment to have a "flat" telescope
-- vim.cmd([[highlight TelescopePromptBorder guibg=#32302f guifg=#32302f]])
-- vim.cmd([[highlight TelescopePromptNormal guibg=#32302f]])
-- vim.cmd([[highlight TelescopePromptTitle guibg=#3c3836 guifg=#ebdbb2]])
--
-- vim.cmd([[highlight TelescopePreviewBorder guibg=#32302f guifg=#32302f]])
-- vim.cmd([[highlight TelescopePreviewNormal guibg=#32302f]])
-- vim.cmd([[highlight TelescopePreviewTitle guibg=#3c3836 guifg=#ebdbb2]])
--
-- vim.cmd([[highlight TelescopeResultsBorder guibg=#3c3836 guifg=#3c3836]])
-- vim.cmd([[highlight TelescopeResultsNormal guibg=#3c3836]])
-- vim.cmd([[highlight TelescopeResultsTitle guibg=#3c3836 guifg=#3c3836]])
--
-- vim.cmd([[highlight TelescopeSelection guibg=#32302f]])
