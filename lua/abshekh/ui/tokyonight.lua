local g = vim.g
g.tokyonight_style = "storm"
vim.cmd [[colorscheme tokyonight]]

-- Lualine
local lua_line_status_ok, lualine = pcall(require, 'lualine')

if lua_line_status_ok then
  local custom_tokyonight = require 'lualine.themes.tokyonight'
  custom_tokyonight.inactive.c.fg = '#545c7e'
  -- print(vim.inspect(custom_tokyonight))
  lualine.setup {
    options = {
      theme = custom_tokyonight,
      section_separators = '',
      component_separators = '',
    },
    sections = {
      lualine_a = { 'mode' },
      lualine_b = {
        -- 'branch', 
        { 'branch', icon = '', },
        {
          'diff',
          colored = true,
          -- diff_color = {
          --   added    = 'DiagnosticHint',
          --   modified = 'DiagnosticInfo',
          --   removed  = 'DiagnosticError',
          -- },
          diff_color = {
            added    = { fg = '#1abc9c' },
            modified = { fg = '#0db9d7' },
            removed  = { fg = '#db4b4b' },
          },
          symbols = { added = ' ', modified = '柳', removed = ' ' },
        },
      },
      lualine_c = {
        {
          'filename',
          file_status = true,
          path = 1,
          shorting_target = 40,
          symbols = {
            modified = '[+]',
            readonly = '[-]',
            unnamed = '[No Name]',
          }
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
        -- 'fileformat',
        'filetype',
        'progress',
        'location'
      },
      lualine_y = {},
      lualine_z = {}
    },

    tabline = {
      lualine_a = {
        {
          'buffers',
          show_filename_only = true,
          hide_filename_extension = false,
          show_modified_status = true,
          mode = 0,
          max_length = vim.o.columns * 9 / 10,
          -- max_length = vim.o.columns,
          filetype_names = {
            TelescopePrompt = 'Telescope',
            dashboard = 'Dashboard',
            packer = 'Packer',
            fzf = 'FZF',
            alpha = 'Alpha',
            NvimTree = 'NvimTree',
          },

          buffers_color = {
            active = 'lualine_a_normal',
            inactive = 'lualine_c_inactive',
          },

          symbols = {
            modified = ' ●',
            alternate_file = '',
            directory = '',
          },
        }
      },

      lualine_b = {},
      lualine_c = {},
      lualine_x = {},
      lualine_y = {},
      lualine_z = { 'tabs' }
    },
  }
end

print(vim.inspect(lualine.get_config))

-- indent-blanklines
local indent_blankline_status_ok, indent_blankline = pcall(require, 'indent_blankline')
if indent_blankline_status_ok then

  indent_blankline.setup {
    show_end_of_line = true,
    show_current_context = true,
    show_current_context_start = true,
  }
end


-- cmp
local cmp_status_ok, cmp = pcall(require, "cmp")
if cmp_status_ok then
  cmp.setup {
    window = {
      documentation = cmp.config.window.bordered(),
    },
  }
end

-- lsp

vim.lsp.handlers["textDocument/hover"] = vim.lsp.with(vim.lsp.handlers.hover, { border = "single" })
vim.lsp.handlers["textDocument/signatureHelp"] = vim.lsp.with(vim.lsp.handlers.signature_help, { border = "single" })
vim.diagnostic.config({ float = { border = "single" } })

-- telescope

-- local telescope_status_ok, telescope = pcall(require, "telescope")
-- if telescope_status_ok then
--   telescope.setup {
--     defaults = {
--       borderchars = { "", "", "", "", "", "", "", "" },
--     }
--   }
-- end
