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
filetype indent on					" load filetype-specific indent files

set laststatus=2					" always display the status bar

set mouse=a						" enable mouse for scrolling and resizing

set spell						" enable spellchecking

set wildmenu						" visual autocomplete for command menu

"set lazyredraw						" redraw only when we need to.

set exrc							" use local vimrc, if it exists

nnoremap j gj						" move vertically by visual line
nnoremap k gk						" move vertically by visual line


""" Leader shortcuts
let mapleader=","					" leader is comma

inoremap jk <esc>" jk is escap				" jk is escape


call plug#begin()

Plug 'https://github.com/gruvbox-community/gruvbox'
Plug 'https://github.com/vim-airline/vim-airline'
Plug 'https://github.com/preservim/nerdtree'
Plug 'https://github.com/ryanoasis/vim-devicons'
Plug 'https://github.com/tpope/vim-commentary'
Plug 'https://github.com/neoclide/coc.nvim'

call plug#end()

nnoremap <C-f> :NERDTreeToggle<CR>

set number relativenumber				" turn hybrid line numbers on
colorscheme gruvbox
