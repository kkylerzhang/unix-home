" Tab related
set ts=2
set sw=2

" pairs
inoremap ( ()<LEFT>
inoremap [ []<LEFT>
inoremap { {}<LEFT>
inoremap ) <ESC>:call RemoveNextDoubleChar(')')<CR>a
inoremap ] <ESC>:call RemoveNextDoubleChar(']')<CR>a
inoremap } <ESC>:call RemoveNextDoubleChar('}')<CR>a
inoremap <BS> <ESC>:call RemovePairs(["(", "[", "{"])<CR>a

" comment
vmap <C-U> <Esc>:call UnComment("//")<CR>
vmap <C-C> <Esc>:call Comment("//")<CR>
