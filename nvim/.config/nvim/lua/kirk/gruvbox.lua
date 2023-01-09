-- gruvbox config
vim.g.gruvbox_baby_transparent_mode = true
vim.cmd [[colorscheme gruvbox-baby]]

-- other theming
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

-- TODO: use lua to update the highlight group instead of set it
-- nvim tree
-- vim.api.nvim_set_hl(0, 'NvimTreeNormal', { bg = palette.dark0_hard })
-- vim.api.nvim_set_hl(0, 'NvimTreeWinSeparator', { bg = palette.dark0_hard, fg = palette.dark0_hard })
--
-- -- barbar
-- vim.api.nvim_set_hl(0, 'BufferCurrent', { bg = palette.dark0_hard })
-- vim.api.nvim_set_hl(0, 'BufferCurrentSign', { bg = palette.dark0_hard })
-- vim.api.nvim_set_hl(0, 'BufferVisible', { bg = palette.dark0_soft, fg = palette.neutral_yellow })
-- vim.api.nvim_set_hl(0, 'BufferVisibleSign', { bg = palette.dark0_soft, fg = palette.neutral_yellow })
-- vim.api.nvim_set_hl(0, 'BufferInactive', { bg = palette.dark0_soft, fg = palette.gray })
-- vim.api.nvim_set_hl(0, 'BufferInactiveSign', { bg = palette.dark0_soft, fg = palette.gray })
--
-- -- winbar
-- vim.api.nvim_set_hl(0, 'WinBar', { bg = palette.dark2 })
-- vim.api.nvim_set_hl(0, 'WinBarNC', { bg = palette.dark1 })
--
-- -- winseparator
-- vim.api.nvim_set_hl(0, 'WinSeparator', { bg = nil, fg = palette.gray })
