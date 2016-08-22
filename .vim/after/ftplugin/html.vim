" Tab related
set ts=2
set sw=2

noremap <F5> <Esc>:!open %<CR>
inoremap <expr> <CR> Expander()

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

