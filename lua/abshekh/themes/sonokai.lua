local M = {}

M.set = function()
  vim.cmd.colorscheme("sonokai")

  -- -- override highlight
  -- vim.api.nvim_set_hl(0, "diffAdded", { bg = "#283b4d" })
  -- vim.api.nvim_set_hl(0, "diffRemoved", { bg = "#352d3d" })
  -- vim.api.nvim_set_hl(0, "DiffDelete", { bg = "#3f2d3d", fg="#3f3f4f" })
  -- vim.api.nvim_set_hl(0, "diffChanged", { bg = "#272d43" })
  vim.api.nvim_set_hl(0, "LspCodeLens", { fg = "#565f89" })
  vim.api.nvim_set_hl(0, "LspCodeLensSeparator", { fg = "#565f89" })

  vim.api.nvim_set_hl(0, "NormalFloat", { bg = "none" })
  vim.api.nvim_set_hl(0, "FloatBorder", { bg = "none", fg = "#7f8490" })
  vim.api.nvim_set_hl(0, "LspInfoBorder", { bg = "none", fg = "#7f8490" })
  vim.api.nvim_set_hl(0, "NullLsInfoBorder", { bg = "none", fg = "#7f8490" })
  vim.api.nvim_set_hl(0, "NvimTreeNormal", { bg = "none" })
  vim.api.nvim_set_hl(0, "NvimTreeEndOfBuffer", { bg = "none", fg="none" })

    -- NvimTreeNormal = { fg = c.fg_sidebar, bg = c.bg_sidebar },
  vim.g.border_style = "rounded"
end

local lualine_present, lualine_theme = pcall(require, "lualine.themes.sonokai")
if lualine_present then
  M.colors             = lualine_theme
  M.fugitive_branch_bg = lualine_theme.normal.c.bg
  M.fugitive_branch_fg = lualine_theme.normal.c.fg
  M.active_tab_color   = "lualine_a_normal"
  M.inactive_tab_color = "lualine_c_normal"
  M.diff_added_fg      = '#9ed072'
  M.diff_modified_fg   = '#76cce0'
  M.diff_removed_fg    = '#fc5d7c'
end

return M
