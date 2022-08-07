local M = {}
local map = vim.keymap.set
local ts_utils = require "nvim-treesitter.ts_utils"

local function setup()
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
      border = "single",
      focusable = true,
      style = "minimal",
      source = "always",
      header = "",
      prefix = "",
    },
  }

  vim.diagnostic.config(config)
end

local function highlight_references()
  local node = ts_utils.get_node_at_cursor()
  while node ~= nil do
    local node_type = node:type()
    if node_type == "string"
        or node_type == "string_fragment"
        or node_type == "template_string"
        or node_type == "document" -- for inline gql`` strings
    then
      -- who wants to highlight a string? i don't. yuck
      return
    end
    node = node:parent()
  end
  vim.lsp.buf.document_highlight()
end

--- @return fun() @function that calls the provided fn, but with no args
local function w(fn)
  return function()
    return fn()
  end
end

---@param bufnr number
local function buf_autocmd_document_highlight(bufnr)
  local group = vim.api.nvim_create_augroup("lsp_document_highlight", {})
  vim.api.nvim_create_autocmd({ "CursorHold", "CursorHoldI" }, {
    buffer = bufnr,
    group = group,
    callback = highlight_references,
  })
  vim.api.nvim_create_autocmd({ "CursorMoved", "CursorMovedI" }, {
    buffer = bufnr,
    group = group,
    callback = w(vim.lsp.buf.clear_references),
  })
end

---@param bufnr number
local function buf_autocmd_codelens(bufnr)
  local group = vim.api.nvim_create_augroup("lsp_document_codelens", {})
  vim.api.nvim_create_autocmd({ "BufEnter", "InsertLeave", "BufWritePost", "CursorHold" }, {
    buffer = bufnr,
    group = group,
    callback = w(vim.lsp.codelens.refresh),
  })
end

-- Finds and runs the closest codelens (searches upwards only)
local function find_and_run_codelens()
  local bufnr = vim.api.nvim_get_current_buf()
  local row, col = unpack(vim.api.nvim_win_get_cursor(0))
  local lenses = vim.lsp.codelens.get(bufnr)

  lenses = vim.tbl_filter(function(lense)
    return lense.range.start.line < row
  end, lenses)

  if #lenses == 0 then
    return vim.notify "Could not find codelens to run."
  end

  table.sort(lenses, function(a, b)
    return a.range.start.line > b.range.start.line
  end)

  vim.api.nvim_win_set_cursor(0, { lenses[1].range.start.line + 1, lenses[1].range.start.character })
  vim.lsp.codelens.run()
  vim.api.nvim_win_set_cursor(0, { row, col }) -- restore cursor, TODO: also restore position
end

local function get_preview_window()
  for _, win in ipairs(vim.api.nvim_tabpage_list_wins(vim.api.nvim_get_current_tabpage())) do
    if vim.api.nvim_win_get_option(win, "previewwindow") then
      return win
    end
  end
  vim.cmd [[new]]
  local pwin = vim.api.nvim_get_current_win()
  vim.api.nvim_win_set_option(pwin, "previewwindow", true)
  vim.api.nvim_win_set_height(pwin, vim.api.nvim_get_option "previewheight")
  return pwin
end

local function hover()
  local existing_float_win = vim.b.lsp_floating_preview
  if existing_float_win and vim.api.nvim_win_is_valid(existing_float_win) then
    vim.b.lsp_floating_preview = nil
    local preview_buffer = vim.api.nvim_win_get_buf(existing_float_win)
    local pwin = get_preview_window()
    vim.api.nvim_win_set_buf(pwin, preview_buffer)
    vim.api.nvim_win_close(existing_float_win, true)
  else
    vim.lsp.buf.hover()
  end
end


local function lsp_keymaps(client, bufnr)
  local opts = { noremap = true, silent = true, buffer = bufnr }

  map("n", "K", hover, opts)
  map("n", "<leader>la", vim.lsp.buf.code_action, opts)
  map("v", "<leader>la", vim.lsp.buf.range_code_action, opts)
  map("n", "<leader>a", vim.lsp.buf.code_action, opts)
  map("v", "<leader>a", vim.lsp.buf.range_code_action, opts)
  map("n", "<leader>c", find_and_run_codelens, opts)

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
end

M.on_attach = function(client, bufnr)
  if client.name == "tsserver" or client.name == "hls" then
    client.resolved_capabilities.document_formatting = false
    client.resolved_capabilities.document_range_formatting = false
  end

  setup()
  lsp_keymaps(client, bufnr)

  vim.api.nvim_buf_set_option(bufnr, "omnifunc", "v:lua.vim.lsp.omnifunc")

  if client.config.flags then
    client.config.flags.allow_incremental_sync = true
  end

  if client.supports_method "textDocument/documentHighlight" then
    buf_autocmd_document_highlight(bufnr)
  end

  if client.supports_method "textDocument/codeLens" then
    buf_autocmd_codelens(bufnr)
    vim.schedule(vim.lsp.codelens.refresh)
  end
end

local capabilities = vim.lsp.protocol.make_client_capabilities()

local status_ok, cmp_nvim_lsp = pcall(require, "cmp_nvim_lsp")
if not status_ok then
  return
end

M.capabilities = cmp_nvim_lsp.update_capabilities(capabilities)

return M
