local M = {}
local map = vim.keymap.set

M.setup = function()
  local signs = {
    { name = "DiagnosticSignError", text = "" },
    { name = "DiagnosticSignWarn", text = "" },
    { name = "DiagnosticSignHint", text = "" },
    { name = "DiagnosticSignInfo", text = "" },
  }

  for _, sign in ipairs(signs) do
    vim.fn.sign_define(sign.name, { texthl = sign.name, text = sign.text, numhl = "" })
  end

  local config = {
    signs = {
      active = signs
    },
    update_in_insert = false,
    underline = true,
    severity_sort = true,
    virtual_text = false,
    float = {
      border = "none",
      focusable = true,
      style = "minimal",
      source = "always",
      header = "",
      prefix = "",
    },
  }

  vim.diagnostic.config(config)


  -- vim.lsp.handlers["textDocument/hover"] = vim.lsp.with(vim.lsp.handlers.hover, { border = "none" })
  -- vim.lsp.handlers["textDocument/signatureHelp"] = vim.lsp.with(vim.lsp.handlers.signature_help, { border = "none" })
  vim.lsp.handlers['textDocument/hover'] = vim.lsp.with(
    vim.lsp.handlers.hover, {
    border = "single"
  })
  vim.lsp.handlers['textDocument/signatureHelp'] = vim.lsp.with(
    vim.lsp.handlers.signatureHelp, {
    border = "single"
  })
  vim.diagnostic.config({ float = { border = "single" } })
end

local function lsp_highlight_document(client)
  -- Set autocommands conditional on server_capabilities
  if client.resolved_capabilities.document_highlight then
    vim.api.nvim_exec(
      [[
      augroup lsp_document_highlight
        autocmd! * <buffer>
        autocmd CursorHold <buffer> lua vim.lsp.buf.document_highlight()
        autocmd CursorMoved <buffer> lua vim.lsp.buf.clear_references()
      augroup END

      " augroup lsp_format_document_on_save
      "   autocmd! * <buffer>
      "   autocmd BufWritePre * lua vim.lsp.buf.formatting_sync()
      " augroup END
    ]] ,
      false
    )
  end
end

local function lsp_keymaps(client, bufnr)
  local opts = { noremap = true, silent = true, buffer = bufnr }

  map("n", "K", vim.lsp.buf.hover, opts)
  map("n", "<leader>la", vim.lsp.buf.code_action, opts)
  map("v", "<leader>la", vim.lsp.buf.range_code_action, opts)
  map("n", "<leader>a", vim.lsp.buf.code_action, opts)
  map("v", "<leader>a", vim.lsp.buf.range_code_action, opts)

  if client.name ~= "hls" then
    map("n", "<leader>lf", vim.lsp.buf.formatting_sync, opts)
    map("v", "<leader>lf", vim.lsp.buf.range_formatting, opts)
    map("n", "Q", vim.lsp.buf.formatting_sync, opts)
    map("v", "Q", vim.lsp.buf.range_formatting, opts)
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
  -- vim.api.nvim_buf_create_user_command(bufnr, "Format", vim.lsp.buf.formatting, { desc = "Format file with LSP" })
end

M.on_attach = function(client, bufnr)
  if client.name == "tsserver" or client.name == "hls" then
    client.resolved_capabilities.document_formatting = false
    client.resolved_capabilities.document_range_formatting = false
  end
  lsp_keymaps(client, bufnr)
  lsp_highlight_document(client)
end

local capabilities = vim.lsp.protocol.make_client_capabilities()

local status_ok, cmp_nvim_lsp = pcall(require, "cmp_nvim_lsp")
if not status_ok then
  return
end



M.capabilities = cmp_nvim_lsp.update_capabilities(capabilities)

return M
