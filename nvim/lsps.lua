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

