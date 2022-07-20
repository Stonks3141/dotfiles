local api = vim.api
local cmd = vim.cmd
local ol = vim.opt_local
local set = vim.keymap.set
local map = api.nvim_set_keymap

-- nvim-tree
set('n', 'm', function() require('nvim-tree').toggle() end)

-- Telescope
set('n', 'ff', function() require('telescope.builtin').find_files() end)
set('n', 'fg', function() require('telescope.builtin').live_grep() end)
set('n', 'fb', function() require('telescope.builtin').buffers() end)
set('n', 'fh', function() require('telescope.builtin').help_tags() end)

-- Terminal keymaps
map('t', '<Esc>', [[<C-\><C-n>]], {})
map('t', '<C-W>h', [[<C-\><C-n><C-W>h]], {})
map('t', '<C-W>j', [[<C-\><C-n><C-W>j]], {})
map('t', '<C-W>k', [[<C-\><C-n><C-W>k]], {})
map('t', '<C-W>l', [[<C-\><C-n><C-W>l]], {})

-- Toggle terminal
local win = nil
local buf = nil

set('n', 't', function()
  if not win or not api.nvim_win_is_valid(win) then
    local tmp = ol.splitbelow
    ol.splitbelow = true
    cmd('split')
    ol.splitbelow = tmp
    
    win = api.nvim_get_current_win()

    api.nvim_win_set_height(win, 12)
    api.nvim_win_set_option(win, 'cursorline', false)
    api.nvim_win_set_option(win, 'number', false)
    api.nvim_win_set_option(win, 'relativenumber', false)
    api.nvim_win_set_option(win, 'wfh', true)

    if not buf or not api.nvim_buf_is_loaded(buf) then
      cmd('term')
      buf = api.nvim_get_current_buf()
    else
      api.nvim_win_set_buf(win, buf)
    end

    cmd('startinsert')
  else
    api.nvim_win_close(win, false)
    win = nil
  end
end)
