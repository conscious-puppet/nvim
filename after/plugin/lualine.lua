local lualine_status_ok, lualine = pcall(require, "lualine")

if not lualine_status_ok then
  return
end

lualine.setup {
  options = {
    component_separators = { left = '', right = '' },
    section_separators = { left = '', right = '' },
  },
  tabline = {
    lualine_a = { 'buffers' },
    lualine_b = {},
    lualine_c = {},
    lualine_x = {},
    lualine_y = {},
    lualine_z = { 'tabs' }
  },
}
