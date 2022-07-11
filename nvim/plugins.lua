local fn = vim.fn
local install_path = fn.stdpath('data')..'/site/pack/packer/start/packer.nvim'
if fn.empty(fn.glob(install_path)) > 0 then
  packer_bootstrap = fn.system({'git', 'clone', '--depth', '1', 'https://github.com/wbthomason/packer.nvim', install_path})
end
vim.cmd [[packadd packer.nvim]]

return require('packer').startup(function(use)
  use 'wbthomason/packer.nvim'

  -- File explorer
  use {
    'kyazdani42/nvim-tree.lua',
    requires = 'kyazdani42/nvim-web-devicons',
    config = function()
      require('nvim-tree').setup {
        view = { width = 35 }
      }
    end
  }

  -- Theme
  use {
    'navarasu/onedark.nvim',
    config = function()
      require('onedark').setup()
      require('onedark').load()
    end
  }

  -- Treesitter
  use {
    'nvim-treesitter/nvim-treesitter',
    run = ':TSUpdate',
    config = function()
      require('nvim-treesitter.configs').setup {
        ensure_installed = { 'lua', 'bash', 'markdown', 'typescript', 'javascript', 'rust', 'python', 'toml', 'yaml', 'json' },
        auto_install = true,
        highlight = {
          enable = true,
          additional_vim_regex_highlighting = false
        },
        indent = { enable = true },
        incremental_selection = {
          enable = true,
          keymaps = {} -- TODO
        }
      }
    end
  }

  -- Lualine
  use {
    'nvim-lualine/lualine.nvim',
    requires = { 'kyazdani42/nvim-web-devicons', opt = true },
    config = function()
      require('lualine').setup {
        options = { theme = 'onedark' }
      }
    end
  }

  -- indent lines
  use {
    'lukas-reineke/indent-blankline.nvim',
    config = function()
      require('indent_blankline').setup()
    end
  }

  -- Telescope
  use {
    'nvim-telescope/telescope.nvim',
    opt = false,
    requires = {
      { 'nvim-lua/plenary.nvim' },
      { 'kyazdani42/nvim-web-devicons', opt = true }
    },
    setup = function()
      require('telescope').setup()
      require('telescope').load_extension('fzf')
    end
  }

  -- Telescope fzf
  use {
    'nvim-telescope/telescope-fzf-native.nvim',
    run = 'make'
  }

  -- Autopairs
  use {
	  'windwp/nvim-autopairs',
    config = function()
      require('nvim-autopairs').setup()
    end
  }

  -- Completion
  use 'L3MON4D3/LuaSnip'
  use {
    'hrsh7th/nvim-cmp',
    requires = {
      { 'hrsh7th/cmp-cmdline' },
      { 'hrsh7th/cmp-path' },
      { 'hrsh7th/cmp-buffer' },
      { 'hrsh7th/cmp-nvim-lsp' },
      { 'neovim/nvim-lspconfig' }
    },
    config = function()
      require('completions')
    end
  }
  use 'saadparwaiz1/cmp_luasnip'
  use 'rafamadriz/friendly-snippets'

  use 'neovim/nvim-lspconfig'

  if packer_bootstrap then
    require('packer').sync()
  end
end)

