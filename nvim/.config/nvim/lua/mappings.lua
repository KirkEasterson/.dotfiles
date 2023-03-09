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
