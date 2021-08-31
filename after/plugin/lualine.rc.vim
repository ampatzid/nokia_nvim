lua << EOF

local function getFunctionName()
    return vim.api.nvim_call_function( "tagbar#currenttag", {'%s', ''})
end

require'lualine'.setup {
    options = {
        icons_enabled = true,
        theme = 'onedark',
        section_separators = {'', ''},
        component_separators = {'', ''},
        disabled_filetypes = {}
        },
    sections = {
        lualine_a = {'mode'},
        lualine_b = {'branch'},
        lualine_c = {'filename', {getFunctionName}},
        lualine_x = {
            { 'diagnostics', sources = {"nvim_lsp"}, symbols = {error = ' ', warn = ' ', info = ' ', hint = ' '} },
            'diff',
            'filetype'
            },
        lualine_y = {'progress'},
        lualine_z = {'location'}
        },
    inactive_sections = {
        lualine_a = {},
        lualine_b = {},
        lualine_c = {'filename', {getFunctionName}},
        lualine_x = {'location'},
        lualine_y = {},
        lualine_z = {}
        },
    tabline = {},
    extensions = {'fugitive', 'nerdtree', 'quickfix'}
}

EOF

