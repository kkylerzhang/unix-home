" directory specific config
set exrc
set secure

" vundle setup
set nocp                      " be iMproved, required
filetype off                  " required
set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()
Plugin 'gmarik/Vundle.vim'          " vim bundle manager: :PluginInstall

Plugin 'Valloric/YouCompleteMe'
Plugin 'scrooloose/nerdcommenter'
Plugin 'tmux-plugins/vim-tmux-focus-events'
Plugin 'roxma/vim-tmux-clipboard'
Plugin 'Chiel92/vim-autoformat'
Plugin 'Raimondi/delimitMate'
Plugin 'vim-scripts/loremipsum'
Plugin 'mattn/emmet-vim'
Plugin 'mustache/vim-mustache-handlebars'
Plugin 'tpope/vim-liquid'
Plugin 'guns/xterm-color-table.vim'
Plugin 'godlygeek/tabular'
Plugin 'plasticboy/vim-markdown'
Plugin 'vim-latex/vim-latex'
Plugin 'hail2u/vim-css3-syntax'     
Plugin 'groenewege/vim-less'
Plugin 'cakebaker/scss-syntax.vim'
Plugin 'pangloss/vim-javascript'
Plugin 'scrooloose/syntastic'
Plugin 'tmhedberg/SimpylFold'
Plugin 'kien/ctrlp.vim'
Plugin 'mileszs/ack.vim'
Plugin 'rizzatti/dash.vim'
Plugin 'flazz/vim-colorschemes'
Plugin 'xolox/vim-misc'
Plugin 'xolox/vim-colorscheme-switcher'

call vundle#end()            

" after plugin loading
set autoindent expandtab
filetype plugin indent on
syntax on
let mapleader='\'

" nerd commenter config
let g:NERDSpaceDelims = 1

" syntastic config
let g:syntastic_always_populate_loc_list = 1
let g:syntastic_auto_loc_list = 0
let g:syntastic_check_on_open = 1
let g:syntastic_check_on_wq = 0
let g:syntastic_auto_jump = 1
let g:syntastic_error_symbol = "✗"
let g:syntastic_warning_symbol = "⚠"
let g:syntastic_style_error_symbol = '!'
let g:syntastic_style_warning_symbol = '?'
let g:syntastic_filetype_map = { 'html.handlebars': 'handlebars' }
let g:syntastic_quiet_messages = {
    \ "level": "warnings"}
let g:syntastic_less_lessc_quiet_messages = {
    \ "regex": ["properties must be inside selector blocks", "FileError:.*wasn't found"] }
let g:syntastic_javascript_checkers = ['eslint']
let g:syntastic_cpp_cpplint_exec = 'cpplint'
let g:syntastic_cpp_checkers = ['cpplint', 'gcc']
let syntastic_aggregate_errors = 1
let g:syntastic_cpp_cpplint_thres = 1
let g:syntastic_tex_checkers = ['lacheck']
let g:syntastic_tex_lacheck_quiet_messages = {
    \ "regex": ["possible unwanted space", "Command terminated with space"] }
let g:syntastic_html_checkers = ['tidy']
let g:syntastic_html_tidy_ignore_errors=[" proprietary attribute " ,"trimming empty <", "unescaped &" , "is not recognized!", "discarding unexpected"]
nnoremap <F4> :SyntasticToggleMode<CR>
highlight SyntasticErrorSign ctermfg=red ctermbg=none
highlight SyntasticWarningSign ctermfg=yellow ctermbg=none

" vim-javascript config
let javascript_enable_domhtmlcss = 0

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

" tex config
let g:vimtex_latexmk_callback = 0

" md config
let g:vim_markdown_frontmatter = 1
let g:vim_markdown_math = 1

" ctrlp config
let g:ctrlp_working_path_mode = 'ra'
let g:ctrlp_cmd = 'CtrlP'
let g:ctrlp_custom_ignore = {
    \ 'file':  '\v[\/]\.(git|hg|svn|exe|so|dll|snm|out|nav|log|vrb|toc|aux|swp|swo)$', 
    \ 'dir':  'tmp$\|amd_modules\|node_modules$\|lib$\|vendors$\|_site$\|build$\|dist$'}
let g:ctrlp_prompt_mappings = {
    \ 'AcceptSelection("t")': ['<c-t>', '<2-LeftMouse>'],
    \ 'AcceptSelection("e")': ['<c-o>', '<cr>'],    
    \ }

" ctrln config
set wildmenu wildmode=full 
set wildchar=<Tab> wildcharm=<C-Z>

" ack/ag
if executable('ag')
    let g:ackprg = 'ag --nogroup --nocolor --column'
endif
nnoremap <F2> :Ack 

" ycm config
let g:ycm_show_diagnostics_ui = 0
let g:ycm_global_ycm_extra_conf = '~/.ycm_extra_conf.py'
let g:ycm_autoclose_preview_window_after_completion = 1
let g:ycm_semantic_triggers = {
    \   'html': [ '</' ],
    \ }

" vim-autoformat config
let g:formatdef_astyle = '"astyle --style=attach --pad-oper"'
let g:formatdef_eslint = '"SRC=eslint-temp-${RANDOM}.js; cat - >$SRC; eslint --fix $SRC >/dev/null 2>&1; cat $SRC | perl -pe \"chomp if eof\"; rm -f $SRC"'
let g:formatters_cpp = ['astyle']
let g:formatters_java = ['astyle']
let g:formatters_javascript = ['eslint']
" js-beaultify for HTML/CSS/JS: ~/.jsbeautifyrc
noremap <F3> :Autoformat<CR>:w<CR>

" delimitmate config
let delimitMate_expand_cr = 1
let delimitMate_matchpairs = "(:),[:],{:},『:』,「:」,《:》,（:）,【:】"

" simplefold config
let g:SimpylFold_docstring_preview=1
set foldmethod=indent foldlevel=99

" color scheme
colorscheme monokai

" Editing related
set ts=4 sw=4 smarttab et
set backspace=indent,eol,start
set whichwrap=b,s,<,>,[,]
set mouse=a mousemodel=popup selection=inclusive
set pastetoggle=<F9>
set ambiwidth=single

" jump to the last known cursor position
autocmd BufReadPost *
\ if line("'\"") >= 1 && line("'\"") <= line("$") |
\   exe "normal! g`\"" |
\ endif

" searching
set ignorecase
set smartcase " case-sensitive if any capital
set incsearch " increment searching
noremap n :set hlsearch<cr>n
noremap N :set hlsearch<cr>N
noremap / :set hlsearch<cr>/
noremap ? :set hlsearch<cr>?
noremap * *:set hlsearch<cr>
nnoremap <c-h> :call DisableHighlight()<cr>
function! DisableHighlight()
    set nohlsearch
endfunc
hi Search ctermbg=yellow ctermfg=black

" Encoding related
set encoding=utf-8
set langmenu=zh_CN.UTF-8
set fileencodings=ucs-bom,utf-8,cp936,gb18030,big5,euc-jp,euc-kr,latin1

" Misc
set ru number sm hls wrap hidden
" infocmp -1 xterm | fgrep -w kf20
if &term == 'xterm-256color' | map <Esc>[19;2~ <s-F8> | endif

" Clipboard
set clipboard=unnamed
inoremap <C-r>+ <C-g>u<C-\><C-o>"+gP  

" file navigate
noremap gb :bn<cr>
noremap gB :bp<cr>
noremap gl <c-w>l
noremap gh <c-w>h
noremap gj <c-w>j
noremap gk <c-w>k
map K :Dash<cr>
noremap <c-d> :sh<cr>

" code navigate
nnoremap <leader>gg :YcmCompleter GoToDefinitionElseDeclaration<CR>
nnoremap <space> za
set relativenumber
nnoremap <c-n> :call NumberToggle()<cr>
function! NumberToggle()
  if(&relativenumber == 1)
    set norelativenumber
  else
    set relativenumber
  endif
endfunc

" comment
map <C-_> <leader>c<Space>
