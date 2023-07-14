local gitsigns_bar = '│'

local gitsigns_hl_pool = {
	GitSignsAdd          = "DiagnosticOk",
	GitSignsChange       = "DiagnosticWarn",
	GitSignsChangedelete = "DiagnosticWarn",
	GitSignsDelete       = "DiagnosticError",
	GitSignsTopdelete    = "DiagnosticError",
	GitSignsUntracked    = "NonText",
}

local diag_signs_icons = {
	DiagnosticSignError = "󰅘",
	DiagnosticSignWarn  = "",
	DiagnosticSignInfo  = "󰋽",
	DiagnosticSignHint  = "󰌶",
	DiagnosticSignOk    = "󰄬",
}

local debug_signs_icons = {
	DapBreakpoint          = "",
	DapBreakpointCondition = "󰋗",
	DapBreakpointRejected  = "󰅙",
	DapLogPoint            = "󰛿",
}

local function get_sign_name(cur_sign)
	if (cur_sign == nil) then
		return nil
	end

	cur_sign = cur_sign[1]

	if (cur_sign == nil) then
		return nil
	end

	cur_sign = cur_sign.signs

	if (cur_sign == nil) then
		return nil
	end

	cur_sign = cur_sign[1]

	if (cur_sign == nil) then
		return nil
	end

	return cur_sign["name"]
end

local function mk_hl(group, sym)
	return table.concat({ "%#", group, "#", sym, "%*" })
end

local function get_name_from_group(bufnum, lnum, group)
	local cur_sign_tbl = vim.fn.sign_getplaced(bufnum, {
		group = group,
		lnum = lnum
	})

	return get_sign_name(cur_sign_tbl)
end

local get_statuscol_gitsign = function(bufnr, lnum)
	local cur_sign_nm = get_name_from_group(bufnr, lnum, "gitsigns_vimfn_signs_")

	if cur_sign_nm ~= nil then
		return mk_hl(gitsigns_hl_pool[cur_sign_nm], gitsigns_bar)
	else
		return gitsigns_bar
	end
end

local get_statuscol_diag = function(bufnum, lnum)
	local cur_sign_nm = get_name_from_group(bufnum, lnum, "*")

	if cur_sign_nm ~= nil and vim.startswith(cur_sign_nm, "DiagnosticSign") then
		return mk_hl(cur_sign_nm, diag_signs_icons[cur_sign_nm] .. " ")
	else
		return "  "
	end
end

local get_statuscol_debug = function(bufnum, lnum)
	local cur_sign_nm = get_name_from_group(bufnum, lnum, "dap_breakpoints")

	if cur_sign_nm ~= nil and vim.startswith(cur_sign_nm, "Dap") then
		return mk_hl(cur_sign_nm, debug_signs_icons[cur_sign_nm] .. " ")
	else
		return "  "
	end
end

local filter_table = function(t, filterIter)
	local out = {}
	for k, v in pairs(t) do
		if filterIter(v) then
			table.insert(out, v)
		end
	end
	return out
end

return {
	"luukvbaal/statuscol.nvim",
	dependencies = {
		"lewis6991/gitsigns.nvim",
		"folke/todo-comments.nvim",
		-- 'kevinhwang91/nvim-ufo',
	},
	event = 'VeryLazy',
	opts = {
		setopt = true,
		relculright = true,
		ft_ignore = {
			"help",
			"startify",
			"dashboard",
			"packer",
			"neogitstatus",
			"Trouble",
			"Alpha",
		},
		segments = {
			{
				-- diagnostics
				text = {
					function()
						return get_statuscol_diag(vim.fn.bufnr(), vim.v.lnum)
					end
				},
				condition = { function()
					local cur_sign_tbl = vim.fn.sign_getplaced(vim.fn.bufnr(), {
						group = "*",
					})
					local filtered_table = filter_table(cur_sign_tbl[1].signs, function(v)
						return string.find(v.name, "Diagnostic", 0, true)
					end)
					return next(filtered_table) ~= nil
				end
				},
			},
			{
				-- dap
				text = { function()
					return get_statuscol_debug(vim.fn.bufnr(), vim.v.lnum)
				end },
				condition = { function()
					local cur_sign_tbl = vim.fn.sign_getplaced(vim.fn.bufnr(), {
						group = "dap_breakpoints",
					})
					return next(cur_sign_tbl[1].signs) ~= nil
				end },
				-- click = "v:lua.ScLa",
			},
			{
				-- line numbers
				text = { require("statuscol.builtin").lnumfunc },
				condition = { true },
				click = "v:lua.ScLa",
			},
			{
				-- git signs
				text = {
					function()
						return get_statuscol_gitsign(vim.fn.bufnr(), vim.v.lnum)
					end
				},
				condition = { true },
			},
			-- { -- fold
			-- 	text = { require("statuscol.builtin").foldfunc },
			-- 	condition = { true },
			-- 	click = "v:lua.ScFa",
			-- },
		},
	},
}
