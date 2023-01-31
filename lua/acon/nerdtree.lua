-- set nerdtree settings
vim.g.NERDTreeUseLeftWindow=1
vim.g.NERDTreeWinSize=30
vim.g.NERDTreeDirArrowExpandable = ''
vim.g.NERDTreeDirArrowCollapsible = ''

vim.keymap.set("n", "<leader>nf", function () vim.cmd("NERDTreeFind") end, {silent = true})
