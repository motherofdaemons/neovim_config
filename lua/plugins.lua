local ensure_packer = function()
  local fn = vim.fn
  local install_path = fn.stdpath('data') .. '/site/pack/packer/start/packer.nvim'
  if fn.empty(fn.glob(install_path)) > 0 then
    fn.system({ 'git', 'clone', '--depth', '1', 'https://github.com/wbthomason/packer.nvim', install_path })
    vim.cmd [[packadd packer.nvim]]
    return true
  end
  return false
end

local packer_bootstrap = ensure_packer()

return require('packer').startup({ function(use)
  use 'wbthomason/packer.nvim' -- Package manager

  -- Dracula theme
  use 'Mofiqul/dracula.nvim'

  use 'kyazdani42/nvim-web-devicons'

  -- LuaLine
  use {
    'nvim-lualine/lualine.nvim',
    requires = { 'kyazdani42/nvim-web-devicons', opt = true }
  }

  -- Easy lsp setup
  use {
    'VonHeikemen/lsp-zero.nvim',
    requires = {
      -- LSP Support
      { 'neovim/nvim-lspconfig' },
      { 'williamboman/mason.nvim' },
      { 'williamboman/mason-lspconfig.nvim' },

      -- LSP Status
      { 'j-hui/fidget.nvim' },

      -- Autocompletion
      { 'hrsh7th/nvim-cmp' },
      { 'hrsh7th/cmp-buffer' },
      { 'hrsh7th/cmp-path' },
      { 'saadparwaiz1/cmp_luasnip' },
      { 'hrsh7th/cmp-nvim-lsp' },
      { 'hrsh7th/cmp-nvim-lua' },

      -- Snippets
      { 'L3MON4D3/LuaSnip' },
      { 'rafamadriz/friendly-snippets' },

      -- I want rust tools too
      { 'simrat39/rust-tools.nvim' },
    }
  }

  -- Telescpoe fzf
  use {
    'nvim-telescope/telescope.nvim', tag = '0.1.0',
    requires = { { 'nvim-lua/plenary.nvim' } }
  }

  -- nvim-tree
  use {
    'nvim-tree/nvim-tree.lua',
    requires = {
      'nvim-tree/nvim-web-devicons', -- optional, for file icons
    },
    tag = 'nightly' -- optional, updated every week. (see issue #1193)
  }

  -- open files where I left off
  use 'farmergreg/vim-lastplace'

  -- Code actions
  require('packer').use({
    'weilbith/nvim-code-action-menu',
    cmd = 'CodeActionMenu',
  })

  -- light buld like vs code so I know when I can do code actions
  use {
    'kosayoda/nvim-lightbulb',
    requires = 'antoinemadec/FixCursorHold.nvim',
  }

  -- Tree sitter
  use {
    'nvim-treesitter/nvim-treesitter',
    run = function()
      local ts_update = require('nvim-treesitter.install').update({ with_sync = true })
      ts_update()
    end,
  }

  -- indent lines
  use 'lukas-reineke/indent-blankline.nvim'

  -- git support
  use 'lewis6991/gitsigns.nvim'


  -- Formatting
  use 'mhartington/formatter.nvim'

  -- a plugin to easily view all problems
  -- Lua
  use {
    "folke/trouble.nvim",
    requires = "kyazdani42/nvim-web-devicons",
    config = function()
      require("trouble").setup {
        -- your configuration comes here
        -- or leave it empty to use the default settings
        -- refer to the configuration section below
      }
    end
  }

  -- Automatically set up your configuration after cloning packer.nvim
  -- Put this at the end after all plugins
  if packer_bootstrap then
    require('packer').sync()
  end
end,

  -- Use a floating window instead of a buffer for packer
  config = {
    display = {
      open_fn = function()
        return require('packer.util').float({ border = 'single' })
      end
    }
  }
})
