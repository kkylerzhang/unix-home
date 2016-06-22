" Tab related
set ts=2
set sw=2

let delimitMate_matchpairs = delimitMate_matchpairs.",<:>"

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

inoremap <expr> <CR> Expander()
