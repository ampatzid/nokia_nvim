-- set vim-bookmarks settings
vim.g.bookmark_save_per_working_dir = 1

-- Create mappings for vim-bookmarks
local opts = {noremap = true, silent = true}
vim.keymap.set('n', ']r', function () vim.cmd.BookmarkToggle() end, opts)
vim.keymap.set('n', '[r', function () vim.cmd.BookmarkShowAll() end, opts)
