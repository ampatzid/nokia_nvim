if !exists('g:loaded_telescope') | finish | endif

lua << EOF
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

require("telescope").load_extension("git_worktree")
require('telescope').load_extension('fzy_native')

M = {}
M.search_dotfiles = function()
    require("telescope.builtin").find_files({
        prompt_title = "< VimRC >",
        cwd = "$HOME/.config/nvim/",
    })
end

            -- map(mode, key, lua function to call)
            --
            -- good place to look: telescope.actions (init.lua)
            -- lua function to call:  (gets bufnr, not necessarily needed)
            --   require('telescope.actions.state').get_selected_entry(bufnr)
            --   Actions just take the bufnr and give out information
            --   require('telescope.actions').close(bufnr)
            --
            --   check out telescope.actions for _all the available_ supported
            --   actions.
            --
            --   :h telescope.setup ->
            --   :h telescope.builtin ->
            --   :h telescope.layout ->
            --   :h telescope.actions
            --

M.git_branches = function()
    require("telescope.builtin").git_branches({
        attach_mappings = function(_, map)
            map('i', '<c-d>', actions.git_delete_branch)
            map('n', '<c-d>', actions.git_delete_branch)
            return true
        end
    })
end

return M

--local actions = require('telescope.actions')
-- Global remapping
------------------------------
-- require('telescope').setup{
--     defaults = {
--         vimgrep_arguments = {
--           'rg',
--           '--color=never',
--           '--no-heading',
--           '--with-filename',
--           '--line-number',
--           '--column',
--           '--smart-case'
--         },
--         mappings = {
--             n = {
--                 ["q"] = actions.close
--             },
--         },
--     }
-- }
EOF

nnoremap <leader>fs :lua require('telescope.builtin').grep_string({ search = vim.fn.input("Grep For > ")})<CR>
nnoremap <C-p> :lua require('telescope.builtin').git_files()<CR>
nnoremap <Leader>ff :lua require('telescope.builtin').find_files()<CR>

nnoremap <leader>fw :lua require('telescope.builtin').grep_string { search = vim.fn.expand("<cword>") }<CR>
nnoremap <leader>fb :lua require('telescope.builtin').buffers()<CR>
nnoremap <leader>ft :lua require('telescope.builtin').help_tags()<CR>
nnoremap <leader>vrc :lua M.search_dotfiles()<CR>
nnoremap <leader>gc :lua M.git_branches()<CR>
nnoremap <leader>gw :lua require('telescope').extensions.git_worktree.git_worktrees()<CR>
nnoremap <leader>gm :lua require('telescope').extensions.git_worktree.create_git_worktree()<CR>
