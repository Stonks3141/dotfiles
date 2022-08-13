local api = vim.api
local cmd = vim.cmd
local set = vim.keymap.set
local map = api.nvim_set_keymap

-- nvim-tree
set('n', ';', function()
  require('nvim-tree').toggle()
end)

-- Telescope
set('n', 'ff', function()
  require('telescope.builtin').find_files()
end)
set('n', 'fg', function()
  require('telescope.builtin').live_grep()
end)
set('n', 'fb', function()
  require('telescope.builtin').buffers()
end)
set('n', 'fh', function()
  require('telescope.builtin').help_tags()
end)

-- Terminal keymaps
map('t', '<Esc>', [[<C-\><C-n>]], {})
map('t', '<C-W>h', [[<C-\><C-n><C-W>h]], {})
map('t', '<C-W>j', [[<C-\><C-n><C-W>j]], {})
map('t', '<C-W>k', [[<C-\><C-n><C-W>k]], {})
map('t', '<C-W>l', [[<C-\><C-n><C-W>l]], {})

