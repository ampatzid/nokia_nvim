local opts = {noremap = false}
vim.keymap.set( "n", "<leader>G", function ()
  vim.cmd.Git()
  vim.cmd("10wincmd_")
end, opts)

vim.keymap.set("n", "<leader>gb", function () vim.cmd.Git("blame") end, opts )
vim.keymap.set("n", "<leader>gf", ":diffget //2<CR>", opts )
vim.keymap.set("n", "<leader>gj", ":diffget //3<CR>", opts )


