local get_ensure_installed = function()
	-- TODO: maybe use ENV variables
	local base_daps = {
		"bash",
		"delve",
		"js",
		"node2",
		"python",
	}

	if require("util").indocker() then
		return base_daps
	end

	return {
		unpack(base_daps),
		unpack({
			"haskell",
			"javadbg",
			"kotlin",
		}),
	}
end

local ensure_installed = get_ensure_installed()

return {
	"jay-babu/mason-nvim-dap.nvim",
	cond = not vim.g.started_by_firenvim,
	dependencies = {
		"williamboman/mason.nvim",
		"mfussenegger/nvim-dap",
	},
	event = "UIEnter",
	version = "v2.*",
	cmd = {
		"DapInstall",
		"DapUninstall",
	},
	opts = {
		automatic_installation = true,
		automatic_setup = true,
		ensure_installed = ensure_installed,
		handlers = {
			function(config)
				require("mason-nvim-dap").default_setup(config)
			end,
		},
	},
}
