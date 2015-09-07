" my filetype file
if exists("did_load_filetypes")
    finish
endif
augroup filetypedetect
    " md may be recognized as modula2 file by default
    au! BufRead,BufNewFile *.md     setfiletype markdown
    au! BufRead,BufNewFile *.jade   setfiletype jade
    au! BufRead,BufNewFile *.less   setfiletype less
    au! BufRead,BufNewFile *.coffee setfiletype coffee
augroup END
