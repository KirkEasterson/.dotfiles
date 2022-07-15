source $HOME/.vim/vimrc

" fast update times
set updatetime=100

" making copying easier
set clipboard+=unnamedplus

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

set laststatus=3
" vim.cmd('highlight WinSeparator guibg=None') " TODO: Figure out why this isn't working

call plug#begin('~/.config/nvim/plugged')

	" lsp
	Plug 'neovim/nvim-lspconfig'
	Plug 'nvim-lua/plenary.nvim'
	Plug 'nvim-lua/popup.nvim'
	Plug 'nvim-treesitter/nvim-treesitter', {'do': ':TSUpdate'}
	Plug 'smjonas/inc-rename.nvim'

	" completion
	Plug 'hrsh7th/nvim-cmp'
	Plug 'hrsh7th/cmp-nvim-lsp'
	Plug 'hrsh7th/cmp-buffer'
	Plug 'hrsh7th/cmp-path'
	Plug 'onsails/lspkind.nvim'

	" snippets
	Plug 'L3MON4D3/LuaSnip'
	Plug 'saadparwaiz1/cmp_luasnip'

	" telescope
	Plug 'nvim-telescope/telescope.nvim'
	" Plug 'nvim-telescope/telescope.nvim', {  'as': 'telescope-dev', 'branch': 'dev' }
	" Plug '~/dev/telescope.nvim/'
	Plug 'nvim-telescope/telescope-fzy-native.nvim'
	Plug 'nvim-telescope/telescope-frecency.nvim'
	Plug 'tami5/sqlite.lua'
	Plug 'ThePrimeagen/harpoon'

	" git
	Plug 'tpope/vim-fugitive'
	" Plug 'tpope/vim-rhubarb'
	Plug 'mhinz/vim-signify'

	" DB
	Plug 'tpope/vim-dadbod'
	Plug 'kristijanhusak/vim-dadbod-ui'

	" general utility
	Plug 'rmagatti/auto-session'
	Plug 'numToStr/Comment.nvim'
	Plug 'tpope/vim-surround'
	Plug 'jiangmiao/auto-pairs'
	" Plug 'mbbill/undotree'
	Plug 'lukas-reineke/indent-blankline.nvim'

	" debugger
	" Plug 'mfussenegger/nvim-dap'
	" Plug 'rcarriga/nvim-dap-ui'
	" Plug 'leoluz/nvim-dap-go'

	" a e s t h e t i c
	Plug 'gruvbox-community/gruvbox'
	Plug 'nvim-lualine/lualine.nvim'
	Plug 'ryanoasis/vim-devicons'
	Plug 'kyazdani42/nvim-web-devicons'
	Plug 'karb94/neoscroll.nvim'
	Plug 'petertriho/nvim-scrollbar'
	Plug 'romgrk/barbar.nvim'
	Plug 'goolord/alpha-nvim'
	" Plug 'norcalli/nvim-colorizer.lua'

	" language specific, because I'm lazy
	Plug 'simrat39/rust-tools.nvim'
	Plug 'jose-elias-alvarez/null-ls.nvim'
	Plug 'jose-elias-alvarez/nvim-lsp-ts-utils'
	Plug 'windwp/nvim-ts-autotag'
	" Plug 'tjdevries/nlua.nvim'
	Plug 'euclidianAce/BetterLua.vim'

	" misc
	" Plug 'jbyuki/venn.nvim'
	Plug 'kyazdani42/nvim-tree.lua'

call plug#end()

nnoremap <leader>t :NvimTreeToggle<CR>

colorscheme gruvbox
highlight Normal guibg=none

" vim dadbod
nnoremap <silent> <leader>du :DBUIToggle<CR>
nnoremap <silent> <leader>df :DBUIFindBuffer<CR>
nnoremap <silent> <leader>dr :DBUIRenameBuffer<CR>
nnoremap <silent> <leader>dl :DBUILastQueryInfo<CR>let g:db_ui_save_location = '~/.config/db_ui'

" load init.lua
lua require('init')

