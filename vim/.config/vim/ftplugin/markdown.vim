let g:markdown_fenced_languages = ['python', 'javascript', 'typescript', 'html', 'css', 'bash', 'vim', 'go', 'mermaid']
let g:markdown_frontmatter = 1
let g:markdown_json_frontmatter = 1
let g:markdown_recommended_style=0
let g:markdown_toml_frontmatter = 1

" setlocal textwidth=80
setlocal formatoptions=croqnv1j

setlocal wrap " wrap lines
setlocal tabstop=2 " number of visual spaces per tab
setlocal softtabstop=2 " number of spaces in tab when editing
setlocal shiftwidth=2 " number of spaces when indenting with <> keys
setlocal expandtab " use spaces for tabs

" build notes
autocmd BufWritePost *note-*.md silent !nohup notes.sh build %:p &
