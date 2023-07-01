local function map(mode, lhs, rhs, opts)
	local options = { noremap = true, silent = true }
	if opts then
		options = vim.tbl_extend("force", options, opts)
	end
	vim.keymap.set(mode, lhs, rhs, options)
end

-- -- convenient buffer switching
-- map('n', '<Tab>', ':bnext')
-- map('n', '<S-Tab>', ':bprev')

-- QOL mapping to type commands without needing shift
map('n', ';', ':')
map('n', ':', ';')
map('v', ';', ':')
map('v', ':', ';')

-- center the cursor on movements
map('n', '<C-i>', '<C-i>zz')
map('n', '<C-o>', '<C-o>zz')
map('n', '<C-u>', '<C-u>zz')
map('n', '<C-d>', '<C-d>zz')
map('n', 'n', 'nzz')
map('n', 'N', 'Nzz')

-- mouse navigation -- TODO: make this work in terminals
map('n', '<X1Mouse>', '<C-o>')
map('n', '<X2Mouse>', '<C-i>')

-- faster save and quits
map('n', '<leader>w', function() vim.cmd('w') end)
map('n', '<leader>q', function() vim.cmd('q') end)
map('n', '<leader>z', function() vim.cmd('qa') end)

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

map('n', 'U', '<C-r>')

-- easier yanking/pasting
map('v', 'y', 'ygv<ESC>')     -- keep cursor in same spot when yanking
map('n', 'Y', 'y$')           -- Y to behave like other capitals
map('n', 'p', 'p=`]')         -- paste with formatting
map('n', 'P', 'P=`]')         -- paste with formatting
map('x', '<leader>p', '"_dP') -- pasting without overwriting contents of the register

-- TODO: look into mappings for function and shift+function keys
