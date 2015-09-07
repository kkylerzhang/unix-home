nnoremap <F7> :w<CR> :!gcc %<CR>
nnoremap <F5> :w<CR> :!gcc % && ./a.out<CR>
nnoremap <C-F5> :w<CR> :!gcc % && ./a.out<CR>

" pairs
" inoremap ( ()<LEFT>
" inoremap [ []<LEFT>
" inoremap { {}<LEFT><CR><UP><END><CR>
" inoremap ) <ESC>:call RemoveNextDoubleChar(')')<CR>a
" inoremap ] <ESC>:call RemoveNextDoubleChar(']')<CR>a
" inoremap } <ESC>:call RemoveNextDoubleChar('}')<CR>a
" inoremap <BS> <ESC>:call RemovePairs(["(", "[", "{"])<CR>a

" comment
vmap <C-U> <Esc>:call UnComment("//")<CR>
vmap <C-C> <Esc>:call Comment("//")<CR>
