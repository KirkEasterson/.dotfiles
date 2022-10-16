local function map(mode, lhs, rhs, opts)
	local options = { noremap = true }
	if opts then
		options = vim.tbl_extend("force", options, opts)
	end
	vim.api.nvim_set_keymap(mode, lhs, rhs, options)
end

map('n', 'Y', '$y') -- Y to behave like other capitals
map('x', '<leader>p', '"_dP') -- pasting without overwriting contents of the register

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

-- moving text with alt+direction
map('v', '<A-j>', ":m '>+1<CR>gv=gv")
map('v', '<A-k>', ":m '<-2<CR>gv=gv")
map('n', '<A-j>', ':m .+1<CR>==')
map('n', '<A-k>', ':m .-2<CR>==')

-- easier window navigation with <leader>+direction
map('n', '<leader>h', ':wincmd h<CR>', { silent = true })
map('n', '<leader>j', ':wincmd j<CR>', { silent = true })
map('n', '<leader>k', ':wincmd k<CR>', { silent = true })
map('n', '<leader>l', ':wincmd l<CR>', { silent = true })

-- telescope
map("n", "<leader>ff", "<cmd>lua require('telescope.builtin').find_files()<CR>")
map("n", "<leader>FF", "<cmd>lua require('telescope.builtin').current_buffer_fuzzy_find()<CR>")
map("n", "<leader>fg", "<cmd>lua require('telescope.builtin').live_grep()<CR>")
map("n", "<leader>fG", "<cmd>lua require('telescope.builtin').grep_string()<CR>")
map("n", "<leader>fb", "<cmd>lua require('telescope.builtin').buffers()<CR>")
-- map("n", "<leader>fh", "<cmd>lua require('telescope.builtin').help_tags()<CR>")
map("n", "<leader>fr", "<cmd>lua require('telescope.builtin').lsp_references()<CR>")
map("n", "<leader>fs", "<cmd>lua require('telescope.builtin').lsp_document_symbols()<CR>")
map("n", "<leader>ft", "<cmd>lua require('telescope.builtin').treesitter()<CR>")
map("n", "<leader>gb", "<cmd>lua require('telescope.builtin').git_branches()<CR>")
map("n", "<leader>gc", "<cmd>lua require('telescope.builtin').git_commits()<CR>")
map("n", "<leader>bc", "<cmd>lua require('telescope.builtin').git_bcommits()<CR>")
map("n", "<leader>rr", "<cmd>lua require('telescope.builtin').registers()<CR>")
map("n", "<leader>dd", "<cmd>lua require('telescope.builtin').diagnostics()<CR>")
map("n", "<leader>gw", "<cmd>lua require('telescope').extensions.git_worktree.git_worktrees()<CR>")
map("n", "<leader>gW", "<cmd>lua require('telescope').extensions.git_worktree.create_git_worktree()<CR>")

-- winshift
map("n", "<leader><leader>w", "<cmd>WinShift<CR>")
map("n", "<leader><leader>s", "<cmd>WinShift swap<CR>")
map("n", "<leader><leader>h", "<cmd>WinShift left<CR>")
map("n", "<leader><leader>j", "<cmd>WinShift down<CR>")
map("n", "<leader><leader>k", "<cmd>WinShift up<CR>")
map("n", "<leader><leader>l", "<cmd>WinShift right<CR>")
