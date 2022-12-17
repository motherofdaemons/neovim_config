vim.opt.signcolumn = 'yes' -- Reserve space for diagnostic icons

require('mason.settings').set({
  ui = {
    border = 'rounded'
  }
})

local lsp = require('lsp-zero')
lsp.preset('recommended')

lsp.ensure_installed({
  'sumneko_lua',
  'clangd',
  'rust_analyzer',
})

-- Use rust tools instead of just rust rust_analyzer
local rust_lsp = lsp.build_options('rust_analyzer', {})

lsp.nvim_workspace()

lsp.setup()

-- Initialize rust_analyzer with rust-tools
require('rust-tools').setup({server = rust_lsp})

-- Lets me know what the lsp is doing
require('fidget').setup {}
