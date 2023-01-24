local status_ok, lualine = pcall(require, "lualine")

if true then
  return
end

if not status_ok then
  return
end

local theme = require("abshekh.themes")

lualine.setup {
  options = {
    theme = theme.colors,
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
      { 'FugitiveHead',
        -- icon = 'שׂ',
        icon = "#",
        color = {
          fg = theme.fugitive_branch_fg,
          bg = theme.fugitive_branch_bg
        },
      },
      {
        'diff',
        colored = true,
        diff_color = {
          added    = { fg = theme.diff_added_fg },
          modified = { fg = theme.diff_modified_fg },
          removed  = { fg = theme.diff_removed_fg },
        },
        symbols = { added = ' ', modified = '柳', removed = ' ' },
      },
    },
    lualine_x = {
      {
        'diagnostics',
        symbols = { error = ' ', warn = ' ', info = ' ', hint = 'ﴞ ' },
        -- symbols = { error = ' ', warn = ' ', info = ' ', hint = ' ' },
        -- symbols = { error = ' ', warn = ' ', info = ' ' },
      },
      'encoding',
      'filetype',
    },
    lualine_y = {},
    lualine_z = {
      {
        'tabs',
        tabs_color = {
          active = theme.active_tab_color,
          inactive = theme.inactive_tab_color,
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
        },
        color = {
          fg = "none",
          bg = "none",
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
        },
        color = {
          fg = "none",
          bg = "none",
        }
      },
    },
    lualine_x = {},
    lualine_y = {},
    lualine_z = {}
  },
}
