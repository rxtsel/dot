-- Si no está bien configurado el LSP Installer se retorna la configuración
local status_ok, lsp_installer = pcall(require, "nvim-lsp-installer")
if not status_ok then
	return
end

-- Configuraciones de LSP Installer
lsp_installer.on_server_ready(function(server)
	local opts = {
		on_attach = require("configs.lspConfig.handlers").on_attach,
		capabilities = require("configs.lspConfig.handlers").capabilities,
	}

	 if server.name == "jsonls" then
	 	local jsonls_opts = require("configs.lspConfig.settings.jsonls")
	 	opts = vim.tbl_deep_extend("force", jsonls_opts, opts)
	 end

	 if server.name == "sumneko_lua" then
	 	local sumneko_opts = require("configs.lspConfig.settings.sumneko_lua")
	 	opts = vim.tbl_deep_extend("force", sumneko_opts, opts)
	 end

	 if server.name == "emmet_ls" then
	 	local emmet_opts = require("configs.lspConfig.settings.emmet")
	 	opts = vim.tbl_deep_extend("force", emmet_opts, opts)
	 end

	server:setup(opts)
end)

-- Instalar lenguajes automáticamente
local servers = {
  "cssls",
  "emmet_ls",
  "sumneko_lua",
  "tsserver",
  "jsonls",
}

for _, name in pairs(servers) do
  local server_is_found, server = lsp_installer.get_server(name)
  if server_is_found and not server:is_installed() then
    print("Installing " .. name)
    server:install()
  end
end
