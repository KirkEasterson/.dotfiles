set number relativenumber				" turn hybrid line numbers on
set cursorline						" highlight current line

set incsearch						" highlight matches as you type
set hlsearch						" highlight matches once a search is complete
set nohlsearch						" turn off search highlight

set autoindent						" new lines inherit the indentation of previous lines.
set nowrap							" don't wrap lines
set linebreak						" avoid wrapping a line in the middle of a word

set foldenable						" enable folding
set foldlevelstart=10					" open most folds by default
set foldnestmax=10					" 10 nested fold max
nnoremap <space> za					" space open/closes folds
set foldmethod=indent					" fold based on indent level

syntax enable						" enable syntax highlighting
set showmatch						" highlight matching [{()}]

set scrolloff=8						" scroll when x away from edge
set signcolumn=yes					" column for linting
set colorcolumn=80					" 80col limit

set tabstop=4						" number of visual spaces per TAB
set softtabstop=4					" number of spaces in tab when editing
set shiftwidth=4					" number of spaces when indenting with <>
filetype indent on					" load filetype-specific indent files

set laststatus=2					" always display the status bar

set mouse=a						" enable mouse for scrolling and resizing

set spell						" enable spellchecking

set wildmenu						" visual autocomplete for command menu

augroup WrapLineInLatexFile
	autocmd!
	autocmd FileType tex setlocal wrap
augroup END

augroup WrapLineInMarkdownFile
	autocmd!
	autocmd FileType markdown setlocal wrap
augroup END

"set lazyredraw						" redraw only when we need to.

set exrc							" use local vimrc, if it exists

" nnoremap j gj						" move vertically by visual line
" nnoremap k gk						" move vertically by visual line

" ThePrimeagen remappings
" 'Y' to behave like other capitals
nnoremap Y $y

" easier navigation
nnoremap n nzzzv
nnoremap N Nzzzv
nnoremap J mzJ`z

" easier undos
inoremap , ,<c-g>u
inoremap . .<c-g>u
inoremap [ [<c-g>u
inoremap ! !<c-g>u
inoremap ? ?<c-g>u

" add large enough relative jumps to jump list
nnoremap <expr> j (v:count > 5 ? "m'" . v:count : "") . 'gj'
nnoremap <expr> k (v:count > 5 ? "m'" . v:count : "") . 'gk'

" move text
vnoremap J :m '>+1<CR>gv=gv
vnoremap K :m '<-2<CR>gv=gv
inoremap <C-j> <esc>:m .+1<CR>==
inoremap <C-k> <esc>:m .-2<CR>==
nnoremap <leader>j :m .+1<CR>==
nnoremap <leader>k :m .-2<CR>==

nnoremap <silent> ff    <cmd>lua vim.lsp.buf.formatting()<CR>

" Build if a note file
autocmd BufwritePost *note-*.md silent !~/scripts/build_notes.sh %:p

" transparent background
au ColorScheme * hi Normal ctermbg=none guibg=none

" gitgutter config
highlight GitGutterAdd guifg=#009900 ctermfg=Green
highlight GitGutterChange guifg=#BBBB00 ctermfg=Yellow
highlight GitGutterDelete guifg=#FF2222 ctermfg=Red

" comments in jsonc
autocmd FileType json syntax match Comment +\/\/.\+$+

""" Leader shortcuts
let mapleader=","					" leader is comma

inoremap jk <esc>" jk is escap				" jk is escape

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

call plug#end()

nnoremap <leader>f :NERDTreeToggle<CR>

" auto-install any missing plugins
autocmd VimEnter *
  \  if len(filter(values(g:plugs), '!isdirectory(v:val.dir)'))
  \|   PlugInstall --sync | q
  \| endif

colorscheme gruvbox

set completeopt=menu,menuone,noselect

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
