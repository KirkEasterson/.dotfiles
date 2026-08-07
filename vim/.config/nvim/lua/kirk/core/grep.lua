vim.opt.wildignore:append({
  "*.aux",
  "*.bbl",
  "*.blg",
  "*.cls",
  "*.fdb",
  "*.fdb_latexmk",
  "*.fls",
  "*.glo",
  "*.ist",
  "*.log",
  "*.o",
  "*.out",
  "*.pyc",
  "*.toc",
  "*pycache*",
  "*~",
  "Cargo.Bazel.lock",
  "Cargo.lock",
  "__pycache__",
  "__site",
  "**/node_modules/**",
  "target",
  "venv",
})

if vim.fn.executable("rg") == 1 then
  vim.opt.grepprg = "rg --vimgrep --smart-case --hidden"
  vim.opt.grepformat = "%f:%l:%c:%m"
end

-- taken from https://www.reddit.com/r/neovim/comments/1t86svd/how_to_make_find_fast/
local findfunc
if vim.fn.executable("fd") == 1 then
  findfunc = "fd"
elseif vim.fn.executable("fdfind") == 1 then
  findfunc = "fdfind"
else
  vim.opt.path:append({ "**" })
end

function UseFd(cmdarg, _)
  local param = vim.fn.getcwd() .. ".*" .. tostring(cmdarg)
  return vim.fn.systemlist({ findfunc, "--type", "f", "--hidden", "--exclude", ".git", "--full-path", param })
end

vim.o.findfunc = "v:lua.UseFd"
