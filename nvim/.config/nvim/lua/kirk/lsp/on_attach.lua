on_attach = function(client, bufnr)
	local function buf_set_keymap(...) vim.api.nvim_buf_set_keymap(bufnr, ...) end

	local function buf_set_option(...) vim.api.nvim_buf_set_option(bufnr, ...) end

	buf_set_option('omnifunc', 'v:lua.vim.lsp.omnifunc')

	-- Set some keybinds conditional on server capabilities
	if client.supports_method('textDocument/formatting') then
		local opts = { noremap = true, silent = true }
		buf_set_keymap("n", "ff", "<cmd>lua vim.lsp.buf.format { async = true }<CR>", opts)
	end

	-- Set autocommands conditional on server_capabilities
	local capabilities = client.server_capabilities
	if capabilities == nil then
		capabilities = vim.lsp.protocol.make_client_capabilities()
	end

	if capabilities.document_highlight then
		vim.api.nvim_exec([[
			hi LspReferenceRead cterm=bold ctermbg=DarkMagenta guibg=LightYellow
			hi LspReferenceText cterm=bold ctermbg=DarkMagenta guibg=LightYellow
			hi LspReferenceWrite cterm=bold ctermbg=DarkMagenta guibg=LightYellow
			augroup lsp_document_highlight
				autocmd! * <buffer>
				autocmd CursorHold <buffer> lua vim.lsp.buf.document_highlight()
				autocmd CursorMoved <buffer> lua vim.lsp.buf.clear_references()
			augroup END
		]], false)
	end
end
