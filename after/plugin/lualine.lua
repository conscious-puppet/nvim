local status_ok, lualine = pcall(require, "lualine")

if not status_ok then
  return
end

local theme = vim.g.colors_name
local active_buffers_color = "lualine_a_normal"
local inactive_buffers_color = "lualine_a_active"

if theme == "moonfly" then
  theme = require 'lualine.themes.moonfly'
  theme.normal.c.bg = '#080808'
elseif theme == "tokyonight" then
  theme = require 'lualine.themes.tokyonight'
  theme.inactive.c.fg = '#545c7e'
  active_buffers_color = "lualine_a_normal"
  inactive_buffers_color = "lualine_c_inactive"
elseif theme == "onedark" then
  theme = require 'lualine.themes.onedark'
  theme.normal.a.gui = nil
  theme.insert.a.gui = nil
  theme.visual.a.gui = nil
  theme.command.a.gui = nil
  theme.terminal.a.gui = nil
  theme.replace.a.gui = nil
  theme.inactive.a.gui = nil
  theme.normal.c.fg = '#798294'
  theme.normal.c.bg = '#21252b'
  active_buffers_color = "lualine_a_insert"
  inactive_buffers_color = "lualine_c_normal"
end


lualine.setup {
  options = {
    theme = theme,
    section_separators = '',
    component_separators = '',
  },
  sections = {
    -- lualine_a = { 'mode' },
    lualine_a = {},
    lualine_b = {
      -- 'branch', 
    },
    lualine_c = {
      { 'branch', icon = 'שׂ',
        color = {
          fg = theme.normal.a.fg,
          bg = theme.normal.a.bg,
        }
      },
      {
        'diff',
        colored = true,
        diff_color = {
          added    = { fg = '#1abc9c' },
          modified = { fg = '#0db9d7' },
          removed  = { fg = '#db4b4b' },
        },
        symbols = { added = ' ', modified = '柳', removed = ' ' },
      },
      {
        'diagnostics',
        symbols = { error = ' ', warn = ' ', info = ' ', hint = 'ﴞ ' },
        -- symbols = { error = ' ', warn = ' ', info = ' ', hint = ' ' },
        -- symbols = { error = ' ', warn = ' ', info = ' ' },
      },
    },
    lualine_x = {
      'encoding',
      'filetype',
    },
    lualine_y = {},
    lualine_z = {
      {
        'tabs',
        tabs_color = {
          active = active_buffers_color,
          inactive = inactive_buffers_color,
        },
      }
    }
  },
  winbar = {
    lualine_a = {},
    lualine_b = {},
    lualine_c = {
      {
        'filename',
        file_status = true,
        path = 1,
        shorting_target = 40,
        symbols = {
          modified = '',
          readonly = '',
          unnamed = '[No Name]',
        }
      },
    },
    lualine_x = {},
    lualine_y = {},
    lualine_z = {}
  },
  inactive_winbar = {
    lualine_a = {},
    lualine_b = {},
    lualine_c = {
      {
        'filename',
        file_status = true,
        path = 1,
        shorting_target = 40,
        symbols = {
          modified = '',
          readonly = '',
          unnamed = '[No Name]',
        }
      },
    },
    lualine_x = {},
    lualine_y = {},
    lualine_z = {}
  },
}
