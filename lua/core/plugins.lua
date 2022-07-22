local fn = vim.fn

-- Automatically install packer
local install_path = fn.stdpath "data" .. "/site/pack/packer/start/packer.nvim"
if fn.empty(fn.glob(install_path)) > 0 then
  PACKER_BOOTSTRAP = fn.system {
    "git",
    "clone",
    "--depth",
    "1",
    "https://github.com/wbthomason/packer.nvim",
    install_path,
  }
  print "Installing packer close and reopen Neovim..."
  vim.cmd [[packadd packer.nvim]]
end

-- Autocommand that reloads neovim whenever you save the plugins.lua file
vim.cmd [[
  augroup packer_user_config
    autocmd!
    autocmd BufWritePost plugins.lua source <afile> | PackerSync
  augroup end
]]

-- Use a protected call so we don't error out on first use
local status_ok, packer = pcall(require, "packer")
if not status_ok then
  return
end

-- Have packer use a popup window
packer.init {
  display = {
    open_fn = function()
      return require("packer.util").float { border = "none" }
    end,
    prompt_border = "none",
  },
}

-- Install your plugins here
return packer.startup(function(use)
  -- Plugins go here
  use "wbthomason/packer.nvim" -- Have packer manage itself
  use "nvim-lua/popup.nvim" -- An implementation of the Popup API from vim in Neovim
  use "nvim-lua/plenary.nvim" -- Useful lua functions used ny lots of plugins

  -- Colorscheme
  -- use "abshekh/skull-vim"                  -- Almost monochrome, with grey and green accent
  -- use "kdheepak/monochrome.nvim"           -- Monochrome Colorscheme
  -- use "tjdevries/colorbuddy.vim"           -- Colorbuddy
  -- use "~/Dev/skull-vim"
  -- use 'folke/tokyonight.nvim'
  -- use "EdenEast/nightfox.nvim"
  use 'bluz71/vim-moonfly-colors'
  use({
    "catppuccin/nvim",
    as = "catppuccin",
    run = ":CatppuccinCompile"
  })

  use {
    'nvim-lualine/lualine.nvim',
    requires = { 'kyazdani42/nvim-web-devicons', opt = true }
  }

  use "lukas-reineke/indent-blankline.nvim" -- indent guides

  -- use "norcalli/nvim-colorizer.lua" -- Colorize hex colors in terminal

  -- cmp plugins
  use "hrsh7th/nvim-cmp" -- The completion plugin
  use "hrsh7th/cmp-buffer" -- Buffer completions
  use "hrsh7th/cmp-path" -- Path completions
  use "saadparwaiz1/cmp_luasnip" -- Snippet completions
  use "hrsh7th/cmp-nvim-lsp" -- LSP completion
  use "hrsh7th/cmp-nvim-lua" -- LSP completion for neovim lsp
  use "hrsh7th/cmp-cmdline"

  -- snippets
  use "L3MON4D3/LuaSnip" -- Snippet engine
  use "rafamadriz/friendly-snippets" -- A bunch of snippets to use


  -- LSP
  use "neovim/nvim-lspconfig" -- Enable LSP
  use "williamboman/nvim-lsp-installer" -- Simple to use language server installer
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
  -- use "jose-elias-alvarez/null-ls.nvim"

  -- Telescope
  use "nvim-telescope/telescope.nvim"
  use 'nvim-telescope/telescope-media-files.nvim'
  use {
    'nvim-telescope/telescope-smart-history.nvim',
    requires = "kkharji/sqlite.lua"
  }
  use { 'nvim-telescope/telescope-ui-select.nvim' }

  -- Treesitter
  use {
    "nvim-treesitter/nvim-treesitter",
    run = ":TSUpdate",
  }
  use "nvim-treesitter/playground" -- treesitter playground
  use "p00f/nvim-ts-rainbow" -- Rainbow Parens
  use "windwp/nvim-autopairs" -- Autopairs, integrates with both cmp and treesitter


  use { -- Easily comment stuff
    'numToStr/Comment.nvim',
    config = function()
      require('Comment').setup()
    end
  }
  use {
    "JoosepAlviste/nvim-ts-context-commentstring"
  }

  -- Git
  use "lewis6991/gitsigns.nvim" -- Shows git changes
  use "tpope/vim-fugitive" -- Git Wrapper
  -- use "TimUntersberger/neogit"
  -- use { "sindrets/diffview.nvim", requires = "nvim-lua/plenary.nvim" }

  use "kyazdani42/nvim-tree.lua" -- Explorer


  -- Automatically set up your configuration after cloning packer.nvim
  -- Put this at the end after all plugins
  if PACKER_BOOTSTRAP then
    require("packer").sync()
  end
end)
