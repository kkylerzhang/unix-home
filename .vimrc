" directory specific config
set exrc
set secure

" vundle setup
set nocp                      " be iMproved, required
filetype off                  " required
set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()
Plugin 'gmarik/Vundle.vim'          " vim bundle manager: :PluginInstall

" input plugins
" completer: C-<Space>
Plugin 'Valloric/YouCompleteMe'
" commenter: \cc \cu
Plugin 'scrooloose/nerdcommenter'
" autoformat
Plugin 'Chiel92/vim-autoformat'
" delimiters
Plugin 'Raimondi/delimitMate'
Plugin 'vim-scripts/loremipsum'

" html plugins
" html: C-y,
Plugin 'mattn/emmet-vim'
Plugin 'mustache/vim-mustache-handlebars'
Plugin 'tpope/vim-liquid'

" md plugins
" gfm
Plugin 'godlygeek/tabular'
" markdown: :Toc
Plugin 'plasticboy/vim-markdown'

" tex plugins
"Plugin 'lervag/vimtex'
Plugin 'vim-latex/vim-latex'

" css plugins
Plugin 'hail2u/vim-css3-syntax'     
Plugin 'groenewege/vim-less'
Plugin 'cakebaker/scss-syntax.vim'

" js plugins
Plugin 'pangloss/vim-javascript'
" Javascript semantic omnifunc, too slow...
"Plugin 'marijnh/tern_for_vim'
Plugin 'scrooloose/syntastic'

" layout plugins
" less folds with indention
Plugin 'tmhedberg/SimpylFold'
" status bar
"Plugin 'Lokaltog/powerline', {'rtp': 'powerline/bindings/vim/'}

" search plugins
Plugin 'kien/ctrlp.vim'
Plugin 'mileszs/ack.vim'
Plugin 'rizzatti/dash.vim'

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
let g:syntastic_filetype_map = { 'html.handlebars': 'handlebars' }
" let g:syntastic_mode_map = { 'mode': 'passive' }
" suppress less warnings, since there's no config file for npm less
let g:syntastic_less_lessc_quiet_messages = {
    \ "regex": ["properties must be inside selector blocks", "FileError:.*wasn't found"] }
let g:syntastic_javascript_checkers = ['eslint']
let g:syntastic_html_checkers = ['tidy']
let g:syntastic_tex_checkers = ['lacheck']
let g:syntastic_tex_lacheck_quiet_messages = {
    \ "regex": ["possible unwanted space", "Command terminated with space"] }
let g:syntastic_html_tidy_ignore_errors=[" proprietary attribute " ,"trimming empty <", "unescaped &" , "is not recognized!", "discarding unexpected"]
" when active: clear and disable
" when passive: enable and check
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
let g:user_emmet_install_global = 0
"autocmd FileType html,css EmmetInstall
let g:user_emmet_leader_key='<leader>em'

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
    \ 'dir':  'tmp$\|node_modules$\|lib$\|vendors$\|_site$\|build$\|dist$'}
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

" Tab related
set ts=4 sw=4 smarttab et

" Editing related
set backspace=indent,eol,start
set whichwrap=b,s,<,>,[,]
set mouse=a mousemodel=popup selection=inclusive
set pastetoggle=<F9>
set ambiwidth=single

" When editing a file, always jump to the last known cursor position.
" Don't do it when the position is invalid or when inside an event handler
" (happens when dropping a file on gvim).
autocmd BufReadPost *
\ if line("'\"") >= 1 && line("'\"") <= line("$") |
\   exe "normal! g`\"" |
\ endif

" searching
" case-insensitive search
set ignorecase
" switch to case-sensitive if any capital
set smartcase 
" increment searching
set incsearch
" disable highlight when cursor not moving, enable when begin search
" autocmd cursorhold * set nohlsearch
" noremap n :set hlsearch<cr>n
" noremap N :set hlsearch<cr>N
" noremap / :set hlsearch<cr>/
" noremap ? :set hlsearch<cr>?
" noremap * *:set hlsearch<cr>
nnoremap <c-h> :call HighlightToggle()<cr>
function! HighlightToggle()
  if(&hlsearch == 1)
    set nohlsearch
  else
    set hlsearch
  endif
endfunc

" color
highlight IncSearch ctermbg=black ctermfg=yellow 
highlight Search ctermbg=yellow ctermfg=black 
highlight MatchParen cterm=underline ctermbg=NONE ctermfg=NONE

" Encoding related
set encoding=utf-8
set langmenu=zh_CN.UTF-8
set fileencodings=ucs-bom,utf-8,cp936,gb18030,big5,euc-jp,euc-kr,latin1

" Misc
set ru number sm hls wrap hidden

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
cabbrev help tab help
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
