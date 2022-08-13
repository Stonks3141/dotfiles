local api = vim.api
local cmd = vim.cmd
local o = vim.opt
local set = vim.keymap.set

local win = -1
local buf = -1
local bufs = {}
local i = 1

-- # Invariants
-- - bufs[i] === buf

function open_win()
  -- restore previous setting so help opens on top
  local tmp = o.splitbelow
  o.splitbelow = true
  cmd('split')
  o.splitbelow = tmp

  win = api.nvim_get_current_win()

  api.nvim_win_set_height(win, 12)
  api.nvim_win_set_option(win, 'cursorline', false)
  api.nvim_win_set_option(win, 'number', false)
  api.nvim_win_set_option(win, 'relativenumber', false)
  api.nvim_win_set_option(win, 'wfh', true) -- window fixed height
end

function switch_or_open()
  if api.nvim_win_is_valid(win) then
    api.nvim_set_current_win(win)
  else
    open_win()
  end
end

-- current window must be `win`
function new_term()
  cmd('term')
  buf = api.nvim_get_current_buf()
  table.insert(bufs, buf)
  i = #bufs
  cmd('startinsert')
end

-- current window must be `win`
function open_term_buf()
  -- must handle the cases where i > #bufs or >1 buf in bufs is invalid
  if not api.nvim_buf_is_loaded(buf) then
    table.remove(bufs, i)
    if #bufs > 0 then
      if i > #bufs then
        i = #bufs
      end
      buf = bufs[i]
      open_term_buf()
    else
      new_term()
    end
  else
    api.nvim_win_set_buf(win, buf)
    cmd('startinsert')
  end
end

function cycle_term_buf(index)
  i = (i + index) % #bufs + 1
  buf = bufs[i]
  vim.pretty_print(i, bufs)
  open_term_buf()
  --api.nvim_win_set_buf(win, buf)
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
end

function cycle_term_buf_right() cycle_term_buf(1) end
function cycle_term_buf_left() cycle_term_buf(-1) end

set('n', 'tt', toggle_term_win)
set('n', 'tn', new_term_buf)
set('n', 'tj', cycle_term_buf_left)
set('n', 'tk', cycle_term_buf_right)
