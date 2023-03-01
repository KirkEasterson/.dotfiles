local function map(mode, lhs, rhs, opts)
	local options = { noremap = true }
	if opts then
		options = vim.tbl_extend("force", options, opts)
	end
	vim.keymap.set(mode, lhs, rhs, options)
end

-- TODO: look into mappings for function and shift+function keys

-- QOL mapping to type commands without needing shift
map('n', ';', ':')
map('n', ':', ';')
map('v', ';', ':')
map('v', ':', ';')

-- faster save and quits
map('n', '<leader>w', function() vim.cmd('w') end, { silent = true })
map('n', '<leader>q', function() vim.cmd('q') end, { silent = true })
map('n', '<leader>z', function() vim.cmd('qa') end, { silent = true })

-- easier jumps to line endings
map('n', 'H', '^')
map('n', 'L', '$')

-- reselect text after indenting
map('v', '<', '<gv')
map('v', '>', '>gv')

-- easier navigation
map('n', 'n', 'nzzzv')
map('n', 'N', 'Nzzzv')
map('n', 'J', 'mzJ`z')

-- easier undos
map('i', ',', ',<c-g>u')
map('i', '.', '.<c-g>u')
map('i', '[', '[<c-g>u')
map('i', '!', '!<c-g>u')
map('i', '?', '?<c-g>u')

map('n', 'Y', 'y$') -- Y to behave like other capitals
map('x', '<leader>p', '"_dP') -- pasting without overwriting contents of the register
map('n', 'U', '<C-r>') -- easier redo


-- TODO: move these to the lazy config
-- barbar
map('n', '<S-Tab>', '<Cmd>BufferPrevious<CR>', { silent = true })
map('n', '<Tab>', '<Cmd>BufferNext<CR>', { silent = true })
map('n', '<A-<>', '<Cmd>BufferMovePrevious<CR>', { silent = true })
map('n', '<A->>', '<Cmd>BufferMoveNext<CR>', { silent = true })
map('n', '<A-p>', '<Cmd>BufferPin<CR>', { silent = true })
map('n', '<A-1>', '<Cmd>BufferGoto 1<CR>', { silent = true })
map('n', '<A-2>', '<Cmd>BufferGoto 2<CR>', { silent = true })
map('n', '<A-3>', '<Cmd>BufferGoto 3<CR>', { silent = true })
map('n', '<A-4>', '<Cmd>BufferGoto 4<CR>', { silent = true })
map('n', '<A-5>', '<Cmd>BufferGoto 5<CR>', { silent = true })
map('n', '<A-6>', '<Cmd>BufferGoto 6<CR>', { silent = true })
map('n', '<A-7>', '<Cmd>BufferGoto 7<CR>', { silent = true })
map('n', '<A-8>', '<Cmd>BufferGoto 8<CR>', { silent = true })
map('n', '<A-9>', '<Cmd>BufferGoto 9<CR>', { silent = true })
map('n', '<A-0>', '<Cmd>BufferGoto 10<CR>', { silent = true })
map('v', '<S-Tab>', '<Cmd>BufferPrevious<CR>', { silent = true })
map('v', '<Tab>', '<Cmd>BufferNext<CR>', { silent = true })
map('v', '<A-<>', '<Cmd>BufferMovePrevious<CR>', { silent = true })
map('v', '<A->>', '<Cmd>BufferMoveNext<CR>', { silent = true })
map('v', '<A-p>', '<Cmd>BufferPin<CR>', { silent = true })
map('v', '<A-1>', '<Cmd>BufferGoto 1<CR>', { silent = true })
map('v', '<A-2>', '<Cmd>BufferGoto 2<CR>', { silent = true })
map('v', '<A-3>', '<Cmd>BufferGoto 3<CR>', { silent = true })
map('v', '<A-4>', '<Cmd>BufferGoto 4<CR>', { silent = true })
map('v', '<A-5>', '<Cmd>BufferGoto 5<CR>', { silent = true })
map('v', '<A-6>', '<Cmd>BufferGoto 6<CR>', { silent = true })
map('v', '<A-7>', '<Cmd>BufferGoto 7<CR>', { silent = true })
map('v', '<A-8>', '<Cmd>BufferGoto 8<CR>', { silent = true })
map('v', '<A-9>', '<Cmd>BufferGoto 9<CR>', { silent = true })
map('v', '<A-0>', '<Cmd>BufferGoto 10<CR>', { silent = true })
-- barbar browser like bindings
map('n', '<C-w>', '<Nop>', { silent = true }) -- unbind default
map('n', '<C-w>', '<Cmd>BufferClose<CR>', { silent = true })
map('n', '<C-S-Tab>', '<Cmd>BufferPrevious<CR>', { silent = true })
map('n', '<C-Tab>', '<Cmd>BufferNext<CR>', { silent = true })
map('v', '<C-w>', '<Nop>', { silent = true }) -- unbind default
map('v', '<C-w>', '<Cmd>BufferClose<CR>', { silent = true })
map('v', '<C-S-Tab>', '<Cmd>BufferPrevious<CR>', { silent = true })
map('v', '<C-Tab>', '<Cmd>BufferNext<CR>', { silent = true })
