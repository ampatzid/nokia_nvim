local opts = { noremap = true, silent = true }
--  Open/close tagbar with \t
vim.keymap.set('n', '<leader>t', function() vim.cmd.TagbarToggle() end, opts)

