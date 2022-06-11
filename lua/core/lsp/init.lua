local status_ok, _ = pcall(require, "lspconfig")

if not status_ok then
  return
end

require("core.lsp.lsp-installer")
require("core.lsp.handlers").setup()

vim.lsp.handlers["textDocument/hover"] = vim.lsp.with(vim.lsp.handlers.hover, { border = "none" })
vim.lsp.handlers["textDocument/signatureHelp"] = vim.lsp.with(vim.lsp.handlers.signature_help, { border = "none" })
