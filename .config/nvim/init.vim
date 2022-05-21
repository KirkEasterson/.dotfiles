source $HOME/.vim/vimrc

" gitgutter config
highlight GitGutterAdd guifg=#009900 ctermfg=Green
highlight GitGutterChange guifg=#BBBB00 ctermfg=Yellow
highlight GitGutterDelete guifg=#FF2222 ctermfg=Red

" Install vim-plug if not found
if empty(glob('~/.config/nvim/autoload/plug.vim'))
  silent !curl -fLo ~/.config/nvim/autoload/plug.vim --create-dirs
    \ https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
endif

" Run PlugInstall if there are missing plugins
autocmd VimEnter * if len(filter(values(g:plugs), '!isdirectory(v:val.dir)'))
  \| PlugInstall --sync | source ~/.config/nvim/init.vim
\| endif

call plug#begin('~/.config/nvim/plugged')

	Plug 'neovim/nvim-lspconfig'
	Plug 'numToStr/Comment.nvim'
	Plug 'gruvbox-community/gruvbox'
	Plug 'vim-airline/vim-airline'
	Plug 'airblade/vim-gitgutter'
	Plug 'preservim/nerdtree'
	Plug 'ryanoasis/vim-devicons'
	Plug 'tpope/vim-commentary'
	Plug 'jiangmiao/auto-pairs'
	Plug 'hrsh7th/nvim-cmp'
	Plug 'hrsh7th/cmp-nvim-lsp'
	Plug 'hrsh7th/cmp-buffer'
	Plug 'hrsh7th/cmp-path'
	Plug 'L3MON4D3/LuaSnip'
	Plug 'saadparwaiz1/cmp_luasnip'
	Plug 'nvim-lua/plenary.nvim'
	Plug 'nvim-telescope/telescope.nvim'
	Plug 'nvim-telescope/telescope-fzy-native.nvim'
	Plug 'mfussenegger/nvim-dap'
	Plug 'rcarriga/nvim-dap-ui'
	Plug 'leoluz/nvim-dap-go'
	Plug 'L3MON4D3/LuaSnip'
	Plug 'tpope/vim-surround'
	Plug 'simrat39/rust-tools.nvim'

call plug#end()

nnoremap <leader>f :NERDTreeToggle<CR>

" auto-install any missing plugins
autocmd VimEnter *
  \  if len(filter(values(g:plugs), '!isdirectory(v:val.dir)'))
  \|   PlugInstall --sync | q
  \| endif

colorscheme gruvbox

" Using Lua functions
nnoremap <leader>ff <cmd>lua require('telescope.builtin').find_files()<cr>
nnoremap <leader>fg <cmd>lua require('telescope.builtin').live_grep()<cr>
nnoremap <leader>fb <cmd>lua require('telescope.builtin').buffers()<cr>
nnoremap <leader>fh <cmd>lua require('telescope.builtin').help_tags()<cr>

lua require('init')


" lua <<EOF
" -- Prettier function for formatter
" local prettier = function()
"   return {
"     exe = "prettier",
"     args = { "--stdin-filepath", vim.fn.fnameescape(vim.api.nvim_buf_get_name(0)) },
"     stdin = true,
"   }
" end

" require("formatter").setup({
"   logging = false,
"   filetype = {
"     typescriptreact = { prettier },
"     javascriptreact = { prettier },
"     javascript = { prettier },
"     typescript = { prettier },
"     json = { prettier },
"     jsonc = { prettier },
"     html = { prettier },
"     css = { prettier },
"     scss = { prettier },
"     markdown = { prettier },
"     vue = { prettier },
"     lua = {
"       -- Stylua
"       function()
"         return {
"           exe = "stylua",
"           args = {},
"           stdin = false,
"         }
"       end,
"     },
"     python = {
"       -- autopep8
"       function()
"         return {
"           exe = "autopep8",
"           args = { "--in-place" },
"           stdin = false,
"         }
"       end,
"     },
"     --[[ yaml = {
"       -- yamlfmt
"       function()
"         return {
"           exe = "yamlfmt",
"           args = { "-w" },
"           stdin = false,
"         }
"       end,
"     }, ]]
"   },
" })

" -- Runs Formmater on save
" vim.api.nvim_exec(
"   [[
" augroup FormatAutogroup
"   autocmd!
"   autocmd BufWritePost *.js,*.jsx,*.ts,*.tsx,*.css,*.scss,*.md,*.html,*.lua,.*.json,*.jsonc,*.vue,*.py FormatWrite
" augroup END
" ]],
"   true
" )

" EOF
