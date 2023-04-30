-- return {}
return {
  {
    "neovim/nvim-lspconfig",
    opts = {
      -- setup = {
      --   ["*"] = function(server, opts) end,
      -- },
      -- servers = {
      --   hls = {},
      -- },
      diagnostics = {
        signs = false,
      },
      init = function()
        local keys = require("lazyvim.plugins.lsp.keymaps").get()
        -- require("lazyvim.util").on_attach(function(client, buffer)
        --   require("lazyvim.plugins.lsp.format").on_attach(client, buffer)
        --   require("lazyvim.plugins.lsp.keymaps").on_attach(client, buffer)
        --   if client.supports_method("textDocument/formatting") then
        --     keys[#keys + 1] = { "Q", vim.lsp.buf.format, mode = { "n", "v" } }
        --   end
        -- end)
      end,
    },
  },
  {
    "glepnir/lspsaga.nvim",
    branch = "main",
    enabled = false,
    opts = {
      lightbulb = {
        enable = false,
      },
    },
    keys = {
      { "<leader>ca", "<cmd>Lspsaga code_action<CR>", desc = "Code Action" },
      { "<leader>ca", "<cmd>Lspsaga code_action<CR>", mode = "v", desc = "Code Action" },
      { "gh", "<cmd>Lspsaga lsp_finder<CR>", desc = "Lsp Finder" },
      { "gd", "<cmd>Lspsaga goto_definition<CR>", desc = "Go to definition" },
      { "<leader>o", "<cmd>Lspsaga outline<CR>", desc = "Lsp Outline" },
      { "<Leader>ci", "<cmd>Lspsaga incoming_calls<CR>", desc = "Incoming Calls" },
      { "<Leader>co", "<cmd>Lspsaga outgoing_calls<CR>", desc = "Outgoing Calls" },
    },
  },
  {
    "hrsh7th/nvim-cmp",
    opts = function(_, opts)
      local cmp = require("cmp")
      opts.mapping = {
        ["<C-k>"] = cmp.mapping.select_prev_item({ behavior = cmp.SelectBehavior.Select }),
        ["<C-j>"] = cmp.mapping.select_next_item({ behavior = cmp.SelectBehavior.Select }),
        ["<C-p>"] = cmp.mapping.select_prev_item({ behavior = cmp.SelectBehavior.Select }),
        ["<C-n>"] = cmp.mapping.select_next_item({ behavior = cmp.SelectBehavior.Select }),
        ["<C-h>"] = cmp.mapping.scroll_docs(-4),
        ["<C-l>"] = cmp.mapping.scroll_docs(4),
        ["<C-Space>"] = cmp.mapping.complete(),
        ["<C-e>"] = cmp.mapping.abort(),
        -- Accept currently selected item. If none selected, `select` first item.
        -- Set `select` to `false` to only confirm explicitly selected items.
        ["<CR>"] = cmp.mapping.confirm({ select = false }),
        -- ["<leader>"] = cmp.mapping.confirm { select = false },
      }
      return opts
    end,
  },
  {
    "folke/trouble.nvim",
    keys = {
      { "<leader>d", "<cmd>Trouble document_diagnostics<cr>", desc = "Document Diagnostics" },
      { "<leader>D", "<cmd>Trouble workspace_diagnostics<cr>", desc = "Workspace Diagnostics" },
    },
  },
  {
    "nvim-treesitter/nvim-treesitter",
    opts = {
      highlight = { enable = true },
      indent = { enable = true },
      context_commentstring = { enable = true, enable_autocmd = false },
      ensure_installed = {
        "haskell",
      },
    },
  },
  {
    "jose-elias-alvarez/null-ls.nvim",
    enabled = false,
  },
}
