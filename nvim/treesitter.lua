require('nvim-treesitter.configs').setup({
  ensure_installed = {
    'lua',
    'bash',
    'markdown',
    'typescript',
    'javascript',
    'rust',
    'python',
    'toml',
    'yaml',
    'json',
    'svelte',
  },
  auto_install = true,
  highlight = {
    enable = true,
    additional_vim_regex_highlighting = false,
  },
  indent = { enable = true },
  incremental_selection = {
    enable = true,
    keymaps = {}, -- TODO
  },
})
