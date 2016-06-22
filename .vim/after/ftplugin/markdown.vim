" Tab related
set ts=2
set sw=2

" delimitMate
let b:delimitMate_quotes = "\" ' `"
let b:delimitMate_nesting_quotes = ['`']

" mapping
noremap <F5> <Esc>:!open %<CR>
inoremap <expr> <CR> Expander()
nnoremap <leader>yf :let @*=JekyllUrl()<CR>

" functions
function! Expander()
    let line   = getline(".")
    let col    = col(".") - 1

    if line[0:2] ==# "```" && line[col : col+2] ==# "```"
      return "\<CR>\<Esc>O"
    endif

    if line[0:2] ==# "---"
      return "\<CR>---\<Esc>Otitle: "
    endif

    if line[col-1] ==# "{" && line[col] ==# "}"
      return "\<CR>\<Esc>O    "
    endif

    return "\<CR>"
endfunction

function! JekyllUrl()
    " 2016-06-22-some-thing.md
    let file = expand("%:t")
    let file = split(file, '\.')[0]
    let url = '/' . file[0:3] . '/' .file[5:6] . '/' . file[8:9] . '/' . file[11:] . '.html'
    return url
endfunction
