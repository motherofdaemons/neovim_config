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
})

lsp.nvim_workspace()

lsp.setup()

-- Lets me know what the lsp is doing
require('fidget').setup {}
