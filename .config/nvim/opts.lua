local opt = {
  autoindent = true,
  showmatch = true,
  ignorecase = true,
  smartcase = true,
  hlsearch = true,
  number = true,
  tabstop = 2,
  expandtab = true,
  shiftwidth = 2,
  softtabstop = 2,
  cursorline = true,
  updatetime = 100,
}

for k, v in pairs(opt) do vim.opt[k] = v end
