local o = vim.opt
local ol = vim.opt_local
local au = vim.api.nvim_create_autocmd

o.autoindent = true
o.showmatch = true
o.ignorecase = true
o.hlsearch = true
o.number = true
o.tabstop = 2
o.expandtab = true
o.shiftwidth = 2
o.softtabstop = 2
o.cursorline = true
o.updatetime = 100

au('TermOpen', {
  pattern = {'*'},
  callback = function()
    ol.number = false
    ol.relativenumber = false
    ol.cursorline = false
  end
})
