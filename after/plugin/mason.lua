local status_ok_mason, mason = pcall(require, "mason")
local status_ok_mason_lsp_config, mason_lsp_config = pcall(require, "mason-lspconfig")

if not status_ok_mason or not status_ok_mason_lsp_config then
  return
end

mason.setup {
  ui = {
    border = "single",
  }
}

mason_lsp_config.setup {
  ensure_installed = { "sumneko_lua" }
}

mason_lsp_config.setup_handlers {
    function (server_name) -- default handler (optional)
        require("lspconfig")[server_name].setup {}
    end,

            ["sumneko_lua"] = function ()
                require("lspconfig").sumneko_lua.setup {

	settings = {

		Lua = {
			diagnostics = {
				globals = { "vim" },
			},
			workspace = {
				library = {
					[vim.fn.expand("$VIMRUNTIME/lua")] = true,
					[vim.fn.stdpath("config") .. "/lua"] = true,
				},
			},
		},
	},
                }
            end,
}

