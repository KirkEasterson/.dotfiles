setlocal textwidth=80
setlocal formatoptions=tcroqanv

setlocal wrap " wrap lines
setlocal tabstop=2 " number of visual spaces per tab
setlocal softtabstop=2 " number of spaces in tab when editing
setlocal shiftwidth=2 " number of spaces when indenting with <> keys
setlocal expandtab " use spaces for tabs

" build notes
autocmd BufWritePost *note-*.md silent !notes.sh build %:p
