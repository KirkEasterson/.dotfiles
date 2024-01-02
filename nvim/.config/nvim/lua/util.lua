local uname = vim.loop.os_uname()

_G.OS = uname.sysname
_G.IS_MAC = OS == "Darwin"
_G.IS_LINUX = OS == "Linux"
_G.IS_WINDOWS = OS:find("Windows") and true or false
_G.IS_WSL = IS_LINUX and uname.release:find("Microsoft") and true or false

local M = {}

function M.map(mode, lhs, rhs, opts)
	local options = { noremap = true, silent = true }
	if opts then
		options = vim.tbl_extend("force", options, opts)
	end
	vim.keymap.set(mode, lhs, rhs, options)
end

function M.tprint(tbl, indent)
	if not indent then
		indent = 0
	end
	local toprint = string.rep(" ", indent) .. "{\r\n"
	indent = indent + 2
	for k, v in pairs(tbl) do
		toprint = toprint .. string.rep(" ", indent)
		if type(k) == "number" then
			toprint = toprint .. "[" .. k .. "] = "
		elseif type(k) == "string" then
			toprint = toprint .. k .. "= "
		end
		if type(v) == "number" then
			toprint = toprint .. v .. ",\r\n"
		elseif type(v) == "string" then
			toprint = toprint .. "\"" .. v .. "\",\r\n"
		elseif type(v) == "table" then
			toprint = toprint .. M.tprint(v, indent + 2) .. ",\r\n"
		else
			toprint = toprint .. "\"" .. tostring(v) .. "\",\r\n"
		end
	end
	toprint = toprint .. string.rep(" ", indent - 2) .. "}"
	return toprint
end

function M.startswith(text, prefix)
	return text:find(prefix, 1, true) == 1
end

function M.indocker()
	local handle = io.popen("head -n 1 /proc/1/sched")
	if handle == nil then
		return false
	end

	local result = handle:read("*a")
	if result == nil then
		return false
	end

	handle:close()
	return M.startswith(result, "bash") or M.startswith(result, "sh")
end

function M.table_concat(...)
	local arg = { ... }
	local result = {}
	for i = 1, #arg do
		for j = 1, #arg[i] do
			result[#result + 1] = arg[i][j]
		end
	end

	return result
end

function M.lpad(str, len, char)
	if char == nil then
		char = " "
	end
	return str .. string.rep(char, len - #str)
end

function M.rpad(str, len, char)
	if char == nil then
		char = " "
	end
	return string.rep(char, len - #str) .. str
end

function M.cpad(str, len, char)
	local str_len = string.len(str)
	if str_len >= len then
		return str
	end

	if char == nil then
		char = " "
	end

	while string.len(str) < len do
		str = char .. str .. char
	end

	return str
end

function M.tbl_cpad(tbl, len, char)
	for i = 1, #tbl do
		tbl[i] = M.cpad(tbl[i], len, char)
	end

	return tbl
end

return M
