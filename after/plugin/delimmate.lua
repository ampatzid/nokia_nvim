----- Raimondi/delimitMate settings -----
-- DelimitMate Configuration
vim.g.delimitMate_autoclose = 1
vim.g.delimitMate_jump_expansion = 1
vim.g.delimitMate_expand_space = 1
vim.g.delimitMate_expand_cr = 2
vim.g.delimitMate_expand_inside_quotes = 1

vim.cmd [[
augroup mydelimitMate
au!
au FileType markdown let b:delimitMate_nesting_quotes = ["`"]
au FileType tex let b:delimitMate_quotes = ""
au FileType tex let b:delimitMate_matchpairs = "(:),[:],{:},`:'"
au FileType python let b:delimitMate_nesting_quotes = ['"', "'"]
augroup END
]]
