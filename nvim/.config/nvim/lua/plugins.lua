local ensure_packer = function()
	local fn = vim.fn
	local install_path = fn.stdpath('data') .. '/site/pack/packer/start/packer.nvim'
	if fn.empty(fn.glob(install_path)) > 0 then
		fn.system({ 'git', 'clone', '--depth', '1', 'https://github.com/wbthomason/packer.nvim', install_path })
		vim.cmd [[packadd packer.nvim]]
		return true
	end
	return false
end

local packer_bootstrap = ensure_packer()

return require('packer').startup(function(use)
	use 'wbthomason/packer.nvim'

	use {
		'lewis6991/impatient.nvim',
		config = function() require("kirk.impatient") end,
	}

	-- a e s t h e t i c
	use {
		'ellisonleao/gruvbox.nvim',
		config = function() require("kirk.gruvbox") end,
	}
	-- use {
	-- 	"rcarriga/nvim-notify",
	-- 	config = function() require("kirk.nvim-notify") end,
	-- }
	-- use({
	-- 	"folke/noice.nvim",
	-- 	requires = {
	-- 		"MunifTanjim/nui.nvim",
	-- 		"rcarriga/nvim-notify",
	-- 	},
	-- 	config = function() require("kirk.noice") end,
	-- 	event = "VimEnter",
	-- })
	use {
		"folke/trouble.nvim",
		requires = "kyazdani42/nvim-web-devicons",
		config = function() require("kirk.trouble") end,
	}
	use {
		'nvim-lualine/lualine.nvim',
		requires = { 'kyazdani42/nvim-web-devicons', opt = true },
		config = function() require("kirk.lualine") end,
	}
	use {
		'echasnovski/mini.nvim',
		branch = 'main',
		config = function() require("kirk.mini") end,
	}
	use {
		'petertriho/nvim-scrollbar',
		config = function() require("kirk.scrollbar") end,
	}
	use 'kyazdani42/nvim-web-devicons' -- this shouldn't be necessary
	use {
		'romgrk/barbar.nvim',
		requires = {
			'kyazdani42/nvim-web-devicons'
		},
		config = function() require("kirk.barbar") end,
	}
	use {
		'goolord/alpha-nvim',
		requires = {
			'nvim-tree/nvim-web-devicons',
			'BlakeJC94/alpha-nvim-fortune',
		},
		config = function() require("kirk.alpha") end,
	}

	-- lsp
	use 'williamboman/mason.nvim'
	use 'williamboman/mason-lspconfig.nvim'
	use {
		'neovim/nvim-lspconfig',
		config = function() require("kirk.lsp.lsp") end,
	}
	use 'nvim-treesitter/nvim-treesitter-context'
	use 'nvim-treesitter/nvim-treesitter-textobjects'
	use 'nvim-treesitter/nvim-treesitter-refactor'
	use {
		'nvim-treesitter/nvim-treesitter',
		requires = {
			'nvim-treesitter/nvim-treesitter-context',
			'nvim-treesitter/nvim-treesitter-textobjects',
		},
		run = function()
			require('nvim-treesitter.install').update({ with_sync = true })
		end,
		config = function() require("kirk.treesitter") end,
	}
	use {
		'jose-elias-alvarez/null-ls.nvim',
		config = function() require("kirk.null-ls") end,
	}
	use {
		'theHamsta/nvim-semantic-tokens',
		config = function() require("kirk.lsp.semantic_tokens") end,
	}
	use {
		'kylechui/nvim-surround',
		tag = "*",
		config = function() require("kirk.surround") end,
	}
	use {
		'm-demare/hlargs.nvim',
		requires = {
			'nvim-treesitter/nvim-treesitter',
		},
		config = function() require("kirk.lsp.hlargs") end,
	}
	use {
		'stevearc/aerial.nvim',
		config = function() require("kirk.lsp.aerial") end,
	}

	-- completion
	use "hrsh7th/cmp-buffer"
	use "hrsh7th/cmp-nvim-lsp"
	use "hrsh7th/cmp-path"
	use "onsails/lspkind.nvim"
	use "saadparwaiz1/cmp_luasnip"
	use {
		'hrsh7th/nvim-cmp',
		requires = {
			"hrsh7th/cmp-buffer",
			"hrsh7th/cmp-nvim-lsp",
			"hrsh7th/cmp-path",
			"onsails/lspkind.nvim",
			"saadparwaiz1/cmp_luasnip",
		},
		config = function() require("kirk.lsp.completion") end,
	}

	-- snippets
	use {
		'L3MON4D3/LuaSnip',
		requires = { "rafamadriz/friendly-snippets" },
		config = function() require("kirk.snippets.snippets") end,
	}

	-- telescope
	use 'nvim-lua/plenary.nvim'
	use 'nvim-telescope/telescope-fzy-native.nvim'
	use {
		'ThePrimeagen/git-worktree.nvim',
		config = function() require("kirk.git.git-worktree") end,
	}
	use {
		'nvim-telescope/telescope.nvim',
		requires = {
			'nvim-lua/plenary.nvim',
			'nvim-telescope/telescope-fzy-native.nvim',
			'ThePrimeagen/git-worktree.nvim',
			-- 'folke/noice.nvim',
		},
		config = function() require("kirk.telescope") end,
	}

	-- git
	use {
		'lewis6991/gitsigns.nvim',
		config = function() require("kirk.gitsigns") end,
	}
	use {
		'pwntester/octo.nvim',
		requires = {
			'nvim-lua/plenary.nvim',
			'nvim-telescope/telescope.nvim',
			'kyazdani42/nvim-web-devicons',
		},
		config = function() require("kirk.octo") end,
	}

	-- general utility
	use {
		'rmagatti/auto-session',
		config = function() require("kirk.auto_session") end,
	}
	use {
		'numToStr/Comment.nvim',
		config = function() require("kirk.comment") end,
	}
	use {
		'windwp/nvim-autopairs',
		config = function() require("kirk.autopairs") end,
	}
	-- use 'mbbill/undotree'
	use {
		'lukas-reineke/indent-blankline.nvim',
		config = function() require("kirk.indent") end,
	}
	use {
		"akinsho/toggleterm.nvim",
		tag = '*',
		config = function() require("kirk.toggleterm") end,
	}


	-- language specific, because I'm lazy
	use {
		'simrat39/rust-tools.nvim',
		requires = {
			'nvim-lua/plenary.nvim',
		},
		config = function() require("kirk.lsp.rust") end,
	}
	use {
		'jose-elias-alvarez/nvim-lsp-ts-utils',
		config = function() require("kirk.lsp.ts") end,
	}
	use {
		'euclidianAce/BetterLua.vim',
		config = function() require("kirk.lsp.nlua") end,
	}

	-- misc
	use {
		'kyazdani42/nvim-tree.lua',
		requires = {
			'nvim-tree/nvim-web-devicons',
		},
		config = function() require("kirk.nvim-tree") end,
	}
	use {
		'sindrets/winshift.nvim',
		config = function() require("kirk.winshift") end,
	}
	use {
		'monaqa/dial.nvim',
		config = function() require("kirk.dial") end,
	}
	use {
		'aserowy/tmux.nvim',
		config = function() require("kirk.tmux-nvim") end,
	}
	use {
		"folke/todo-comments.nvim",
		requires = "nvim-lua/plenary.nvim",
		config = function() require("kirk.todo-comments") end,
	}
	use {
		"nvim-zh/colorful-winsep.nvim",
		config = function() require("kirk.colorful-winsep") end,
	}
	use {
		"eandrju/cellular-automaton.nvim",
		config = function() require("kirk.cellular-automaton") end,
	}
	-- use {
	-- 	'lervag/vimtex',
	-- 	config = function() require("kirk.vimtex") end,
	-- }
	use {
		'kamykn/spelunker.vim',
		config = function() require("kirk.spelunker") end,
	}
	-- use({
	-- 	"jackMort/ChatGPT.nvim",
	-- 	config = function()
	-- 		require("chatgpt").setup({
	-- 			welcome_message = "",
	-- 		})
	-- 	end,
	-- 	requires = {
	-- 		"MunifTanjim/nui.nvim",
	-- 		"nvim-lua/plenary.nvim",
	-- 		"nvim-telescope/telescope.nvim"
	-- 	}
	-- })

	if packer_bootstrap then
		require('packer').sync()
	end
end)
