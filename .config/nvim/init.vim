source $HOME/.vim/vimrc

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
	Plug 'nvim-treesitter/nvim-treesitter-context'
	Plug 'nvim-treesitter/nvim-treesitter-textobjects'
	Plug 'smjonas/inc-rename.nvim'
	Plug 'theHamsta/nvim-semantic-tokens'

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
	" Plug 'nvim-telescope/telescope-fzf-native.nvim', { 'do': 'make' }
	Plug 'nvim-telescope/telescope-fzy-native.nvim'
	" Plug 'nvim-telescope/telescope-frecency.nvim'
	Plug 'tami5/sqlite.lua'
	" Plug 'ThePrimeagen/harpoon'
	" Plug 'rmagatti/session-lens'

	" git
	Plug 'TimUntersberger/neogit'
	" Plug 'tpope/vim-rhubarb'
	Plug 'lewis6991/gitsigns.nvim'
	" Plug 'pwntester/octo.nvim'
	Plug 'ThePrimeagen/git-worktree.nvim'
	" Plug '~/dev/git-worktree.nvim/'

	" DB
	Plug 'tpope/vim-dadbod'
	Plug 'kristijanhusak/vim-dadbod-ui'

	" general utility
	Plug 'rmagatti/auto-session'
	Plug 'numToStr/Comment.nvim'
	" Plug 'jiangmiao/auto-pairs'
	Plug 'windwp/nvim-autopairs'
	" Plug 'mbbill/undotree'
	Plug 'lukas-reineke/indent-blankline.nvim'
	Plug 'ellisonleao/glow.nvim'
	" Plug 'lewis6991/spellsitter.nvim'
	Plug 'kamykn/spelunker.vim'
	Plug 'kamykn/popup-menu.nvim'

	" debugger
	" Plug 'mfussenegger/nvim-dap'
	" Plug 'rcarriga/nvim-dap-ui'
	" Plug 'leoluz/nvim-dap-go'

	" a e s t h e t i c
	Plug 'ellisonleao/gruvbox.nvim'
	Plug 'nvim-lualine/lualine.nvim'
	Plug 'kyazdani42/nvim-web-devicons'
	Plug 'karb94/neoscroll.nvim'
	Plug 'petertriho/nvim-scrollbar'
	Plug 'romgrk/barbar.nvim'
	" Plug 'goolord/alpha-nvim'
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
	Plug 'sindrets/winshift.nvim'
	Plug 'monaqa/dial.nvim'

call plug#end()

set mousemodel=extend

" vim dadbod
nnoremap <silent> <leader>du :DBUIToggle<CR>
nnoremap <silent> <leader>df :DBUIFindBuffer<CR>
nnoremap <silent> <leader>dr :DBUIRenameBuffer<CR>
nnoremap <silent> <leader>dl :DBUILastQueryInfo<CR>let g:db_ui_save_location = '~/.config/db_ui'

" spelunker
let g:enable_spelunker_vim = 1
let g:enable_spelunker_vim_on_readonly = 1
let g:spelunker_check_type = 2
let g:spelunker_highlight_type = 1
let g:spelunker_spell_bad_group = 'SpelunkerSpellBad'
let g:spelunker_complex_or_compound_word_group = 'SpelunkerComplexOrCompoundWord'
highlight SpelunkerSpellBad cterm=underline ctermfg=247 gui=undercurl guifg=NONE
highlight SpelunkerComplexOrCompoundWord cterm=underline ctermfg=NONE gui=undercurl guifg=NONE

" load init.lua
lua require('init')
