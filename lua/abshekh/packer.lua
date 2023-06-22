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

-- Use a protected call so we don"t error out on first use
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
    "wbthomason/packer.nvim",      --------------------- Have packer manage itself
    "nvim-lua/popup.nvim",         ------------------------ An implementation of the Popup API from vim in Neovim
    "nvim-lua/plenary.nvim",       ---------------------- Useful lua functions used ny lots of plugins
    "nvim-tree/nvim-web-devicons", --------------- Icons used by a bunch of plugins
  }

  -- filepath plugins
  use {
    "$HOME/dev/lua/calltree.nvim",
    config = function()
      require("calltree").setup()
    end,
  }

  -- ui
  use {
    -- "bluz71/vim-moonfly-colors",
    "folke/tokyonight.nvim",
    "sainnhe/sonokai",
    -- "monsonjeremy/onedark.nvim",
    "rebelot/kanagawa.nvim",
    { "catppuccin/nvim",             as = "catppuccin" },
    "gbprod/nord.nvim",
    "JoosepAlviste/palenightfall.nvim",
    { "projekt0n/github-nvim-theme", tag = "v0.0.7" },
    "lukas-reineke/indent-blankline.nvim", -------- indent guides
    "j-hui/fidget.nvim",                   -------------------------- progress bar
    "norcalli/nvim-colorizer.lua",         ---------------- Colorize hex colors in terminal
    "nvim-lualine/lualine.nvim",
    {
      "utilyre/barbecue.nvim",
      tag = "*",
      requires = {
        "SmiteshP/nvim-navic",
        "nvim-tree/nvim-web-devicons", -- optional dependency
      },
      after = "nvim-web-devicons",     -- keep this if you're using NvChad
      config = function()
        require("barbecue").setup({
          show_modified = true,
        })
      end,
    }
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
    { "neovim/nvim-lspconfig" },
    { "williamboman/mason.nvim" },
    { "williamboman/mason-lspconfig.nvim" },

    -- Autocompletion
    { "hrsh7th/nvim-cmp" },
    { "hrsh7th/cmp-buffer" },
    { "hrsh7th/cmp-path" },
    { "saadparwaiz1/cmp_luasnip" },
    { "hrsh7th/cmp-nvim-lsp" },
    { "hrsh7th/cmp-nvim-lua" },

    -- Snippets
    { "L3MON4D3/LuaSnip" },
    { "rafamadriz/friendly-snippets" },
    -- "jose-elias-alvarez/null-ls.nvim",
    -- "https://git.sr.ht/~whynothugo/lsp_lines.nvim",
    "purescript-contrib/purescript-vim", -- for purescript
    "simrat39/rust-tools.nvim",

    -- "ldelossa/nvim-ide"
    { "akinsho/flutter-tools.nvim", requires = "nvim-lua/plenary.nvim" },
    "mfussenegger/nvim-jdtls",
    {
      "rcarriga/nvim-dap-ui",
      after = "nvim-lspconfig",
      requires = { "mfussenegger/nvim-dap" },
      config = function()
        require("dapui").setup()
      end,
    },
    "Pocco81/DAPInstall.nvim",
    -- {
    --   "glepnir/lspsaga.nvim",
    --   -- branch = "main",
    --   commit = "109286f8def4187c3a35494b8760fd14105e9d8c",
    -- },
    {
      'dccsillag/magma-nvim',
      run = ':UpdateRemotePlugins'
    },
  }

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
    "windwp/nvim-autopairs",
    {
      "numToStr/Comment.nvim",
      config = function()
        require("Comment").setup()
      end
    },
    "JoosepAlviste/nvim-ts-context-commentstring",
  }
  --
  -- Git
  use {
    "lewis6991/gitsigns.nvim", -------------- Shows git changes
    "tpope/vim-fugitive",      ------------------- Git Wrapper
    "sindrets/diffview.nvim",
    "idanarye/vim-merginal",
    -- "kdheepak/lazygit.nvim",
    -- "TimUntersberger/neogit",
  }

  -- Utilities
  use {
    "kyazdani42/nvim-tree.lua", -------------- Explorer
    --   -- "dstein64/vim-startuptime",
    {
      "junegunn/vim-easy-align",
      config = function()
        vim.g.easy_align_ignore_groups = {}
      end
    },
    "dhruvasagar/vim-table-mode",
    {
      "phaazon/mind.nvim",
      branch = "v2.2",
      config = function()
        require "mind".setup()
      end
    },
    "christoomey/vim-tmux-navigator",
  }

  -- Automatically set up your configuration after cloning packer.nvim
  -- Put this at the end after all plugins
  if PACKER_BOOTSTRAP then
    require("packer").sync()
  end
end)
