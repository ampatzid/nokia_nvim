if !exists('g:lspconfig')
    finish
endif

lua << EOF

-- Setup nvim-cmp.
vim.cmd [[packadd nvim-cmp]]
vim.cmd [[packadd cmp-nvim-lsp]]
vim.cmd [[packadd cmp-buffer]]
vim.cmd [[packadd cmp-look]]
vim.cmd [[packadd lspkind-nvim]]

local cmp = require'cmp'
local nvim_lsp = require('lspconfig')
local util = require 'lspconfig/util'
local protocol = require('vim.lsp.protocol')
local cmp_lsp = require 'cmp_nvim_lsp'

local lspkind = require 'lspkind'

lspkind.init({
    mode = 'symbol_text',
    preset = 'codicons',

    -- override preset symbols
    --
    -- default: {}
    symbol_map = {
      Text = '', -- Text
      Method = '', -- Method
      Function = "", -- Function
      Constructor = "", -- Constructor
      Field = '', -- Field
      Variable = '', -- Variable
      Clas = '', -- Class
      Interface = 'ﰮ', -- Interface
      Module = '', -- Module
      Property = '', -- Property
      Unit = '', -- Unit
      Value = '', -- Value
      Enum = '', -- Enum
      Keyword = '', -- Keyword
      Snippet = '﬌', -- Snippet
      Color = '', -- Color
      File = '', -- File
      Reference = '', -- Reference
      Folder = '', -- Folder
      EnumMember = '', -- EnumMember
      Constant = '', -- Constant
      Struct = '', -- Struct
      Event = '', -- Event
      Operator = 'ﬦ', -- Operator
      TypeParameter = '', -- TypeParameter
    },
})

vim.cmd [[
highlight DiagnosticLineNrError guibg=#51202A guifg=#FF0000 gui=bold
highlight DiagnosticLineNrWarn guibg=#51412A guifg=#FFA500 gui=bold
highlight DiagnosticLineNrInfo guibg=#1E535D guifg=#00FFFF gui=bold
highlight DiagnosticLineNrHint guibg=#1E205D guifg=#0000FF gui=bold

sign define DiagnosticSignError text= texthl=DiagnosticSignError linehl= numhl=DiagnosticLineNrError
sign define DiagnosticSignWarn text= texthl=DiagnosticSignWarn linehl= numhl=DiagnosticLineNrWarn
sign define DiagnosticSignInfo text= texthl=DiagnosticSignInfo linehl= numhl=DiagnosticLineNrInfo
sign define DiagnosticSignHint text= texthl=DiagnosticSignHint linehl= numhl=DiagnosticLineNrHint
]]

cmp.setup({

    formatting = {
        format = function(entry, vim_item)
            vim_item.kind = lspkind.presets.default[vim_item.kind]
            vim_item.menu = ({
                nvim_lsp = "[LSP]",
                look = "[Dict]",
                buffer = "[Buffer]",
                path = "[Path]",
                })[entry.source.name]
            return vim_item
        end
        },

    snippet = {
      expand = function(args)
        vim.fn["vsnip#anonymous"](args.body) -- For `vsnip` users.
        -- require('luasnip').lsp_expand(args.body) -- For `luasnip` users.
        -- vim.fn["UltiSnips#Anon"](args.body) -- For `ultisnips` users.
        -- require'snippy'.expand_snippet(args.body) -- For `snippy` users.
      end,
    },

    mapping = {
      ['<C-d>'] = cmp.mapping.scroll_docs(-4),
      ['<C-f>'] = cmp.mapping.scroll_docs(4),
      ['<C-Space>'] = cmp.mapping.complete(),
      ['<C-e>'] = cmp.mapping.close(),
      ['<CR>'] = cmp.mapping.confirm({ select = true }),
      ['<Tab>'] = cmp.mapping(cmp.mapping.select_next_item(), { 'i', 's' }),
    },

    -- sources = cmp.config.sources({
    sources = {
      { name = 'nvim_lsp' },
      {
            name = 'buffer',
            keyword_length = 5,
            options = {
                get_bufnrs = function()
                    return vim.api.nvim_list_bufs()
                end,
            },
      },
      { name = 'path' },
      { name = 'look', keyword_length = 4 },
    },

    experimental = {
    -- I like the new menu better! Nice work hrsh7th
      native_menu = false,
    -- Let's play with this for a day or two
      ghost_text = true
    },
      -- { name = 'vsnip'}, -- For vsnip users.
      -- { name = 'luasnip' }, -- For luasnip users.
      -- { name = 'ultisnips' }, -- For ultisnips users.
      -- { name = 'snippy' }, -- For snippy users.
    -- }, {
    --   { name = 'buffer' },
    -- })
})

local on_attach = function(client, bufnr)
    local function buf_set_keymap(...) vim.api.nvim_buf_set_keymap(bufnr, ...) end
    local function buf_set_option(...) vim.api.nvim_buf_set_option(bufnr, ...) end

    -- Suppress virtual text.
    vim.lsp.handlers["textDocument/publishDiagnostics"] = vim.lsp.with(
        vim.lsp.diagnostic.on_publish_diagnostics, {
            -- disable virtual text
            virtual_text = false,

            -- show signs
            signs = true,

            -- delay update diagnostics
            update_in_insert = false,
        }
    )

    -- Completion.
    -- require 'cmp'.on_attach(client, bufnr)
    -- protocol.SymbolKind = { }
    -- protocol.CompletionItemKind = {
    --     '', -- Text
    --     '', -- Method
    --     '', -- Function
    --     '', -- Constructor
    --     '', -- Field
    --     '', -- Variable
    --     '', -- Class
    --     'ﰮ', -- Interface
    --     '', -- Module
    --     '', -- Property
    --     '', -- Unit
    --     '', -- Value
    --     '', -- Enum
    --     '', -- Keyword
    --     '﬌', -- Snippet
    --     '', -- Color
    --     '', -- File
    --     '', -- Reference
    --     '', -- Folder
    --     '', -- EnumMember
    --     '', -- Constant
    --     '', -- Struct
    --     '', -- Event
    --     'ﬦ', -- Operator
    --     '', -- TypeParameter
    -- }
    -- Mappings.
    local opts = { noremap = true, silent = true }
    
    buf_set_keymap('n', '<leader>gD', '<Cmd>lua vim.lsp.buf.declaration()<CR>', opts)
    buf_set_keymap('n', '<leader>gd', '<Cmd>lua vim.lsp.buf.definition()<CR>', opts)
    buf_set_keymap('n', '<leader>gi', '<cmd>lua vim.lsp.buf.implementation()<CR>', opts)
    buf_set_keymap('n', '<leader>gy', '<cmd>lua vim.lsp.buf.type_definition()<CR>', opts)
    buf_set_keymap('n', '<leader>rn', '<cmd>lua vim.lsp.buf.rename()<CR>', opts)
    buf_set_keymap('n', '<space>wl', '<cmd>lua print(vim.inspect(vim.lsp.buf.list_workspace_folders()))<CR>', opts)
    buf_set_keymap('n', '<space>e', '<cmd>lua vim.lsp.diagnostic.show_line_diagnostics()<CR>', opts)
    buf_set_keymap('n', '<space>ca' , '<cmd>lua vim.lsp.buf.code_action()<CR>', opts)
    buf_set_keymap('n', '<leader>gr', '<cmd>lua vim.lsp.buf.references()<CR>', opts)
    buf_set_keymap('n', 'K', '<cmd>lua vim.lsp.buf.hover()<CR>', opts)
    buf_set_keymap('n', '<space-k>', '<cmd>lua vim.lsp.buf.signature_help()<CR>', opts)
    buf_set_keymap('n', '<space>p', '<cmd>lua vim.lsp.diagnostic.goto_prev()<CR>', opts)
    buf_set_keymap('n', '<space>n', '<cmd>lua vim.lsp.diagnostic.goto_next()<CR>', opts)
    buf_set_keymap('n', '<space>q', '<cmd>lua vim.lsp.diagnostic.set_loclist()<CR>', opts)
end

local capabilities = require('cmp_nvim_lsp').default_capabilities(vim.lsp.protocol.make_client_capabilities())

nvim_lsp.ccls.setup {
    on_attach = on_attach,
    capabilities = capabilities,
    cmd = {"ccls"},
    filetypes = { "c", "cc", "cpp", "c++", "h", "hpp" },
    root_dir = function(fname)
      return util.root_pattern('compile_commands.json', '.ccls', 'compile_flags.txt', '.git')(fname)
        or util.path.dirname(fname)
    end,
    init_options = {
        cache = {
           directory = os.getenv("CCLS_CACHE_PATH")
        }
    }
}

nvim_lsp.gopls.setup {
    on_attach = on_attach,
    capabilities = capabilities,
    cmd = {"gopls", "serve"},
    settings = {
        gopls = {
            analyses = {
                unusedparams = true,
            },
            staticcheck = true,
        },
    },
}

function goimports(timeoutms)
    local context = { source = { organizeImports = true } }
    vim.validate { context = { context, "t", true } }

    local params = vim.lsp.util.make_range_params()
    params.context = context

    local method = "textDocument/codeAction"
    local resp = vim.lsp.buf_request_sync(0, method, params, timeoutms)
    if resp and resp[1] then
        local result = resp[1].result
        if result and result[1] then
            local edit = result[1].edit
            vim.lsp.util.apply_workspace_edit(edit)
        end
    end
    vim.lsp.buf.formatting()
end
EOF
