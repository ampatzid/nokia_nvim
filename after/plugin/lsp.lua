local lsp = require('lsp-zero')

lsp.preset('recommended')

lsp.ensure_installed({
  'sumneko_lua',
})

-- setup nvim-cmp.
vim.cmd [[packadd nvim-cmp]]
vim.cmd [[packadd cmp-nvim-lsp]]
vim.cmd [[packadd cmp-buffer]]
vim.cmd [[packadd cmp-look]]
vim.cmd [[packadd lspkind-nvim]]

local nvim_lsp = require('lspconfig')
local util = require('lspconfig/util')
local protocol = require('vim.lsp.protocol')
local lspkind = require('lspkind')

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

lsp.set_preferences({
  suggest_lsp_servers = true,
  setup_servers_on_start = true,
  set_lsp_keymaps = true,
  configure_diagnostics = true,
  cmp_capabilities = true,
  manage_nvim_cmp = true,
  call_servers = 'local',
  sign_icons = {
    error = '✘',
    warn = '▲',
    hint = '⚑',
    info = ''
  }
})

local cmp = require('cmp')

local cmp_select = {behavior = cmp.SelectBehavior.Select}

local cmp_mappings = lsp.defaults.cmp_mappings({
  ['<C-p>'] = cmp.mapping.select_prev_item(cmp_select),
  ['<C-n>'] = cmp.mapping.select_next_item(cmp_select),
  ['<C-d>'] = cmp.mapping.scroll_docs(-4),
  ['<C-f>'] = cmp.mapping.scroll_docs(4),
  ['<C-Space>'] = cmp.mapping.complete(),
  ['<C-e>'] = cmp.mapping.close(),
  ['<CR>'] = cmp.mapping.confirm({ select = true }),
  ['<Tab>'] = cmp.mapping(cmp.mapping.select_next_item(), { 'i', 's' }),
})

local cmp_sources = lsp.defaults.cmp_sources({
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
})

local cmp_formatting = {
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
}

local cmp_experimental = {
  -- I like the new menu better! Nice work hrsh7th
  native_menu = false,
  -- Let's play with this for a day or two
  ghost_text = true
}

lsp.setup_nvim_cmp({
  formatting = cmp_formatting,
  mapping = cmp_mappings,
  sources = cmp_sources,
  experimental = cmp_experimental
})

cmp.setup({

  formatting = cmp_formatting,

  mapping = cmp_mappings,
  -- sources = cmp.config.sources({
  sources = cmp_sources,

  --[[
  snippet = {
    expand = function(args)
      vim.fn["vsnip#anonymous"](args.body) -- For `vsnip` users.
      -- require('luasnip').lsp_expand(args.body) -- For `luasnip` users.
      -- vim.fn["UltiSnips#Anon"](args.body) -- For `ultisnips` users.
      -- require'snippy'.expand_snippet(args.body) -- For `snippy` users.
    end,
  },
  ]]--

  experimental = cmp_experimental,
})

local on_attach = function(_, bufnr)

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

  local opts = {buffer = bufnr, remap = false, silent = true }

  vim.keymap.set("n", "<leader>gD", function () vim.lsp.buf.declaration() end, opts)
  vim.keymap.set("n", "<leader>gd", function() vim.lsp.buf.definition() end, opts)
  vim.keymap.set("n", "<leader>gi", function () vim.lsp.buf.implementation() end, opts)
  vim.keymap.set("n", "<leader>gy", function () vim.lsp.buf.type_definition() end, opts)
  vim.keymap.set("n", "<leader>gr", function() vim.lsp.buf.references() end, opts)
  vim.keymap.set("n", "<leader>rn", function() vim.lsp.buf.rename() end, opts)
  vim.keymap.set("n", "K", function() vim.lsp.buf.hover() end, opts)
  vim.keymap.set("n", "<leader>vws", function() vim.lsp.buf.workspace_symbol() end, opts)
  vim.keymap.set("n", "<leader>vd", function() vim.diagnostic.open_float() end, opts)
  vim.keymap.set("n", "<space>n", function() vim.diagnostic.goto_next() end, opts)
  vim.keymap.set("n", "<space>p", function() vim.diagnostic.goto_prev() end, opts)
  vim.keymap.set("n", "<space>ca", function() vim.lsp.buf.code_action() end, opts)
  vim.keymap.set("i", "<C-h>", function() vim.lsp.buf.signature_help() end, opts)
  vim.keymap.set("n", "<space>wl", function () print(vim.inspect(vim.lsp.buf.list_workspace_folders())) end, opts)
  vim.keymap.set("n", "<space>e", function () vim.lsp.diagnostic.show_line_diagnostics() end, opts)
  vim.keymap.set("n", "<space>q", function () vim.lsp.diagnostic.set_loclist() end, opts)
end

lsp.on_attach(on_attach)

local capabilities = require('cmp_nvim_lsp').default_capabilities(protocol.make_client_capabilities())

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

lsp.setup()
