if !exists('g:loaded_lspsaga') | finish | endif

lua << EOF

local saga = require 'lspsaga'

saga.init_lsp_saga {
    error_sign = '',
    warn_sign = '',
    hint_sign = '',
    infor_sign = '',
    border_style = "round",
}
EOF

nnoremap <silent>K      <Cmd>Lspsaga hover_doc<CR>
inoremap <silent> <C-k> <Cmd>Lspsaga signature_help<CR>
nnoremap <silent>gh     <Cmd>lua require'lspsaga.provider'.lsp_finder()<CR>

nnoremap <silent> <space>n <Cmd>Lspsaga diagnostic_jump_next<CR>
nnoremap <silent> <space>p <Cmd>Lspsaga diagnostic_jump_prev<CR>
