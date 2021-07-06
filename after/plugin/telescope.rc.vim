if !exists('g:loaded_telescope') | finish | endif

nnoremap <silent> <C-p>      <Cmd>Telescope find_files<CR>
nnoremap <silent> <leader>fg <Cmd>Telescope live_grep<CR>
nnoremap <silent> <leader>fb <Cmd>Telescope buffers<CR>
nnoremap <silent> <leader>ft <Cmd>Telescope help_tags<CR>

lua << EOF
local actions = require('telescope.actions')
-- Global remapping
------------------------------
require('telescope').setup{
  defaults = {
    mappings = {
      n = {
        ["q"] = actions.close
      },
    },
  }
}
EOF
