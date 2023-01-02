-- ----- majutsushi/tagbar settings -----
vim.g.tagbar_autoshowtag = 1
vim.g.tagbar_sort = 0

--  Uncomment to open tagbar automatically whenever possible
-- autocmd BufEnter * nested :call tagbar#autoopen(0)

local opts = { noremap = true, silent = true }
--  Open/close tagbar with \t
vim.keymap.set('n', '<leader>t', function() vim.cmd.TagbarToggle() end, opts)

