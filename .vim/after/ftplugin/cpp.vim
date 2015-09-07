nnoremap <F5> <Esc>:w<CR>:!g++ -std=c++11 % -o /tmp/a.out && /tmp/a.out<CR>
nnoremap <F6> <Esc>:w<CR>:!g++ -std=c++11 % -o /tmp/a.out && /tmp/a.out > test.out<CR>
nnoremap <F7> <Esc>:w<CR>:!g++ -std=c++11 %<CR>
nnoremap <C-F5> <Esc>:w<CR>:!g++ -std=c++11 -g % -o /tmp/a.out && gdb /tmp/a.out<CR>

