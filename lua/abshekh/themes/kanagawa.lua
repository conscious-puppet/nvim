local M = {}

M.set = function()

  vim.cmd.colorscheme("kanagawa")

  -- override highlight
  vim.api.nvim_set_hl(0, "diffAdded", { bg = "#283b4d" })
  vim.api.nvim_set_hl(0, "diffRemoved", { bg = "#352d3d" })
  vim.api.nvim_set_hl(0, "DiffDelete", { bg = "#3f2d3d", fg = "#3f3f4f" })
  vim.api.nvim_set_hl(0, "diffChanged", { bg = "#272d43" })
  vim.api.nvim_set_hl(0, "LspCodeLens", { fg = "#565f89" })
  vim.api.nvim_set_hl(0, "LspCodeLensSeparator", { fg = "#565f89" })

  vim.g.border_style = "single"
end


return M
