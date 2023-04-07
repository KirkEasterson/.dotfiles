local gitsigns_bar = '┃'

local gitsigns_hl_pool = {
	GitSignsAdd          = "DiagnosticOk",
	GitSignsChange       = "DiagnosticWarn",
	GitSignsChangedelete = "DiagnosticWarn",
	GitSignsDelete       = "DiagnosticError",
	GitSignsTopdelete    = "DiagnosticError",
	GitSignsUntracked    = "NonText",
}

local diag_signs_icons = {
	DiagnosticSignError = " ",
	DiagnosticSignWarn  = " ",
	DiagnosticSignInfo  = " ",
	DiagnosticSignHint  = " ",
	DiagnosticSignOk    = " ",
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
		return "│"
		-- return ""
	end
end

local get_statuscol_diag = function(bufnum, lnum)
	local cur_sign_nm = get_name_from_group(bufnum, lnum, "*")

	if cur_sign_nm ~= nil and vim.startswith(cur_sign_nm, "DiagnosticSign") then
		return mk_hl(cur_sign_nm, diag_signs_icons[cur_sign_nm])
	else
		return ""
	end
end

return {
	"luukvbaal/statuscol.nvim",
	dependencies = {
		"lewis6991/gitsigns.nvim",
		"folke/todo-comments.nvim",
	},
	enabled = function() return vim.fn.has('nvim-0.9') == 1 end,
	event = 'VeryLazy',
	config = function()
		local builtin = require("statuscol.builtin")
		require("statuscol").setup({
			setopt = true,
			relculright = true,
			segments = {
				{ -- diagnsotics
					text = {
						function()
							return get_statuscol_diag(vim.fn.bufnr(), vim.v.lnum)
						end
					},
					condition = { true },
				},
				{ -- line numbers
					text = { builtin.lnumfunc },
					condition = { true },
					click = "v:lua.ScLa",
				},
				{ -- git signs
					text = {
						function()
							return get_statuscol_gitsign(vim.fn.bufnr(), vim.v.lnum)
						end
					},
					condition = { true },
				},
				{ -- fold
					text = { builtin.foldfunc },
					condition = { true },
					click = "v:lua.ScFa",
				},
			},
		})
	end
}
