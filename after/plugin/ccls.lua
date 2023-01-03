vim.g.ccls_levels = 3
-- The size and position of the tree window can be set:
vim.g.ccls_size = 10
vim.g.ccls_position = 'botright'
vim.g.ccls_orientation = 'horizontal'

-- The size of the floating window (Neovim only) can be controlled:
vim.g.ccls_float_width = 50
vim.g.ccls_float_height = 20

-- mapping commands
local opts = { silent = true, buffer = true, noremap = true }
vim.keymap.set("n", "<leader>ch", function () vim.cmd('CclsCallHierarchy') end, opts)
vim.keymap.set("n", "<leader>cfh", function () vim.cmd('CclsCallHierarchy -float') end, opts)
vim.keymap.set("n", "g", function () vim.cmd('g<CR>') end, opts)

opts.noremap = false
vim.keymap.set("n", "<leader>l", "<Plug>(yggdrasil-toggle-node)", opts)
vim.keymap.set("n", "<leader>h", "<Plug>(yggdrasil-close-node)", opts)
vim.keymap.set("n", "<CR>", "<Plug>(yggdrasil-execute-node)>", opts)
