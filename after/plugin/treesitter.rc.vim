if !exists('g:loaded_nvim_treesitter')
    finish
endif

lua << EOF
require 'nvim-treesitter.configs'.setup {
    hightlight = {
        enable = true,
        disable = {},
    },
    intent = {
        enable = false,
        disable = {},
    },
    ensure_installed = {
        "bash",
        "c",
        "cpp",
        "go",
        "json",
        "lua",
        "yaml"
    }
}
EOF
