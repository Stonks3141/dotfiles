local api = vim.api
local cmd = vim.cmd
local ol = vim.opt_local
local set = vim.keymap.set

local win = -1
local buf = -1
local bufs = {}
local i = 0

function open_win()
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
end

function switch_or_open()
  if api.nvim_win_is_valid(win) then
    api.nvim_set_current_win(win)
  else
    open_win()
  end
end

function new_term()
  cmd('term')
  buf = api.nvim_get_current_buf()
  i = #bufs
  table.insert(bufs, buf)
end

function open_term_buf()
  if not api.nvim_buf_is_loaded(buf) then
    table.remove(bufs, i)
    if #bufs > 0 then
      if i >= #bufs then i = i - 1 end
      buf = bufs[i]
    else
      new_term()
    end
  end
  api.nvim_win_set_buf(win, buf)
  cmd('startinsert')
end

function cycle_term_buf(index)
  local len = #bufs
  i = i + index
  if i < 0 then i = i + len
  elseif i >= len then i = i - len end

  buf = bufs[i]
  print(buf)
  api.nvim_win_set_buf(win, buf)
end

function toggle_term_win()
  if not api.nvim_win_is_valid(win) then
    open_win()
    open_term_buf()
  else
    api.nvim_win_close(win, false)
  end
end

function new_term_buf()
  switch_or_open()
  new_term()
  api.nvim_win_set_buf(win, buf)
  cmd('startinsert')
end

function cycle_term_buf_right() cycle_term_buf(1) end
function cycle_term_buf_left() cycle_term_buf(-1) end

set('n', 'tt', toggle_term_win)
set('n', 'tn', new_term_buf)
set('n', 'th', cycle_term_buf_left)
set('n', 'tl', cycle_term_buf_right)
