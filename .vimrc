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
Plugin 'Valloric/YouCompleteMe'     " completer: C-<Space>
Plugin 'scrooloose/nerdcommenter'   " commenter: \cc \cu
Plugin 'Chiel92/vim-autoformat'     " autoformat
Plugin 'Raimondi/delimitMate'       " delimiters
Plugin 'vim-scripts/loremipsum'     " Lorem:

" html plugins
Plugin 'mattn/emmet-vim'            " html: C-y,
Plugin 'mustache/vim-mustache-handlebars'
Plugin 'tpope/vim-liquid'

" md plugins
Plugin 'godlygeek/tabular'          " gfm
Plugin 'plasticboy/vim-markdown'    " markdown: :Toc

" tex plugins
"Plugin 'lervag/vimtex'
Plugin 'vim-latex/vim-latex'

" css plugins
Plugin 'hail2u/vim-css3-syntax'     
Plugin 'groenewege/vim-less'
Plugin 'cakebaker/scss-syntax.vim'

" js plugins
Plugin 'pangloss/vim-javascript'
"Plugin 'marijnh/tern_for_vim'       " Javascript semantic omnifunc, too slow...
Plugin 'scrooloose/syntastic'       " Linting, external tools required(jshint)

" layout plugins
Plugin 'tmhedberg/SimpylFold'       " less folds with indention
"Plugin 'Lokaltog/powerline', {'rtp': 'powerline/bindings/vim/'} " status bar

" search plugins
Plugin 'kien/ctrlp.vim'
Plugin 'mileszs/ack.vim'

call vundle#end()            

" after plugin loading
let mapleader=';'
set autoindent expandtab
filetype plugin indent on
syntax on

" syntastic config
" jshint configable in ~/.jshintrc
"set statusline+=%#warningmsg#
"set statusline+=%{SyntasticStatuslineFlag()}
"set statusline+=%*
let g:syntastic_always_populate_loc_list = 1
let g:syntastic_auto_loc_list = 0
let g:syntastic_check_on_open = 1
let g:syntastic_check_on_wq = 0
let g:syntastic_filetype_map = { 'html.handlebars': 'handlebars' }
let g:syntastic_mode_map = { 'passive_filetypes': ['html'] }
" suppress less warnings, since there's no config file for npm less
let g:syntastic_less_lessc_quiet_messages = {
    \ "regex": ["properties must be inside selector blocks", "FileError:.*wasn't found"] }
let g:syntastic_tex_checkers = ['lacheck']
let g:syntastic_tex_lacheck_quiet_messages = {
    \ "regex": ["possible unwanted space", "Command terminated with space"] }


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

" powerline config
"let g:Powerline_symbols = 'fancy'
"set guifont=Inconsolata\ for\ Powerline:h15
"set encoding=utf-8
"set t_Co=256
"set fillchars+=stl:\ ,stlnc:\
"set term=xterm-256color
"set termencoding=utf-8

" ctrlp config
set wildignore+=*/tmp/*,*/node_modules/*,*.so,*.swp,*.zip,_site,*/build/*,*/dist/*
let g:ctrlp_working_path_mode = 'ra'
let g:ctrlp_custom_ignore = {
    \ 'dir':  '\v[\/]\.(git|hg|svn)$', 
    \ 'file': '\v\.(exe|so|dll|snm|out|nav|log|vrb|toc|aux)$'}
let g:ctrlp_prompt_mappings = {
    \ 'AcceptSelection("t")': ['<c-t>', '<2-LeftMouse>'],
    \ 'AcceptSelection("e")': ['<c-o>', '<cr>'],    
    \ }
" ignore files in .gitignore, conflict with wildignore/ctrlp_custom_ignore
" let g:ctrlp_user_command = ['.git', 'cd %s && git ls-files -co --exclude-standard']

" ctrln config
set wildmenu wildmode=full 
set wildchar=<Tab> wildcharm=<C-Z>

" ack/ag
if executable('ag')
    let g:ackprg = 'ag --nogroup --nocolor --column --ignore=lib'
endif

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

" delimitmate config
let delimitMate_expand_cr = 1
let delimitMate_matchpairs = "(:),[:],{:},『:』,「:」,《:》,（:）,【:】"

" simplefold config
let g:SimpylFold_docstring_preview=1
set foldmethod=indent foldlevel=99

" Tab related
set ts=4 sw=4 smarttab et ambiwidth=double

" Editing related
set backspace=indent,eol,start
set whichwrap=b,s,<,>,[,]
set mouse=a mousemodel=popup selection=inclusive
set pastetoggle=<F9>

" searching
" case-insensitive search
set ignorecase
" switch to case-sensitive if any capital
set smartcase 
" disable highlight when cursor not moving, enable when begin search
autocmd cursorhold * set nohlsearch
noremap n :set hlsearch<cr>n
noremap N :set hlsearch<cr>N
noremap / :set hlsearch<cr>/
noremap ? :set hlsearch<cr>?
noremap * *:set hlsearch<cr>

" color
highlight Search ctermbg=grey ctermfg=black 
highlight MatchParen cterm=underline ctermbg=NONE ctermfg=NONE

" Encoding related
set encoding=utf-8
set langmenu=zh_CN.UTF-8
set fileencodings=ucs-bom,utf-8,cp936,gb18030,big5,euc-jp,euc-kr,latin1

" Misc
set ru nu sm hls wrap hidden
set clipboard=unnamed
" Clipboard Hack
inoremap <C-r>+ <C-g>u<C-\><C-o>"+gP 

" file navigate
noremap <c-n> :b <c-z>
noremap gb :bn<cr>
noremap gB :bp<cr>
noremap gl <c-w>l
noremap gh <c-w>h
noremap gj <c-w>j
noremap gk <c-w>k

" code navigate
nnoremap <leader>gg :YcmCompleter GoToDefinitionElseDeclaration<CR>
nnoremap <space> za
noremap <leader>ej :lnext<CR>
noremap <leader>ek :lprev<CR>

" comment
map <C-_> <leader>c<Space>

