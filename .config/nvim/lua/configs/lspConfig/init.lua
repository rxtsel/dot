local status_ok, _ = pcall(require, "lspconfig")
if not status_ok then
  return
end

require("configs.lspConfig.lspInstaller")
require("configs.lspConfig.handlers").setup()
