local capabilities = vim.lsp.protocol.make_client_capabilities()
capabilities = require('cmp_nvim_lsp').update_capabilities(capabilities)

local lspconfig = require('lspconfig')

local servers = {
  'sumneko_lua',
  'rust_analyzer',
  'pyright',
  'svelte',
  'java_language_server',
  'tsserver',
  'dockerls',
  'marksman'
}

for _, lsp in ipairs(servers) do
  lspconfig[lsp].setup {
    capabilities = capabilities
  }
end

vim.lsp.handlers["textDocument/publishDiagnostics"] = vim.lsp.with(
 vim.lsp.diagnostic.on_publish_diagnostics, {
   -- Enable underline, use default values
   underline = true,
   -- Enable virtual text only on Warning or above, override spacing to 2
   virtual_text = {
     spacing = 2,
     severity_limit = "Warning",
   },
 }
)
