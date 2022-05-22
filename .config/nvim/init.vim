source $HOME/.vim/vimrc

" fast update times
set updatetime=100

" tabs of open buffers on top
let g:airline_powerline_fonts = 1
let g:airline#extensions#tabline#enabled = 1
let g:airline#extensions#tabline#formatter = 'unique_tail'
let g:airline#extensions#tabline#left_sep = ' '
let g:airline#extensions#tabline#left_alt_sep = ''
let g:airline_highlighting_cache = 1

" gruvbox config
let g:gruvbox_italic = 1
let g:gruvbox_contrast_dark = 'hard'

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

	" lsp
	Plug 'neovim/nvim-lspconfig'
	Plug 'nvim-lua/plenary.nvim'
	Plug 'nvim-lua/popup.nvim'
	Plug 'hrsh7th/nvim-cmp'
	Plug 'hrsh7th/cmp-nvim-lsp'
	Plug 'hrsh7th/cmp-buffer'
	Plug 'hrsh7th/cmp-path'
	Plug 'L3MON4D3/LuaSnip'
	Plug 'saadparwaiz1/cmp_luasnip'
	Plug 'rcarriga/nvim-dap-ui'
	Plug 'leoluz/nvim-dap-go'

	" telescope/harpoon
	Plug 'nvim-telescope/telescope.nvim'
	Plug 'nvim-telescope/telescope-fzy-native.nvim'
	Plug 'ThePrimeagen/harpoon'

	" git
	Plug 'tpope/vim-fugitive'
	Plug 'tpope/vim-rhubarb'
	Plug 'mhinz/vim-signify'

	" general utility
	Plug 'numToStr/Comment.nvim'
	Plug 'tpope/vim-surround'
	Plug 'jiangmiao/auto-pairs'
	Plug 'mbbill/undotree'

	" debugger
	Plug 'mfussenegger/nvim-dap'

	" a e s t h e t i c
	Plug 'gruvbox-community/gruvbox'
	Plug 'vim-airline/vim-airline'
	Plug 'ryanoasis/vim-devicons'
	Plug 'psliwka/vim-smoothie'

	" language specific, because I'm lazy
	Plug 'simrat39/rust-tools.nvim'

	" misc
	Plug 'jbyuki/venn.nvim'
	Plug 'preservim/nerdtree'

call plug#end()

nnoremap <leader>t :NERDTreeToggle<CR>

colorscheme gruvbox
highlight Normal guibg=none

" load init.lua
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
