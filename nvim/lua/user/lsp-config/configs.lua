local status_ok, lsp_installer = pcall(require, "nvim-lsp-installer")
if not status_ok then
	return
end

local prefix = "user.lsp-config"
local lspconfig = require("lspconfig")

local servers = { "jsonls", "clangd", "pyright", "ltex", "tsserver", "grammarly" }
lsp_installer.setup({ ensure_installed = servers })

lspconfig.arduino_language_server.setup {
  "arduino-language-server",
  "-fqbn", "arduino:uvr:uno",
  "-cli", "/usr/bin/arduino-cli",
  "-clangd", "/usr/bin/clangd"
}

for _, server in pairs(servers) do
  local opts = {
    on_attach = require(prefix .. ".handlers").on_attach,
    capabilities = require(prefix .. ".handlers").capabilities,
  }
  local has_custom_opts, server_custom_opts = pcall(require, prefix .. ".settings." .. server)
  if has_custom_opts then
    opts = vim.tbl_deep_extend("force", opts, server_custom_opts)
  end
  lspconfig[server].setup(opts)
end
