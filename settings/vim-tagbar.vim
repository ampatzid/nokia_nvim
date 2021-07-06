" ----- majutsushi/tagbar settings -----
" Open/close tagbar with \b
nmap <silent> <leader>t :TagbarToggle<CR>
" Uncomment to open tagbar automatically whenever possible
"autocmd BufEnter * nested :call tagbar#autoopen(0)
let g:tagbar_autoshowtag = 1
let g:tagbar_sort = 0

