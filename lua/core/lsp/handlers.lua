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

local function create_context_menu(bufnr)

  local telescope_status_ok, _ = pcall(require, "telescope")
  if not telescope_status_ok then
    return
  end

  local actions = require "telescope.actions"
  local action_state = require "telescope.actions.state"
  local pickers = require "telescope.pickers"
  local finders = require "telescope.finders"
  local sorters = require "telescope.sorters"

  local mini_cursor = {
    borderchars = {
      preview = { "─", "│", "─", "│", "╭", "╮", "╯", "╰" },
      prompt = { "─", "│", " ", "│", "╭", "╮", "│", "│" },
      results = { "─", "│", "─", "│", "├", "┤", "╯", "╰" }
    },
    layout_config = {
      height = 9,
      width = 0.3
    },
    layout_strategy = "cursor",
    results_title = false,
    prompt_title = false,
    sorting_strategy = "ascending",
    theme = "cursor"
  }

  local function enter(prompt_bufnr)
    local selected = action_state.get_selected_entry()
    print(vim.inspect(selected))
    actions.close(prompt_bufnr)
  end

  local opts = {
    finder = finders.new_table { "gruvbox", "deus", "tokyonight" },
    sorter = sorters.get_generic_fuzzy_sorter({}),
    attach_mappings = function(prompt_bufnr, map)
      map("i", "<CR>", enter)
      map("n", "<CR>", enter)
      return true
    end,
  }

  local colors = pickers.new(mini_cursor, opts)

  -- map("n", "<leader>r",
  --   function()
  --     colors:find()
  --   end, { noremap = true, silent = true, buffer = bufnr })
end

local function lsp_keymaps(bufnr)
  local opts = { noremap = true, silent = true, buffer = bufnr }

  map("n", "K", vim.lsp.buf.hover, opts)
  map("n", "<leader>la", vim.lsp.buf.code_action, opts)
  map("v", "<leader>la", vim.lsp.buf.range_code_action, opts)
  map("n", "<leader>lf", vim.lsp.buf.formatting_sync, opts)
  map("v", "<leader>lf", vim.lsp.buf.range_formatting, opts)
  map("n", "Q", vim.lsp.buf.formatting_sync, opts)
  map("v", "Q", vim.lsp.buf.range_formatting, opts)
  map("n", "<leader>lh", vim.lsp.buf.signature_help, opts)
  map("n", "<leader>lr", vim.lsp.buf.rename, opts)
  map("n", "gD", vim.lsp.buf.declaration, opts)
  map("n", "gi", vim.lsp.buf.implementation, opts)
  map("n", "gd", vim.lsp.buf.definition, opts)
  map("n", "gr", vim.lsp.buf.references, opts)
  map("n", "gl", vim.diagnostic.open_float, opts)
  map("n", "[d", vim.diagnostic.goto_prev, opts)
  map("n", "]d", vim.diagnostic.goto_next, opts)
  vim.api.nvim_buf_create_user_command(bufnr, "Format", vim.lsp.buf.formatting, { desc = "Format file with LSP" })
  create_context_menu(bufnr)
end

M.on_attach = function(client, bufnr)
  if client.name == "tsserver" or client.name == "hls" then
    client.resolved_capabilities.document_formatting = false
  end
  lsp_keymaps(bufnr)
  lsp_highlight_document(client)
end

local capabilities = vim.lsp.protocol.make_client_capabilities()

local status_ok, cmp_nvim_lsp = pcall(require, "cmp_nvim_lsp")
if not status_ok then
  return
end



M.capabilities = cmp_nvim_lsp.update_capabilities(capabilities)

return M
