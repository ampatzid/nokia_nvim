local actions = require('telescope.actions')
require('telescope').setup {
    defaults = {
        file_sorter = require('telescope.sorters').get_fzy_sorter,
        prompt_prefix = ' >',
        color_devicons = true,

        file_previewer   = require('telescope.previewers').vim_buffer_cat.new,
        grep_previewer   = require('telescope.previewers').vim_buffer_vimgrep.new,
        qflist_previewer = require('telescope.previewers').vim_buffer_qflist.new,

        mappings = {
            i = {
                ["<C-x>"] = false,
                ["<C-q>"] = actions.send_to_qflist,
            },
        }
    },
    extensions = {
        fzy_native = {
            override_generic_sorter = false,
            override_file_sorter = true,
        }
    }
}

local builtin = require('telescope.builtin')
vim.keymap.set('n', '<leader>ff', builtin.find_files, {})
vim.keymap.set('n', '<C-p>', builtin.git_files, {})
vim.keymap.set('n', '<leader>fg', builtin.live_grep, {})
vim.keymap.set('n', '<leader>fb', builtin.buffers, {})
vim.keymap.set('n', '<leader>fh', builtin.help_tags, {})
vim.keymap.set('n', '<leader>fs', function()
    builtin.grep_string({search = vim.fn.input("Grep For > ")})
end)
vim.keymap.set('n', '<leader>fw', function()
    builtin.grep_string({search = vim.fn.expand("<cword>")})
end)
vim.keymap.set('n', '<leader>ft', function()
    builtin.lsp_document_symbols()
end)
vim.keymap.set('n', '<leader>gs', function()
    builtin.git_status()
end)
vim.keymap.set('n', '<leader>fgb', function()
    builtin.git_branches({
        attach_mappings = function(_, map)
            map('i', '<c-d>', actions.git_delete_branch)
            map('n', '<c-d>', actions.git_delete_branch)
            return true
        end
    })
end)
vim.keymap.set('n', '<leader>vrc', function()
    builtin.find_files({
        prompt_title = "< VimRC >",
        cwd = "$HOME/.config/nvim/",
    })
end)

local extensions = require('telescope').extensions
vim.keymap.set('n', '<leader>gw', function()
    extensions.git_worktree.git_worktrees()
end)
vim.keymap.set('n', '<leader>gm', function()
    extensions.git_worktree.create_git_worktree()
end)

require('telescope').load_extension('fzy_native')
