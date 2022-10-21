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

-- nvim-tmux navigation
map('n', "<C-h>", function() require('nvim-tmux-navigation').NvimTmuxNavigateLeft() end, { silent = true })
map('n', "<C-j>", function() require('nvim-tmux-navigation').NvimTmuxNavigateDown() end, { silent = true })
map('n', "<C-k>", function() require('nvim-tmux-navigation').NvimTmuxNavigateUp() end, { silent = true })
map('n', "<C-l>", function() require('nvim-tmux-navigation').NvimTmuxNavigateRight() end, { silent = true })
map('n', "<C-\\>", function() require('nvim-tmux-navigation').NvimTmuxNavigateLastActive() end, { silent = true })
map('n', "<C-Space>", function() require('nvim-tmux-navigation').NvimTmuxNavigateNext() end, { silent = true })

-- telescope
map('n', "<leader>ff", function() require('telescope.builtin').find_files() end, { silent = true })
map("n", "<leader>FF", function() require('telescope.builtin').current_buffer_fuzzy_find() end)
map("n", "<leader>fg", function() require('telescope.builtin').live_grep() end)
map("n", "<leader>fG", function() require('telescope.builtin').grep_string() end)
map("n", "<leader>fb", function() require('telescope.builtin').buffers() end)
map("n", "<leader>fh", function() require('telescope.builtin').help_tags() end)
map("n", "<leader>fr", function() require('telescope.builtin').lsp_references() end)
map("n", "<leader>fs", function() require('telescope.builtin').lsp_document_symbols() end)
map("n", "<leader>ft", function() require('telescope.builtin').treesitter() end)
map("n", "<leader>gb", function() require('telescope.builtin').git_branches() end)
map("n", "<leader>gc", function() require('telescope.builtin').git_commits() end)
map("n", "<leader>bc", function() require('telescope.builtin').git_bcommits() end)
map("n", "<leader>rr", function() require('telescope.builtin').registers() end)
map("n", "<leader>dd", function() require('telescope.builtin').diagnostics() end)
map("n", "<leader>gw", function() require('telescope').extensions.git_worktree.git_worktrees() end)
map("n", "<leader>gW", function() require('telescope').extensions.git_worktree.create_git_worktree() end)

-- winshift
map("n", "<leader><leader>w", function() require('Winshift.lib').start_move_mode() end)
map("n", "<leader><leader>s", function() require('WinShift.lib').start_swap_mode("swap") end)
map("n", "<leader><leader>h", function() require('WinShift.lib').move_win(api.nvim_get_current_win(), 'left') end)
map("n", "<leader><leader>j", function() require('WinShift.lib').move_win(api.nvim_get_current_win(), 'down') end)
map("n", "<leader><leader>k", function() require('WinShift.lib').move_win(api.nvim_get_current_win(), 'up') end)
map("n", "<leader><leader>l", function() require('WinShift.lib').move_win(api.nvim_get_current_win(), 'right') end)

-- barbar
map("n", "<Tab>", "<cmd>BufferNext<CR>")
map("n", "<S-Tab>", "<cmd>BufferPrevious<CR>")

-- neogit
map("n", "<leader>gg", function() require('neogit').open() end)

-- nvim tree
map('n', '<leader>t', function() require("nvim-tree").toggle() end)
