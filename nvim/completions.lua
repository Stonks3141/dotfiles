local cmp = require('cmp')

require('luasnip.loaders.from_vscode').lazy_load()
vim.opt.completeopt = 'menu,menuone,noinsert'

local cmp_kinds = {
  Text = '  ',
  Method = '  ',
  Function = '  ',
  Constructor = '  ',
  Field = '  ',
  Variable = '  ',
  Class = '  ',
  Interface = '  ',
  Module = '  ',
  Property = '  ',
  Unit = '  ',
  Value = '  ',
  Enum = '  ',
  Keyword = '  ',
  Snippet = '  ',
  Color = '  ',
  File = '  ',
  Reference = '  ',
  Folder = '  ',
  EnumMember = '  ',
  Constant = '  ',
  Struct = '  ',
  Event = '  ',
  Operator = '  ',
  TypeParameter = '  ',
}

cmp.setup {
  snippet = {
    expand = function(args)
      require('luasnip').lsp_expand(args.body)
    end,
  },
  window = {
    completion = { border = 'none' },
    documentation = { border = 'none' },
  },
  completion = { completeopt = 'menu,menuone,noinsert' },
  mapping = cmp.mapping.preset.insert {
    ['<C-Up>'] = cmp.mapping(cmp.mapping.scroll_docs(4)),
    ['<C-Down>'] = cmp.mapping(cmp.mapping.scroll_docs(-4)),
    ['<Esc>'] = cmp.mapping.abort(),
    ['<Tab>'] = cmp.mapping.confirm { select = true },
  },
  formatting = {
    format = function(_, vim_item)
      vim_item.kind = (cmp_kinds[vim_item.kind] or '') .. vim_item.kind
      return vim_item
    end,
  },
  sources = {
    { name = 'luasnip' },
    { name = 'buffer' },
    { name = 'path' },
    { name = 'cmdline' },
    { name = 'nvim_lsp' },
  },
}
