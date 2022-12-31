local M = {}
local tokyonight_status, tokyonight = pcall(require, "tokyonight")
if not tokyonight_status then
  return M
end

M.set = function()
  tokyonight.setup({
    style = "storm", -- The theme comes in three styles, `storm`, `moon`, a darker variant `night` and `day`
    transparent = true,
    styles = {
      sidebars = "transparent", -- style for sidebars, see below
      floats = "transparent", -- style for floating windows
    },
  })

  vim.cmd.colorscheme("tokyonight")

  -- override highlight
  vim.api.nvim_set_hl(0, "diffAdded", { bg = "#283b4d" })
  vim.api.nvim_set_hl(0, "diffRemoved", { bg = "#352d3d" })
  vim.api.nvim_set_hl(0, "DiffDelete", { bg = "#3f2d3d", fg = "#3f3f4f" })
  vim.api.nvim_set_hl(0, "diffChanged", { bg = "#272d43" })
  vim.api.nvim_set_hl(0, "LspCodeLens", { fg = "#565f89" })
  vim.api.nvim_set_hl(0, "LspCodeLensSeparator", { fg = "#565f89" })

  vim.g.border_style = "single"
end

local function transparenct_sections(theme)
  for k, _ in pairs(theme) do
    if k == "normal" then
      theme[k].b.bg = nil
      theme[k].b.fg = "#a9b1d6"
      theme[k].c.bg = nil
      theme[k].c.fg = "#a9b1d6"
    elseif k == "insert"
        or k == "visual"
        or k == "command"
        or k == "replace" then
      theme[k].a.bg = nil
      theme[k].a.fg = "#a9b1d6"
      theme[k].b.bg = nil
      theme[k].b.fg = "#a9b1d6"
    elseif k == "inactive" then
      theme[k].a.bg = nil
      theme[k].a.fg = '#545c7e'
      theme[k].b.bg = nil
      theme[k].b.fg = '#545c7e'
      theme[k].c.bg = nil
      theme[k].c.fg = '#545c7e'
    end
  end
  return theme
end

local lualine_present, lualine_theme = pcall(require, "lualine.themes.tokyonight")
if lualine_present then
  lualine_theme.inactive.c.fg = '#545c7e'
  lualine_theme               = transparenct_sections(lualine_theme) -- for transparency
  M.colors                    = lualine_theme
  M.active_tab_color          = "lualine_a_normal"
  M.inactive_tab_color        = "lualine_c_inactive"
  M.fugitive_branch_bg        = lualine_theme.normal.c.bg
  M.fugitive_branch_fg        = lualine_theme.normal.c.fg
  M.diff_added_fg             = '#1abc9c'
  M.diff_modified_fg          = '#0db9d7'
  M.diff_removed_fg           = '#db4b4b'
end

return M
