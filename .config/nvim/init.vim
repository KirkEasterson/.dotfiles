source $HOME/.config/nvim/plug-config/coc.vim

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

"set lazyredraw						" redraw only when we need to.

set exrc							" use local vimrc, if it exists

nnoremap j gj						" move vertically by visual line
nnoremap k gk						" move vertically by visual line

" transparent background
au ColorScheme * hi Normal ctermbg=none guibg=none

" gitgutter config
highlight GitGutterAdd guifg=#009900 ctermfg=Green
highlight GitGutterChange guifg=#BBBB00 ctermfg=Yellow
highlight GitGutterDelete guifg=#FF2222 ctermfg=Red


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

	Plug 'gruvbox-community/gruvbox'
	Plug 'vim-airline/vim-airline'
	Plug 'airblade/vim-gitgutter'
	Plug 'preservim/nerdtree'
	Plug 'ryanoasis/vim-devicons'
	Plug 'tpope/vim-commentary'
	Plug 'neoclide/coc.nvim', {'branch': 'release'}

call plug#end()

nnoremap <C-f> :NERDTreeToggle<CR>

" auto-install any missing plugins
autocmd VimEnter *
  \  if len(filter(values(g:plugs), '!isdirectory(v:val.dir)'))
  \|   PlugInstall --sync | q
  \| endif

colorscheme gruvbox
