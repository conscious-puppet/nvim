local lualine_status_ok, lualine = pcall(require, "lualine")

if not lualine_status_ok then
  return
end

lualine.setup {
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
      },
    },
    lualine_x = {
      {
        "diagnostics",
      },
    },
    lualine_y = {
      { "progress", separator = " ",                  padding = { left = 1, right = 0 } },
      { "location", padding = { left = 0, right = 1 } },
    },
    lualine_z = {
      {
        "tabs",
        use_mode_colors = true,
      },
    },
  },
}
