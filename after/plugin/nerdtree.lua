local opts = { noremap = true, silent = true}
vim.keymap.set("n", "<leader>nf", function () vim.cmd.NERDTreeFind() end, opts)
