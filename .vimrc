let mapleader=';'
set autoindent expandtab

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
Plugin 'hail2u/vim-css3-syntax'     
Plugin 'groenewege/vim-less'
Plugin 'pangloss/vim-javascript'
"Plugin 'marijnh/tern_for_vim'       " Javascript semantic for omnifunc, too slow...
Plugin 'scrooloose/syntastic'       " Linting hook, external tools required, such as npm jshint
Plugin 'tmhedberg/SimpylFold'       " less folds with indention
Plugin 'scrooloose/nerdtree'        " file browser
"Bundle 'jistr/vim-nerdtree-tabs'
"Plugin 'Xuyuanp/nerdtree-git-plugin'
Plugin 'kien/ctrlp.vim'             " super searching
Plugin 'Lokaltog/powerline', {'rtp': 'powerline/bindings/vim/'} " status bar
Plugin 'mustache/vim-mustache-handlebars'
Plugin 'tpope/vim-liquid'
Plugin 'cakebaker/scss-syntax.vim'
call vundle#end()            

" syntastic config
" jshint configable in ~/.jshintrc
set statusline+=%#warningmsg#
set statusline+=%{SyntasticStatuslineFlag()}
set statusline+=%*
let g:syntastic_always_populate_loc_list = 1
let g:syntastic_auto_loc_list = 0
let g:syntastic_check_on_open = 1
let g:syntastic_check_on_wq = 0

" vim-javascript config
let javascript_enable_domhtmlcss = 1

" emmet config
let g:user_emmet_settings = {
  \  'hbs' : {
  \    'extends' : 'html',
  \  },
  \  'xml' : {
  \    'extends' : 'html',
  \  },
  \  'haml' : {
  \    'extends' : 'html',
  \  },
  \}

" nerdcommenter config

" loremipsum config

" nerdtree config
" map <C-n> :NERDTreeTabsToggle<CR>
" open tree when no file speced
" autocmd StdinReadPre * let s:std_in=1
" autocmd VimEnter * if argc() == 0 && !exists("s:std_in") | NERDTree | endif
" auto close
autocmd bufenter * if (winnr("$") == 1 && exists("b:NERDTreeType") && b:NERDTreeType == "primary") | q | endif
let NERDTreeIgnore=['\.pyc$', '\~$', 'node_modules'] "ignore files in NERDTree
let NERDTreeMinimalUI=1

" nerdtree-git-plugin config
let g:NERDTreeIndicatorMapCustom = {
    \ "Modified"  : "*",
    \ "Staged"    : "+",
    \ "Untracked" : "x",
    \ "Renamed"   : "➜",
    \ "Unmerged"  : "═",
    \ "Deleted"   : "-",
    \ "Dirty"     : "✗",
    \ "Clean"     : "✔︎",
    \ "Unknown"   : "?"
    \ }

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
set wildignore+=*/tmp/*,*/node_modules/*,*.so,*.swp,*.zip,_site    
let g:ctrlp_custom_ignore = {'dir':  '\v[\/]\.(git|hg|svn)$', 'file': '\v\.(exe|so|dll)$'}
let g:ctrlp_prompt_mappings = {
    \ 'AcceptSelection("t")': ['<c-t>', '<cr>'],
    \ 'AcceptSelection("e")': ['<c-o>', '<2-LeftMouse>'],    
    \ }

" ycm config
let g:ycm_global_ycm_extra_conf = '~/.ycm_extra_conf.py'
let g:ycm_autoclose_preview_window_after_completion = 1
let g:ycm_error_symbol = 'e>'
let g:ycm_warning_symbol = 'w>'
let g:ycm_semantic_triggers = {
    \   'html': [ '</' ],
    \ }
highlight YcmWarningSection ctermbg=yellow
highlight YcmWarningSign ctermbg=yellow

" vim-autoformat config
let g:formatdef_astyle = '"astyle --style=attach --pad-oper"'
let g:formatters_cpp = ['astyle']
let g:formatters_java = ['astyle']
noremap <F3> :Autoformat<CR>

" simpleFold config
let g:SimpylFold_docstring_preview=1
set foldmethod=indent foldlevel=99
"au BufWinLeave *.* silent mkview
"au BufRead *.* silent loadview

" Tab related
set ts=4 sw=4 smarttab et ambiwidth=double

" Editing related
set backspace=indent,eol,start
set whichwrap=b,s,<,>,[,]
set mouse=a mousemodel=popup selection=inclusive
set pastetoggle=<F9>

" Encoding related
set encoding=utf-8
set langmenu=zh_CN.UTF-8
set fileencodings=ucs-bom,utf-8,cp936,gb18030,big5,euc-jp,euc-kr,latin1

" File type related
let delimitMate_expand_cr = 1
filetype plugin indent on
autocmd filetype html imap <c-_> <c-y>/
autocmd filetype html map <c-_> <c-y>/
syntax on

" MacOS
autocmd filetype crontab setlocal nobackup nowritebackup
set clipboard=unnamed

" Misc
set ru nu sm hls wrap wildmenu hidden

" Keymap
noremap <leader>rc :ClearAllCtrlPCaches<CR>
nnoremap <leader>rv :source ~/.vimrc<CR>
nnoremap <F4> :w<CR>:!make<CR>
nnoremap <F5> :w<CR>:!./%<CR>
" file save
inoremap ;; <Esc>:w<CR>
noremap  <leader>x <Esc>:x<CR>
noremap  <leader>q <Esc>:q<CR>
" code navigate
nnoremap <leader>gg :YcmCompleter GoToDefinitionElseDeclaration<CR>
nnoremap <space> za
" file navigate
imap <C-P> <Esc><C-P>
nnoremap <leader>ff :NERDTreeFind<CR>
map      <leader>nd :NERDTreeToggle<CR>
" edit
nmap <C-_> <leader>c<Space>
vmap <C-_> <leader>c<Space>
nnoremap yf :let @"=expand("%:t")<CR>
nnoremap yp :let @"=expand("%:p")<CR>
inoremap Lorem <Esc>:Loremipsum 15<CR>
inoremap Ipsum <Esc>:Loremipsum 35<CR>
" git
nnoremap <leader>gl :!git log -p %<CR>
" tab
noremap <C-T> <Esc>:tabedit<space>
inoremap <C-T> <Esc>:tabedit<space>
noremap <C-L> <Esc>:tabnext<CR>
inoremap <C-L> <Esc>:tabnext<CR>
noremap <C-H> <Esc>:tabprevious<CR>
inoremap <C-H> <Esc>:tabprevious<CR>
" buffer
noremap <C-J> <Esc>:bn<CR>
inoremap <C-J> <Esc>:bn<CR>
noremap <C-K> <Esc>:bp<CR>
inoremap <C-K> <Esc>:bp<CR>

