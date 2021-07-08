inoremap <expr> <Tab>   pumvisible() ? "\<C-n>" : "\<Tab>"
inoremap <expr> <S-Tab> pumvisible() ? "\<C-p>" : "\<S-Tab>"

let g:copletion_confirm_key = ""
imap <expr> <CR> pumvisible() ? complete_info()["selected"] != "-1" ?
               \ "\<Plug>(completion_confirm_completion)" : "\<c-e>\<CR>" : "\<Plug>delimitMateCR"

let g:completion_matching_strategy_list = ['exact', 'substring', 'fuzzy']
let g:completion_matching_smart_case = 1
let g:completion_trigger_keyword_length = 1
let g:completion_trigger_on_delete = 1
let g:completion_sorting='none'
