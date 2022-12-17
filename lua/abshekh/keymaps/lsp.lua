local map = vim.keymap.set
local M = {}

M.lsp_keymaps = function (client, bufnr)
  local opts = { noremap = true, silent = true, buffer = bufnr }

  map({ "n", "v" }, "<leader>k", vim.lsp.buf.hover, opts)
  map({ "n", "v" }, "<leader>la", vim.lsp.buf.code_action, opts)
  map({ "n", "v" }, "<leader>a", vim.lsp.buf.code_action, opts)
  -- map("n", "<leader>c", find_and_run_codelens, opts)
  map("n", "<leader>c", vim.lsp.codelens.run, opts)

  -- print(vim.inspect(client))

  if client.supports_method "textDocument/formatting" then
    map({ "n", "v" }, "<leader>lf", vim.lsp.buf.format, opts)
    map({ "n", "v" }, "Q", vim.lsp.buf.format, opts)
  end

  map("n", "<leader>lh", vim.lsp.buf.signature_help, opts)
  map("n", "<leader>lr", vim.lsp.buf.rename, opts)
  map("n", "<leader>r", vim.lsp.buf.rename, opts)
  map("n", "gD", vim.lsp.buf.declaration, opts)
  map("n", "gi", vim.lsp.buf.implementation, opts)
  map("n", "gd", vim.lsp.buf.definition, opts)
  map("n", "gr", vim.lsp.buf.references, opts)
  map("n", "gl", vim.diagnostic.open_float, opts)
  map("n", "[d", vim.diagnostic.goto_prev, opts)
  map("n", "]d", vim.diagnostic.goto_next, opts)
end

return M
