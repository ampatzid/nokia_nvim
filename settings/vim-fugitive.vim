" Fugitive settings
autocmd User fugitive
\ if fugitive#buffer().type() =~# '^\%(tree\|blob\)$' |
\   nnoremap <buffer> .. :edit %:h<CR> |
\ endif

nmap <leader>gb <Cmd>Git blame<CR>
nmap <leader>gs <Cmd>Git<CR>:10wincmd_<CR>
nmap <leader>gj :diffget //3<CR>
nmap <leader>gf :diffget //2<CR>

autocmd QuickFixCmdPost *grep* cwindow
autocmd BufReadPost fugitive://* set bufhidden=delete

" Status line
if !exists('*fugitive#statusline')
  set statusline=%F\ %m%r%h%w%y%{'['.(&fenc!=''?&fenc:&enc).':'.&ff.']'}[L%l/%L,C%03v]
  set statusline+=%=
  set statusline+=%{fugitive#statusline()}
endif
