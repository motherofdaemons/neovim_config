require('plugins')
require('plugins-settings')

-- Color scheme
vim.cmd [[colorscheme dracula]]

-- tabs are spaces
vim.opt.expandtab = true
-- 4 spaces default
vim.opt.tabstop = 4
vim.opt.softtabstop = 4
vim.opt.shiftwidth = 4

-- some stuff I like to use 2 spaces
vim.api.nvim_create_autocmd('FileType', {
  pattern = 'lua',
  callback = function()
    vim.opt_local.tabstop = 2
    vim.opt_local.softtabstop = 2
    vim.opt_local.shiftwidth = 2
  end
})

-- line numbers
vim.opt.number = true
vim.opt.relativenumber = true
