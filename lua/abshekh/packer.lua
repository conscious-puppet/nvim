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

-- Have packer use a popup window
packer.init {
  display = {
    open_fn = function()
      return require("packer.util").float { border = "single" }
    end,
    prompt_border = "single",
  },
}

-- Install your plugins here
return packer.startup(function(use)
  use {
    "wbthomason/packer.nvim", --------------------- Have packer manage itself
    "nvim-lua/popup.nvim", ------------------------ An implementation of the Popup API from vim in Neovim
    "nvim-lua/plenary.nvim", ---------------------- Useful lua functions used ny lots of plugins
  }

  -- ui
  use {
    -- "abshekh/skull-vim", -------------------------- Almost monochrome, with grey and green accent
    -- "kdheepak/monochrome.nvim", ------------------- Monochrome Colorscheme
    -- "tjdevries/colorbuddy.vim", ------------------- Colorbuddy
    -- "~/Dev/skull-vim",
    -- "EdenEast/nightfox.nvim",
    "bluz71/vim-moonfly-colors",
    {
      "catppuccin/nvim",
      as = "catppuccin",
      run = ":CatppuccinCompile"
    },
    "folke/tokyonight.nvim",
    "rebelot/kanagawa.nvim",

    'nvim-lualine/lualine.nvim',

    "lukas-reineke/indent-blankline.nvim", -------- indent guides
    "j-hui/fidget.nvim", -------------------------- progress bar
    -- "norcalli/nvim-colorizer.lua" ----------------- Colorize hex colors in terminal
    "kyazdani42/nvim-web-devicons"
  }
  -- cmp plugins
  use {
    "hrsh7th/nvim-cmp", --------------------------- The completion plugin
    "hrsh7th/cmp-buffer", ------------------------- Buffer completions
    "hrsh7th/cmp-path", --------------------------- Path completions
    "saadparwaiz1/cmp_luasnip", ------------------- Snippet completions
    "hrsh7th/cmp-nvim-lsp", ----------------------- LSP completion
    "hrsh7th/cmp-nvim-lua", ----------------------- LSP completion for neovim lsp
    "hrsh7th/cmp-cmdline",

    "L3MON4D3/LuaSnip", --------------------------- Snippet engine
    "rafamadriz/friendly-snippets", --------------- A bunch of snippets to use
  }

  -- LSP
  use {
    "neovim/nvim-lspconfig",
    -- "williamboman/nvim-lsp-installer",
    {
      "folke/trouble.nvim",
      requires = "kyazdani42/nvim-web-devicons",
      config = function()
        require("trouble").setup {
          -- your configuration comes here
          -- or leave it empty to use the default settings
          -- refer to the configuration section below
        }
      end
    },
    "jose-elias-alvarez/null-ls.nvim",
    "williamboman/mason.nvim",
    "williamboman/mason-lspconfig.nvim",

    -- "https://git.sr.ht/~whynothugo/lsp_lines.nvim",
  }

  -- Telescope
  use {
    "nvim-telescope/telescope.nvim",
    "nvim-telescope/telescope-media-files.nvim",
    {
      "nvim-telescope/telescope-smart-history.nvim",
      requires = "kkharji/sqlite.lua"
    },
    "nvim-telescope/telescope-ui-select.nvim",
  }

  -- Treesitter
  use {
    {
      "nvim-treesitter/nvim-treesitter",
      run = ":TSUpdate",
    },
    "nvim-treesitter/playground", ----------- treesitter playground
    "p00f/nvim-ts-rainbow", ----------------- Rainbow Parens
    "windwp/nvim-autopairs", ---------------- Autopairs, integrates with both cmp and treesitter
    { --------------------------------------- Easily comment stuff
      'numToStr/Comment.nvim',
      config = function()
        require('Comment').setup()
      end
    },
    "JoosepAlviste/nvim-ts-context-commentstring",
  }

  -- Git
  use {
    "lewis6991/gitsigns.nvim", -------------- Shows git changes
    "tpope/vim-fugitive", ------------------- Git Wrapper
    -- "TimUntersberger/neogit",
    -- { "sindrets/diffview.nvim", requires = "nvim-lua/plenary.nvim" },
  }

  -- Session
  use {
    "rmagatti/auto-session",
    "rmagatti/session-lens",
  }

  -- Utilities
  use {
    "kyazdani42/nvim-tree.lua", -------------- Explorer
    "akinsho/toggleterm.nvim",
  }


  -- Automatically set up your configuration after cloning packer.nvim
  -- Put this at the end after all plugins
  if PACKER_BOOTSTRAP then
    require("packer").sync()
  end
end)
