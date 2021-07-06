set completeopt=menuone,preview

inoremap <expr> <Tab>   pumvisible() ? "\<C-n>" : "\<Tab>"
inoremap <expr> <S-Tab> pumvisble() ? "\<C-p>" : "\<S-Tab>"

let g:copletion_confirm_key = ""
imap <expr> <CR> pumvisible() ? complete_info()["selected"] != "-1" ?
               \ "\<Plug>(completion_confirm_completion)" : "\<c-e>\<CR>" : "\<Plug>delimitMateCR"
