let g:ccls_levels = 3
"The size and position of the tree window can be set:
let g:ccls_size = 10
let g:ccls_position = 'botright'
let g:ccls_orientation = 'horizontal'

"The size of the floating window (Neovim only) can be controlled:
let g:ccls_float_width = 50
let g:ccls_float_height = 20

" mapping commands
nnoremap <silent> <leader>ch :CclsCallHierarchy<CR>
nnoremap <silent> <leader>cfh :CclsCallHierarchy -float<CR>

nmap <silent> <buffer> <leader>l    <Plug>(yggdrasil-toggle-node)
nmap <silent> <buffer> <leader>h    <Plug>(yggdrasil-close-node)
nmap <silent> <buffer> <cr> <Plug>(yggdrasil-execute-node)
nnoremap <silent> <buffer> q :q<cr>
