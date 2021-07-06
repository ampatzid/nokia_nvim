
" GitGutter setup options
let g:gitgutter_set_sign_backgrounds = 1
let g:gitgutter_max_signs = -1
" let g:gitgutter_highlight_lines = 1
let g:gitgutter_preview_win_floating = 1
let g:gitgutter_use_location_list = 1

" vim-gitgutter used to do this by default:
highlight! link SignColumn LineNr

highlight GitGutterAdd    guifg=#009900 ctermfg=2
highlight GitGutterChange guifg=#bbbb00 ctermfg=3
highlight GitGutterDelete guifg=#ff2222 ctermfg=1
