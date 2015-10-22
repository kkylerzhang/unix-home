" vundle setup
"
set nocompatible              " be iMproved, required
filetype off                  " required

set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()
Plugin 'gmarik/Vundle.vim'
Plugin 'Valloric/YouCompleteMe'
" formater install required: like astyle, js-beautify
Plugin 'Chiel92/vim-autoformat' 
call vundle#end()            

" YCM config
let g:ycm_global_ycm_extra_conf = '~/.ycm_extra_conf.py'
let g:ycm_autoclose_preview_window_after_completion = 1
let g:ycm_key_invoke_completion = '<C-J>'
let g:ycm_error_symbol = 'e>'
let g:ycm_warning_symbol = 'w>'
nnoremap <leader>gl :YcmCompleter GoToDeclaration<CR>
nnoremap <leader>gf :YcmCompleter GoToDefinition<CR>
nnoremap <leader>gg :YcmCompleter GoToDefinitionElseDeclaration<CR>
highlight YcmWarningSection ctermbg=yellow
highlight YcmWarningSign ctermbg=yellow

" vim-autoformat config
noremap <F3> :Autoformat<CR>
let g:formatdef_harttle = '"astyle --style=attach --pad-oper"'
let g:formatters_cpp = ['harttle']
let g:formatters_java = ['harttle']

" custom setup
"
set nocp

" Tab related
set ts=4
set sw=4
set smarttab
set et
set ambiwidth=double

" Format related
"set tw=78
set lbr
set fo+=mB

" Indent related
set cin
set ai
set cino=:0g0t0(susj1

" Fold related
" set foldmethod=indent
" read & store vim states
" au BufWinLeave * silent mkview
" au BufRead * silent loadview

" Editing related
set backspace=indent,eol,start
set whichwrap=b,s,<,>,[,]
set mouse=a
set selectmode=
set mousemodel=popup
set keymodel=
set selection=inclusive

" Misc
set wildmenu
"set spell

" Encoding related
set encoding=utf-8
set langmenu=zh_CN.UTF-8
set fileencodings=ucs-bom,utf-8,cp936,gb18030,big5,euc-jp,euc-kr,latin1

" File type related
let delimitMate_expand_cr = 1
filetype plugin indent on
syntax on

" Display related
set ru
set nu
set sm
set hls
if (has("gui_running"))
    set guioptions+=b
    colo torte
    set nowrap
else
    colo ron
    set wrap
endif

" shortcut related 
set pastetoggle=<F9>
let g:copymode=0
nnoremap <F5> :w<CR>:!./%<CR>
nnoremap <F8> :call ToggleCopyMode()<CR>
nnoremap <F9> :w<CR>:!pbcopy < ./%<CR>

function ToggleCopyMode()
    if g:copymode
        set number
        set mouse=a
    else
        set nonumber
        set mouse=v
    endif
    let g:copymode=!g:copymode
endfunction

" templates
augroup templates
  au!

  autocmd BufNewFile  *.sh     0r ~/.vim/template/main.sh 
  autocmd BufNewFile  *.py     0r ~/.vim/template/main.py
  autocmd BufNewFile  *.c     0r ~/.vim/template/main.c
  autocmd BufNewFile  *.cpp     0r ~/.vim/template/main.cpp
  autocmd BufNewFile  *.java     0r ~/.vim/template/main.java

  autocmd BufNewFile *.js  execute '0r $HOME/.vim/template/main.'.expand("<afile>:e")
  autocmd BufNewFile  *.js  %substitute#\[:VIM_EVAL:\]\(.\{-\}\)\[:END_EVAL:\]#\=eval(submatch(1))#ge
  autocmd BufNewFile  *.js execute ':2' | startinsert!
augroup END


autocmd FileType javascript noremap <buffer>  <c-j> :call JsBeautify()<cr>
autocmd FileType html noremap <buffer> <c-j> :call HtmlBeautify()<cr>
autocmd FileType css noremap <buffer> <c-j> :call CSSBeautify()<cr>
