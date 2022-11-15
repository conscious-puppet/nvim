local _, rust_tools = pcall(require, "rust-tools")

local opts = {
  tools = {
    inlay_hints = {
      auto = false,
      only_current_line = false,
      show_parameter_hints = false,
    },
    hover_actions = {
      border = {
        { "╭", "FloatBorder" },
        { "─", "FloatBorder" },
        { "╮", "FloatBorder" },
        { "│", "FloatBorder" },
        { "╯", "FloatBorder" },
        { "─", "FloatBorder" },
        { "╰", "FloatBorder" },
        { "│", "FloatBorder" },
      },
      -- whether the hover action window gets automatically focused
      -- default: false
      auto_focus = false,
    },
  },
  server = {
    on_attach = require("abshekh.lsp.handlers").on_attach,
    capabilities = require("abshekh.lsp.handlers").capabilities,
  }

}

rust_tools.setup(opts)
