local map = vim.api.nvim_set_keymap

-- nvim-tree
map('n', 'n', [[:NvimTreeToggle<cr>]], {})
map('n', 'm', [[:NvimTreeRefresh<cr>]], {})

-- Telescope
map('n', 'ff', [[:Telescope find_files<cr>]], {})
map('n', 'fg', [[:Telescope live_grep<cr>]], {})
map('n', 'fb', [[:Telescope buffers<cr>]], {})
map('n', 'fh', [[:Telescope help_tags<cr>]], {})

-- Terminal keymaps
map('t', '<Esc>', [[<C-\><C-n>]], {})
map('t', '<C-W>h', [[<C-\><C-n><C-W>h]], {})
map('t', '<C-W>j', [[<C-\><C-n><C-W>j]], {})
map('t', '<C-W>k', [[<C-\><C-n><C-W>k]], {})
map('t', '<C-W>l', [[<C-\><C-n><C-W>l]], {})

-- Open terminal
map('n', 't', [[:split<cr><C-W>j:resize 12<cr>:term<cr>:setlocal wfh<cr>i]], {})
