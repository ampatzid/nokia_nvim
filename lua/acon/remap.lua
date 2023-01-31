vim.keymap.set("v", "J", ":m '>+1<CR>gv=gv")
vim.keymap.set("v", "K", ":m '<-2<CR>gv=gv")

vim.keymap.set("n", "<C-d>", "<C-d>zz")
vim.keymap.set("n", "<C-u>", "<C-u>zz")
vim.keymap.set("n", "n", "nzzzv")
vim.keymap.set("n", "N", "Nzzzv")

vim.keymap.set("n", "Q", "<nop>")

vim.keymap.set("n", "]q", "<cmd>cnext<CR>zz")
vim.keymap.set("n", "[q", "<cmd>cprev<CR>zz")
vim.keymap.set("n", "]l", "<cmd>lnext<CR>zz")

vim.keymap.set("n", "[l", "<cmd>lprev<CR>zz")

-- Keep yanked string to buffer so that can be reused
vim.keymap.set("x", "<leader>p", [["_dP]])

vim.keymap.set("n", "<leader>s", [[:%s/\<<C-r><C-w>\>/<C-r><C-w>/gI<Left><Left><Left>]])

vim.keymap.set("n", "<leader>wc", "<cmd>wincmd q<CR>")

vim.keymap.set("n", "<leader>vg", function () vim.cmd.vimgrep(vim.fn.expand("<cword>"), "%") end)

-- Resize window
vim.keymap.set("n", "<leader>+", "<cmd>vertical resize +5<CR>")
vim.keymap.set("n", "<leader>-", "<cmd>vertical resize -5<CR>")

-- Move Commands for vim using h,j,k,l keys.
vim.keymap.set("n", "<C-J>", "<C-W><C-J>")
vim.keymap.set("n", "<C-K>", "<C-W><C-K>")
vim.keymap.set("n", "<C-L>", "<C-W><C-L>")
vim.keymap.set("n", "<C-H>", "<C-W><C-H>")

--  Use Ctr-S to save
local opts = { noremap = true }
vim.keymap.set("n", "<C-S>", "<cmd>update<CR>", opts)
vim.keymap.set("v", "<C-S>", "<C-C><cmd>update<CR>", opts)
vim.keymap.set("i", "<C-S>", "<C-O><cmd>update<CR><Esc>", opts)

-- Terminal mode configuration
local augroup = vim.api.nvim_create_augroup
local termGroup = augroup('TermGroup', {})

local autocmd = vim.api.nvim_create_autocmd

autocmd('TermOpen', {
    group = termGroup,
    pattern = '*',
    callback = function ()
      vim.keymap.set("t", "<Esc>", "<C-\\><C-n>", {noremap = true})
    end
})

autocmd('TermOpen', {
    group = termGroup,
    pattern = 'fzf',
    callback = function ()
      vim.keymap.del("t", "<Esc>")
    end
})

