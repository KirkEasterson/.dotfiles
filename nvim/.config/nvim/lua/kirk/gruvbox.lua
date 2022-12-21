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

-- TODO: make a module with these color definitions, or see if it already exists
vim.cmd([[colorscheme gruvbox]])
vim.cmd([[highlight NvimTreeNormal guibg=#1d2021]])
vim.cmd([[highlight NvimTreeWinSeparator guibg=#1d2021 guifg=#1d2021]])

vim.cmd([[highlight TelescopePromptBorder guibg=#32302f guifg=#32302f]])
vim.cmd([[highlight TelescopePromptNormal guibg=#32302f]])
vim.cmd([[highlight TelescopePromptTitle guibg=#3c3836 guifg=#ebdbb2]])

vim.cmd([[highlight TelescopePreviewBorder guibg=#32302f guifg=#32302f]])
vim.cmd([[highlight TelescopePreviewNormal guibg=#32302f]])
vim.cmd([[highlight TelescopePreviewTitle guibg=#3c3836 guifg=#ebdbb2]])

vim.cmd([[highlight TelescopeResultsBorder guibg=#3c3836 guifg=#3c3836]])
vim.cmd([[highlight TelescopeResultsNormal guibg=#3c3836]])
vim.cmd([[highlight TelescopeResultsTitle guibg=#3c3836 guifg=#3c3836]])

vim.cmd([[highlight TelescopeSelection guibg=#32302f]])
