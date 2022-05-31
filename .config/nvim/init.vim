source $HOME/.vim/vimrc

" fast update times
set updatetime=100

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
	Plug 'nvim-treesitter/nvim-treesitter', {'do': ':TSUpdate'}

	" completion
	Plug 'hrsh7th/nvim-cmp'
	Plug 'hrsh7th/cmp-nvim-lsp'
	Plug 'hrsh7th/cmp-buffer'
	Plug 'hrsh7th/cmp-path'
	Plug 'onsails/lspkind.nvim'

	" snippets
	Plug 'L3MON4D3/LuaSnip'
	Plug 'saadparwaiz1/cmp_luasnip'

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
	Plug 'lukas-reineke/indent-blankline.nvim'
	Plug 'henriquehbr/nvim-startup.lua'

	" debugger
	Plug 'mfussenegger/nvim-dap'
	Plug 'rcarriga/nvim-dap-ui'
	Plug 'leoluz/nvim-dap-go'

	" a e s t h e t i c
	Plug 'gruvbox-community/gruvbox'
	Plug 'nvim-lualine/lualine.nvim'
	Plug 'ryanoasis/vim-devicons'
	Plug 'kyazdani42/nvim-web-devicons'
	Plug 'karb94/neoscroll.nvim'
	Plug 'petertriho/nvim-scrollbar'
	Plug 'romgrk/barbar.nvim'
	Plug 'goolord/alpha-nvim'

	" language specific, because I'm lazy
	Plug 'simrat39/rust-tools.nvim'
	Plug 'jose-elias-alvarez/null-ls.nvim'
	Plug 'jose-elias-alvarez/nvim-lsp-ts-utils'
	Plug 'windwp/nvim-ts-autotag'
	" Plug 'tjdevries/nlua.nvim'
	" Plug 'euclidianAce/BetterLua.vim'

	" misc
	Plug 'jbyuki/venn.nvim'
	Plug 'kyazdani42/nvim-tree.lua'

call plug#end()

" let g:indent_guides_enable_on_vim_startup = 1

nnoremap <leader>t :NvimTreeToggle<CR>

colorscheme gruvbox
highlight Normal guibg=none

" load init.lua
lua require('init')

