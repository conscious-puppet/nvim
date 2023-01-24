local status_ok, flutter_tools = pcall(require, "flutter-tools")
if not status_ok then
  return
end

flutter_tools.setup {
  debugger = {
    enabled = true,
    run_via_dap = true,
  },
  outline = { auto_open = false },
  decorations = {
    statusline = { device = true, app_version = true },
  },
  widget_guides = { enabled = true, debug = true },
  dev_log = { enabled = false, open_cmd = "tabedit" },
  lsp = {
    color = {
      enabled = true,
      background = true,
      virtual_text = false,
    },
    settings = {
      showTodos = true,
      renameFilesWithClasses = "prompt",
    },
    on_attach = require("abshekh.lsp.handlers").on_attach,
    capabilities = require("abshekh.lsp.handlers").capabilities,
  },
}
