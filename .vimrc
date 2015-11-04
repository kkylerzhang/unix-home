" vundle setup
set nocp                      " be iMproved, required
filetype off                  " required
set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()
Plugin 'gmarik/Vundle.vim'          " vim bundle manager: :PluginInstall
Plugin 'Valloric/YouCompleteMe'     " completer: C-<Space>
Plugin 'scrooloose/nerdcommenter'   " commenter: \cc \cu
Plugin 'Chiel92/vim-autoformat'     " autoformat: F3
Plugin 'Raimondi/delimitMate'       " delemiters
Plugin 'mattn/emmet-vim'            " html: C-y,
Plugin 'vim-scripts/loremipsum'     " Lorem:
Plugin 'plasticboy/vim-markdown'    " markdown: :Toc
Plugin 'godlygeek/tabular'          " gfm
Plugin 'groenewege/vim-less'        " less
Plugin 'tmhedberg/SimpylFold'       " less folds with indention
Plugin 'scrooloose/nerdtree'        " file browser
Plugin 'Xuyuanp/nerdtree-git-plugin'
Plugin 'kien/ctrlp.vim'             " super searching
Plugin 'Lokaltog/powerline', {'rtp': 'powerline/bindings/vim/'} " status bar
call vundle#end()            

" loremipsum config
inoremap Lorem <Esc><Esc>:Loremipsum 20<CR>
inoremap Ipsum <Esc><Esc>:Loremipsum 70<CR>

" powerline config
let g:Powerline_symbols = 'fancy'
set guifont=Inconsolata\ for\ Powerline:h15
set encoding=utf-8
set t_Co=256
set fillchars+=stl:\ ,stlnc:\
set term=xterm-256color
set termencoding=utf-8

" ctrlp config
let g:ctrlp_working_path_mode = 'ra'
set wildignore+=*/tmp/*,*/node_modules/*,*.so,*.swp,*.zip     
let g:ctrlp_custom_ignore = {'dir':  '\v[\/]\.(git|hg|svn)$', 'file': '\v\.(exe|so|dll)$'}

" YCM config
let g:ycm_global_ycm_extra_conf = '~/.ycm_extra_conf.py'
let g:ycm_autoclose_preview_window_after_completion = 1
let g:ycm_error_symbol = 'e>'
let g:ycm_warning_symbol = 'w>'
highlight YcmWarningSection ctermbg=yellow
highlight YcmWarningSign ctermbg=yellow
nnoremap <leader>gl :YcmCompleter GoToDeclaration<CR>
nnoremap <leader>gf :YcmCompleter GoToDefinition<CR>
nnoremap <leader>gg :YcmCompleter GoToDefinitionElseDeclaration<CR>

" vim-autoformat config
let g:formatdef_astyle = '"astyle --style=attach --pad-oper"'
let g:formatters_cpp = ['astyle']
let g:formatters_java = ['astyle']
noremap <F3> :Autoformat<CR>

" simpleFold config
let g:SimpylFold_docstring_preview=1

" NERDTree config
map <C-n> :NERDTreeToggle<CR>
" open tree when no file speced
autocmd StdinReadPre * let s:std_in=1
autocmd VimEnter * if argc() == 0 && !exists("s:std_in") | NERDTree | endif
" auto close
autocmd bufenter * if (winnr("$") == 1 && exists("b:NERDTreeType") && b:NERDTreeType == "primary") | q | endif
let NERDTreeIgnore=['\.pyc$', '\~$', 'node_modules'] "ignore files in NERDTree
let NERDTreeMinimalUI=1

" Tab related
set ts=4 sw=4 smarttab et ambiwidth=double

" Fold related
set foldmethod=indent foldlevel=99
au BufWinLeave * silent mkview
au BufRead * silent loadview
nnoremap <space> za

" Editing related
set backspace=indent,eol,start
set whichwrap=b,s,<,>,[,]
set mouse=a mousemodel=popup selection=inclusive
set pastetoggle=<F9>

" panel
nnoremap <C-J> <C-W><C-J>
nnoremap <C-K> <C-W><C-K>
nnoremap <C-L> <C-W><C-L>
nnoremap <C-H> <C-W><C-H>

" Encoding related
set encoding=utf-8
set langmenu=zh_CN.UTF-8
set fileencodings=ucs-bom,utf-8,cp936,gb18030,big5,euc-jp,euc-kr,latin1

" File type related
let delimitMate_expand_cr = 1
filetype plugin indent on
syntax on

" Misc
set ru nu sm hls wrap wildmenu
nnoremap <F4> :w<CR>:!make<CR>
nnoremap <F5> :w<CR>:!./%<CR>
let mapleader=';'

" MacOS
autocmd filetype crontab setlocal nobackup nowritebackup
set clipboard=unnamed

