local hl = function(hlName, hlOpt)
  vim.api.nvim_set_hl(0, hlName, hlOpt)
end

return {
  {
    "rebelot/kanagawa.nvim",
    config = function()
      vim.cmd.colorscheme("kanagawa")
      -- vim.api.nvim_set_hl(0, "diffAdded", { bg = "#283b4d" })
      -- vim.api.nvim_set_hl(0, "diffRemoved", { bg = "#352d3d" })
      -- vim.api.nvim_set_hl(0, "DiffDelete", { bg = "#3f2d3d", fg = "#3f3f4f" })
      -- vim.api.nvim_set_hl(0, "diffChanged", { bg = "#272d43" })
      -- vim.api.nvim_set_hl(0, "LspCodeLens", { fg = "#565f89" })
      -- vim.api.nvim_set_hl(0, "LspCodeLensSeparator", { fg = "#565f89" })
      -- vim.api.nvim_set_hl(0, "LspCodeLensSeparator", { fg = "#565f89" })
      -- hl("DiagnosticSignWarn", { bg = "none" })
      -- hl("DiagnosticSignInfo", { link = "TelescopeBorder" })
      hl("FloatBorder", { link = "TelescopeBorder" })
      hl("Title", { link = "TelescopeTitle" })
      hl("FloatTitle", { link = "TelescopeTitle" })
    end,
  },
  {
    "nvim-neo-tree/neo-tree.nvim",
    opts = {
      enable_git_status = false,
      enable_diagnostics = false,
      window = {
        mappings = {
          ["h"] = "close_node",
          ["l"] = "open",
        },
      },
    },
  },
  {
    "nvim-lualine/lualine.nvim",
    lazy = false,
    config = function()
      local icons = require("lazyvim.config").icons
      require("lualine").setup({
        options = {
          globalstatus = true,
          component_separators = { left = "", right = "" },
          section_separators = { left = "", right = "" },
        },
        sections = {
          lualine_a = { "mode" },
          lualine_b = { "branch" },
          lualine_c = {
            {
              "diff",
              symbols = {
                added = icons.git.added,
                modified = icons.git.modified,
                removed = icons.git.removed,
              },
            },
          },
          lualine_x = {
            {
              "diagnostics",
              symbols = {
                error = icons.diagnostics.Error,
                warn = icons.diagnostics.Warn,
                info = icons.diagnostics.Info,
                hint = icons.diagnostics.Hint,
              },
            },
          },
          lualine_y = {
            { "progress", separator = " ", padding = { left = 1, right = 0 } },
            { "location", padding = { left = 0, right = 1 } },
          },
          lualine_z = {
            {
              "tabs",
              use_mode_colors = true,
            },
          },
        },
      })
    end,
  },
  {
    "folke/noice.nvim",
    enabled = false,
  },
  {
    "goolord/alpha-nvim",
    enabled = false,
  },
  {
    "akinsho/bufferline.nvim",
    enabled = false,
  },
  {
    "utilyre/barbecue.nvim",
    name = "barbecue",
    version = "*",
    dependencies = {
      "SmiteshP/nvim-navic",
      "nvim-tree/nvim-web-devicons",
    },
    opts = {
      show_modified = true,
    },
  },
  {
    "j-hui/fidget.nvim",
    opts = {
      window = {
        blend = 0,
      },
    },
  },
  {
    "rcarriga/nvim-notify",
    enabled = false,
    opts = {
      timeout = 2000,
      render = "compact",
      stages = "slide",
    },
  },
}
