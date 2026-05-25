local augroup = vim.api.nvim_create_augroup
local autocmd = vim.api.nvim_create_autocmd

local notes_group = augroup("Notes", {})
autocmd("BufwritePost", {
	desc = "Build notes",
	group = notes_group,
	pattern = "*note-*.md",
	callback = function()
		local fn = vim.fn
		if not fn.executable("notes.sh") then
			return
		end
		fn.jobstart("notes.sh build " .. fn.expand("%%"))
	end,
})
