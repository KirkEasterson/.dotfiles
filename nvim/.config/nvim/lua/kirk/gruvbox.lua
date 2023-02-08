-- gruvbox config
vim.g.gruvbox_baby_transparent_mode = true
vim.cmd [[colorscheme gruvbox-baby]]

-- other theming
local palette = require('gruvbox.palette')

-- nvim tree
vim.cmd("highlight NvimTreeNormal guibg=" .. palette.colors.dark0_hard)
vim.cmd("highlight NvimTreeWinSeparator guibg=" .. palette.colors.dark0_hard .. " guifg=" .. palette.colors.dark0_hard)

-- barbar
vim.cmd("highlight BufferCurrent guibg=" .. palette.colors.dark0_hard)
vim.cmd("highlight BufferCurrentSign guibg=" .. palette.colors.dark0_hard)
vim.cmd("highlight BufferVisible guibg=" .. palette.colors.dark0_soft .. " guifg=" .. palette.colors.neutral_yellow)
vim.cmd("highlight BufferVisibleSign guibg=" .. palette.colors.dark0_soft .. " guifg=" .. palette.colors.neutral_yellow)
vim.cmd("highlight BufferInactive guibg=" .. palette.colors.dark0_soft .. " guifg=" .. palette.colors.gray)
vim.cmd("highlight BufferInactiveSign guibg=" .. palette.colors.dark0_soft .. " guifg=" .. palette.colors.gray)

-- winbar
vim.cmd("highlight WinBar guibg=" .. palette.colors.dark2)
vim.cmd("highlight WinBarNC guibg=" .. palette.colors.dark1)

-- winseparator
vim.cmd("highlight WinSeparator guibg=None guifg=" .. palette.colors.gray)

-- TODO: use lua to update the highlight group instead of set it
-- nvim tree
-- vim.api.nvim_set_hl(0, 'NvimTreeNormal', { bg = palette.colors.dark0_hard })
-- vim.api.nvim_set_hl(0, 'NvimTreeWinSeparator', { bg = palette.colors.dark0_hard, fg = palette.colors.dark0_hard })
--
-- -- barbar
-- vim.api.nvim_set_hl(0, 'BufferCurrent', { bg = palette.colors.dark0_hard })
-- vim.api.nvim_set_hl(0, 'BufferCurrentSign', { bg = palette.colors.dark0_hard })
-- vim.api.nvim_set_hl(0, 'BufferVisible', { bg = palette.colors.dark0_soft, fg = palette.colors.neutral_yellow })
-- vim.api.nvim_set_hl(0, 'BufferVisibleSign', { bg = palette.colors.dark0_soft, fg = palette.colors.neutral_yellow })
-- vim.api.nvim_set_hl(0, 'BufferInactive', { bg = palette.colors.dark0_soft, fg = palette.colors.gray })
-- vim.api.nvim_set_hl(0, 'BufferInactiveSign', { bg = palette.colors.dark0_soft, fg = palette.colors.gray })
--
-- -- winbar
-- vim.api.nvim_set_hl(0, 'WinBar', { bg = palette.colors.dark2 })
-- vim.api.nvim_set_hl(0, 'WinBarNC', { bg = palette.colors.dark1 })
--
-- -- winseparator
-- vim.api.nvim_set_hl(0, 'WinSeparator', { bg = nil, fg = palette.colors.gray })
