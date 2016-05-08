
" comment
vmap <C-U> <Esc>:call UnComment("#")<CR>
vmap <C-C> <Esc>:call Comment("#")<CR>

" pairs
inoremap ( ()<LEFT>
inoremap [ []<LEFT>
inoremap { {}<LEFT>
inoremap ) <ESC>:call RemoveNextDoubleChar(')')<CR>a
inoremap ] <ESC>:call RemoveNextDoubleChar(']')<CR>a
inoremap } <ESC>:call RemoveNextDoubleChar('}')<CR>a
inoremap <BS> <ESC>:call RemovePairs(["(", "[", "{"])<CR>a
