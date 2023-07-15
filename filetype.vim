" my filetype file
if exists("did_load_filetypes")
  finish
endif
augroup filetypedetect
  au! BufRead,BufNewFile *.yang     setfiletype yang
  au! BufRead,BufNewFile *.txt      setfiletype txt
augroup END
