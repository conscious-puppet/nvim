local g = vim.g
g.moonflyCursorColor = 1
g.moonflyNormalFloat = 1
g.moonflyUndercurls = 1
g.moonflyWinSeparator = 2

vim.cmd [[ colorscheme moonfly ]]

-- Lualine
local lua_line_status_ok, lualine = pcall(require, 'lualine')

if lua_line_status_ok then
  local custom_moonfly = require 'lualine.themes.moonfly'
  custom_moonfly.normal.c.bg = '#080808'

  lualine.setup {
    options = {
      theme = custom_moonfly,
      section_separators = '',
      component_separators = '',
    },
    sections = {
      -- lualine_a = {
      --   {
      --     'branch',
      --     color = 'lualine_a_normal',
      --   },
      -- },
      lualine_a = {},
      lualine_b = {},
      lualine_c = {
        'branch', 'diff', 'diagnostics',
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
          -- max_length = vim.o.columns * 2 / 3,
          max_length = vim.o.columns,
          filetype_names = {
            TelescopePrompt = 'Telescope',
            dashboard = 'Dashboard',
            packer = 'Packer',
            fzf = 'FZF',
            alpha = 'Alpha',
            NvimTree = '',
          },

          buffers_color = {
            active = 'lualine_a_normal',
            inactive = 'lualine_a_inactive',
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


-- indent-blanklines
local indent_blankline_status_ok, indent_blankline = pcall(require, 'indent_blankline')
if indent_blankline_status_ok then

  vim.cmd [[highlight IndentBlanklineContextChar guifg=#878787 gui=nocombine]]

  indent_blankline.setup {
    show_end_of_line = true,
    show_current_context = true,
    show_current_context_start = true,
  }
end

-- cmp
local cmp_status_ok, cmp = pcall(require, "cmp")
if cmp_status_ok then
  local winhighlight = {
    winhighlight = "Normal:NormalFloat,FloatBorder:FloatBorder,CursorLine:PmenuSel",
  }

  cmp.setup {
    window = {
      completion = cmp.config.window.bordered(winhighlight),
      documentation = cmp.config.window.bordered(winhighlight),
    },
  }
end

-- lsp

vim.lsp.handlers['textDocument/hover'] = vim.lsp.with(
  vim.lsp.handlers.hover, {
  border = "single"
})

vim.lsp.handlers['textDocument/signatureHelp'] = vim.lsp.with(
  vim.lsp.handlers.signatureHelp, {
  border = "single"
})

-- local win = require("lspconfig.ui.windows")
-- local _default_opts = win.default_opts
--
-- win.default_opts = function (options)
--   local opts = _default_opts(options)
--   opts.border = "single"
--   return opts
-- end
