vim.g.gruvbox_baby_transparent_mode = false
vim.g.gruvbox_baby_use_original_palette = true
vim.g.gruvbox_baby_string_style = 'italic'
vim.cmd [[colorscheme gruvbox-baby]]

local palette = require('gruvbox.palette')

-- nvim tree
vim.cmd("highlight NvimTreeNormal guibg=" .. palette.dark0_hard)
vim.cmd("highlight NvimTreeWinSeparator guibg=" .. palette.dark0_hard .. " guifg=" .. palette.dark0_hard)

-- barbar
vim.cmd("highlight BufferCurrent guibg=" .. palette.dark0_hard)
vim.cmd("highlight BufferCurrentSign guibg=" .. palette.dark0_hard)
vim.cmd("highlight BufferVisible guibg=" .. palette.dark0_soft .. " guifg=" .. palette.neutral_yellow)
vim.cmd("highlight BufferVisibleSign guibg=" .. palette.dark0_soft .. " guifg=" .. palette.neutral_yellow)
vim.cmd("highlight BufferInactive guibg=" .. palette.dark0_soft .. " guifg=" .. palette.gray)
vim.cmd("highlight BufferInactiveSign guibg=" .. palette.dark0_soft .. " guifg=" .. palette.gray)

-- winbar
vim.cmd("highlight WinBar guibg=" .. palette.dark2)
vim.cmd("highlight WinBarNC guibg=" .. palette.dark1)

-- winseparator
vim.cmd("highlight WinSeparator guibg=None guifg=" .. palette.gray)
