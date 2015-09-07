" Tab related
set ts=2
set sw=2

" pairs
inoremap ( ()<LEFT>
inoremap [ []<LEFT>
inoremap { {}<LEFT><CR><UP><END><CR>
inoremap ) <ESC>:call RemoveNextDoubleChar(')')<CR>a
inoremap ] <ESC>:call RemoveNextDoubleChar(']')<CR>a
inoremap } <ESC>:call RemoveNextDoubleChar('}')<CR>a
inoremap <BS> <ESC>:call RemovePairs(["(", "[", "{"])<CR>a

