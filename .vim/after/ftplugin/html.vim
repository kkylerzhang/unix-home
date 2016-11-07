" Tab related
set ts=2
set sw=2

" vim-autoformat
let g:formatdef_htmlbeautify = '"'
    \. ' html-beautify -f -'
    \. ' --indent-size '.&sw
    \. ' --preserve-newlines'
    \. '"'

EmmetInstall

imap <buffer> <leader><tab> <leader>em,
map <buffer> <leader>a <leader>emd

noremap <buffer> <F5> <Esc>:!open %<CR>
inoremap <buffer> <expr> <CR> Expander()

" expand indent when Enter
function! Expander()
  let line   = getline(".")
  let col    = col(".")
  let first  = line[col-2]
  let second = line[col-1]
  let third  = line[col]

  if first ==# ">" && second ==# "<" && third ==# "/"
    return "\<CR>\<C-o>==\<C-o>O"
  endif
  return "\<CR>"
endfunction

