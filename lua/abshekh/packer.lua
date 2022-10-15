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
    "bluz71/vim-moonfly-colors",
    "folke/tokyonight.nvim",
    "monsonjeremy/onedark.nvim",
    'nvim-lualine/lualine.nvim',
    "lukas-reineke/indent-blankline.nvim", -------- indent guides
    "j-hui/fidget.nvim", -------------------------- progress bar
    "norcalli/nvim-colorizer.lua", ---------------- Colorize hex colors in terminal
    --
    --   -- { "folke/todo-comments.nvim", ----------------- todo highlight
    --   --   config = function()
    --   --     require("todo-comments").setup {
    --   --       -- your configuration comes here
    --   --       -- or leave it empty to use the default settings
    --   --       -- refer to the configuration section below
    --   --     }
    --   --   end
    --   -- },
  }
  -- cmp plugins
  use {
    "hrsh7th/nvim-cmp", --------------------------- The completion plugin
    "hrsh7th/cmp-buffer", ------------------------- Buffer completions
    "hrsh7th/cmp-path", --------------------------- Path completions
    "saadparwaiz1/cmp_luasnip", ------------------- Snippet completions
    "hrsh7th/cmp-nvim-lsp", ----------------------- LSP completion
    "hrsh7th/cmp-nvim-lua", ----------------------- LSP completion for neovim lsp
    "hrsh7th/cmp-cmdline", ----------------------- Command mode auto trigger and completion


    "L3MON4D3/LuaSnip", --------------------------- Snippet engine
    "rafamadriz/friendly-snippets", --------------- A bunch of snippets to use
  }

  -- LSP
  use {
    "neovim/nvim-lspconfig",
    {
      "folke/trouble.nvim",
      config = function()
        require("trouble").setup {
          use_diagnostic_signs = true
        }
      end
    },
    "jose-elias-alvarez/null-ls.nvim",
    "williamboman/mason.nvim",
    -- "williamboman/nvim-lsp-installer", -- not required, using mason
    -- "williamboman/mason-lspconfig.nvim", -- not required, since it is just a shallow abstraction

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
    -- "nvim-telescope/telescope-ui-select.nvim",
    -- "nvim-telescope/telescope-file-browser.nvim"
  }

  -- Treesitter
  use {
    {
      "nvim-treesitter/nvim-treesitter",
      run = ":TSUpdate",
    },
    "nvim-treesitter/playground", ----------- treesitter playground
    -- "p00f/nvim-ts-rainbow", ----------------- Rainbow Parens, performance issue
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

  -- -- Session
  -- use {
  --   "rmagatti/auto-session",
  --   "rmagatti/session-lens",
  -- }

  -- Utilities
  use {
    "kyazdani42/nvim-tree.lua", -------------- Explorer
    "ahmedkhalf/project.nvim",
    --   -- "dstein64/vim-startuptime",
  }


  -- Automatically set up your configuration after cloning packer.nvim
  -- Put this at the end after all plugins
  if PACKER_BOOTSTRAP then
    require("packer").sync()
  end
end)
