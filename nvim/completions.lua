local cmp = require('cmp')

require("luasnip.loaders.from_vscode").lazy_load()
vim.opt.completeopt = 'menu,menuone,noinsert'

cmp.setup {
  snippet = {
    expand = function(args)
      require('luasnip').lsp_expand(args.body)
    end
  },
  window = {
    completion = { border = 'rounded' },
    documentation = { border = 'rounded' }
  },
  completion = { completeopt = 'menu,menuone,noinsert' },
  mapping = cmp.mapping.preset.insert {
    ['<C-Up>'] = cmp.mapping(cmp.mapping.scroll_docs(4)),
    ['<C-Down>'] = cmp.mapping(cmp.mapping.scroll_docs(-4)),
    ['<Esc>'] = cmp.mapping.abort(),
    ['<Tab>'] = cmp.mapping.confirm({ select = true }),
    ['<CR>'] = cmp.mapping.confirm({ select = true })
  },
  sources = {
    { name = 'luasnip' },
    { name = 'buffer' },
    { name = 'path' },
    { name = 'cmdline' },
    { name = 'nvim_lsp' }
  }
}

