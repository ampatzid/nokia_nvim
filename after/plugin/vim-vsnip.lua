-- NOTE: You can use other key to expand snippet.
local opts = { silent = true, noremap = false}
-- Expand
-- vim-vsnip
-- vim.keymap.set("i", "<expr> <C-j>", function () vim.cmd("vsnip#expandable()  ? '<Plug>(vsnip-expand)'         : '<C-j>'") end)
-- vim.keymap.set("s", "<expr> <C-j>", function () vim.cmd("vsnip#expandable()  ? '<Plug>(vsnip-expand)'         : '<C-j>'") end)

-- Expand or jump
-- vim.keymap.set("i", "<expr> <C-l>", function () vim.cmd("vsnip#available(1)  ? '<Plug>(vsnip-expand-or-jump)' : '<C-l>'") end)
-- vim.keymap.set("s", "<expr> <C-l>", function () vim.cmd("vsnip#available(1)  ? '<Plug>(vsnip-expand-or-jump)' : '<C-l>'") end)
-- LuaSnip
vim.keymap.set("i", "<expr> <Tab>", function () vim.cmd("luasnip#expand_or_jumpable() ? '<Plug>luasnip-expand-or-jump' : '<Tab>'") end, opts)
vim.keymap.set("s", "<expr> <Tab>", function () vim.cmd("luasnip#expand_or_jumpable() ? '<Plug>luasnip-expand-or-jump' : '<Tab>'") end, opts)
-- Jump backward
opts.noremap = true
vim.keymap.set("i", "<S-Tab>", function () require'luasnip'.jump(-1) end, opts)
vim.keymap.set("s", "<Tab>", function () require'luasnip'.jump(1) end, opts )
vim.keymap.set("s", "<S-Tab>", function () require'luasnip'.jump(-1) end, opts )

-- Jump forward or backward
-- vim.keymap.set("i", "<expr> <Tab>", function () vim.cmd("vsnip#jumpable(1)  ? '<Plug>(vsnip-jump-next)' : '<Tab>'") end)
-- vim.keymap.set("s", "<expr> <Tab>", function () vim.cmd("vsnip#jumpable(1)  ? '<Plug>(vsnip-jump-next)' : '<Tab>'") end)
-- vim.keymap.set("i", "<expr> <S-Tab>", function () vim.cmd("vsnip#jumpable(-1)  ? '<Plug>(vsnip-jump-prev)' : '<S-Tab>'") end)
-- vim.keymap.set("s", "<expr> <S-Tab>", function () vim.cmd("vsnip#jumpable(-1)  ? '<Plug>(vsnip-jump-prev)' : '<S-Tab>'") end)

-- For changing choices in choiceNodes (not strictly necessary for a basic setup).
vim.keymap.set("i", "<silent><expr> <C-E>", function () vim.cmd("luasnip#choice_active() ? '<Plug>luasnip-next-choice' : '<C-E>'") end)
vim.keymap.set("s", "<silent><expr> <C-E>", function () vim.cmd("luasnip#choice_active() ? '<Plug>luasnip-next-choice' : '<C-E>'") end)

-- Select or cut text to use as $TM_SELECTED_TEXT in the next snippet.
-- See https://github.com/hrsh7th/vim-vsnip/pull/50
-- local augroup = vim.api.nvim_create_augroup
-- local vimSnip = augroup('VimSnip', {})
-- local autocmd = vim.api.nvim_create_autocmd
-- 
-- autocmd( 'Filetype',{
--     group = vimSnip,
--     pattern = 'vsnip',
--     callback = function ()
--       vim.keymap.set("n", "s", function () vim.cmd("<Plug>(vsnip-select-text)") end)
--       vim.keymap.set("x", "s", function () vim.cmd("<Plug>(vsnip-select-text)") end)
--       vim.keymap.set("n", "s", function () vim.cmd("<Plug>(vsnip-cut-text)") end)
--       vim.keymap.set("x", "s", function () vim.cmd("<Plug>(vsnip-cut-text)") end)
--     end
--   })

-- If you want to use snippet for multiple filetypes, you can `g:vsnip_filetypes` for it.
