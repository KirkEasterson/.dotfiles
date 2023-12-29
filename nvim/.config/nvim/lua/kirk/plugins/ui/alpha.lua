return {
	"goolord/alpha-nvim",
	dependencies = {
		"nvim-tree/nvim-web-devicons",
		"BlakeJC94/alpha-nvim-fortune",
	},
	cond = not vim.g.started_by_firenvim,
	lazy = false,
	priority = 999, -- 1 less than gruvbox
	config = function(_, opts)
		local art = require("art")
		local month_arts = {
			[1] = art.new_years,
			[2] = art.valentines,
			[3] = art.st_paddys,
			[4] = art.easter,
			[5] = art.flowers,
			[6] = art.summer,
			[7] = art.moon,
			[8] = art.summer,
			[9] = art.fall,
			[10] = art.halloween,
			[11] = art.thanksgiving,
			[12] = art.christmas,
		}

		local dashboard = require("alpha.themes.dashboard")
		dashboard.section.header.val = month_arts[os.date("*t").month]
		dashboard.section.buttons.val = {
			dashboard.button("e", "  > New file", ":ene <BAR> startinsert <CR>"),
			dashboard.button("f", "󰈞  > Find file", ":Telescope find_files<CR>"),
			dashboard.button("o", "  > Recent", ":Telescope oldfiles<CR>"),
			dashboard.button("r", "󰦛  > Restore session", ":SessionRestore<CR>"),
			dashboard.button("t", "  > File tree", ":NvimTreeOpen<CR>"),
			dashboard.button("q", "󰅚  > Quit NVIM", ":qa<CR>"),
		}

		local fortune = require("alpha.fortune")
		dashboard.section.footer.val = fortune()

		require("alpha").setup(dashboard.opts)
	end,
	init = function()
		vim.api.nvim_create_autocmd({ "FileType" }, {
			pattern = { "alpha" },
			callback = function()
				vim.opt_local.foldenable = false
			end,
			desc = "Disable folding in Alpha",
		})

		vim.api.nvim_create_autocmd("User", {
			pattern = { "AlphaReady" },
			callback = function()
				local prev_cmdheight = vim.opt.cmdheight
				local prev_showtabline = vim.opt.showtabline
				local prev_laststatus = vim.opt.laststatus

				vim.opt.cmdheight = 0
				vim.opt.showtabline = 0
				vim.opt.laststatus = 0

				vim.api.nvim_create_autocmd("BufUnload", {
					pattern = "<buffer>",
					callback = function()
						vim.opt.cmdheight = prev_cmdheight
						vim.opt.showtabline = prev_showtabline
						vim.opt.laststatus = prev_laststatus
					end,
				})
			end,
			desc = "Disable Bufferline And Lualine in Alpha",
		})
	end,
}
