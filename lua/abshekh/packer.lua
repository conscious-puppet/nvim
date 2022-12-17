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
    autocmd BufWritePost packer.lua source <afile> | PackerSync
  augroup end
]]

-- Use a protected call so we don't error out on first use
local status_ok, packer = pcall(require, "packer")
if not status_ok then
  return
end

packer.init {
  display = {
    open_fn = function()
      return require("packer.util").float {
        border = vim.g.border_style
      }
    end,
    prompt_border = vim.g.border_style,
  },
}

-- Install your plugins here
return packer.startup(function(use)
  use {
    "wbthomason/packer.nvim", --------------------- Have packer manage itself
    "nvim-lua/popup.nvim", ------------------------ An implementation of the Popup API from vim in Neovim
    "nvim-lua/plenary.nvim", ---------------------- Useful lua functions used ny lots of plugins
    "kyazdani42/nvim-web-devicons", --------------- Icons used by a bunch of plugins
  }

  -- ui
  use {
    -- "bluz71/vim-moonfly-colors",
    "folke/tokyonight.nvim",
    "sainnhe/sonokai",
    -- "monsonjeremy/onedark.nvim",
    'nvim-lualine/lualine.nvim',
    "lukas-reineke/indent-blankline.nvim", -------- indent guides
    "j-hui/fidget.nvim", -------------------------- progress bar
    "norcalli/nvim-colorizer.lua", ---------------- Colorize hex colors in terminal
  }

  -- LSP, DAP
  use {
    {
      "folke/trouble.nvim",
      config = function()
        require("trouble").setup {
          use_diagnostic_signs = true
        }
      end
    },
    "jose-elias-alvarez/null-ls.nvim",
    -- "https://git.sr.ht/~whynothugo/lsp_lines.nvim",
    "purescript-contrib/purescript-vim", -- for purescript
    "simrat39/rust-tools.nvim",
    {
      'VonHeikemen/lsp-zero.nvim',
      requires = {
        -- LSP Support
        { 'neovim/nvim-lspconfig' },
        { 'williamboman/mason.nvim' },
        { 'williamboman/mason-lspconfig.nvim' },

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
      }
    }
  }

  -- Telescope
  use {
    "nvim-telescope/telescope.nvim",
    "nvim-telescope/telescope-media-files.nvim",
    {
      "nvim-telescope/telescope-smart-history.nvim",
      requires = "kkharji/sqlite.lua",
    },
  }

  -- Treesitter
  use {
    {
      "nvim-treesitter/nvim-treesitter",
      run = ":TSUpdate",
    },
    "nvim-treesitter/playground", ----------- treesitter playground
    "windwp/nvim-autopairs", ---------------- Autopairs, integrates with both cmp and treesitter
    { --------------------------------------- Easily comment stuff
      'numToStr/Comment.nvim',
      config = function()
        require('Comment').setup()
      end
    },
    "JoosepAlviste/nvim-ts-context-commentstring",
  }
  --
  -- Git
  use {
    "lewis6991/gitsigns.nvim", -------------- Shows git changes
    "tpope/vim-fugitive", ------------------- Git Wrapper
    "sindrets/diffview.nvim",
    -- "kdheepak/lazygit.nvim",
    -- "TimUntersberger/neogit",
  }

  -- Utilities
  use {
    "kyazdani42/nvim-tree.lua", -------------- Explorer
    --   -- "dstein64/vim-startuptime",
    "junegunn/vim-easy-align",
    "dhruvasagar/vim-table-mode",
  }

  -- Automatically set up your configuration after cloning packer.nvim
  -- Put this at the end after all plugins
  if PACKER_BOOTSTRAP then
    require("packer").sync()
  end
end)
