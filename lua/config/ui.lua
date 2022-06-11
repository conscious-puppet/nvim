-- Colorscheme
-- vim.cmd "colorscheme skull"

-- local colorscheme = "tokyonight"


-- local status_ok, _ = pcall(vim.cmd, "colorscheme " .. colorscheme)
-- if not status_ok then
--    vim.notify("colorscheme " .. colorscheme .. " not found!")
--    return
-- end


-- vim.g.tokyonight_style = "storm"

-- vim.cmd[[colorscheme koehler]]
-- vim.cmd[[colorscheme tokyonight]]
vim.cmd [[ colorscheme terafox ]]

-- Lualine
local lua_line_status_ok, lualine = pcall(require, 'lualine')
if lua_line_status_ok then
  lualine.setup {
    options = {
      -- theme = 'tokyonight',
      -- section_separators = { left = '', right = '' },
      -- component_separators = { left = '', right = '' }
      section_separators = '',
      component_separators = '',
    },
  }
end

-- Barbar bufferline
local bufferline_status_ok, bufferline = pcall(require, 'bufferline')
if bufferline_status_ok then
  bufferline.setup {
    closable = false,
    clickable = true,
    icons = false,
    icon_separator_active = '▎',
    icon_separator_inactive = '▎',
    icon_close_tab = '',
    icon_close_tab_modified = '●',
    icon_pinned = '車',
  }
end
