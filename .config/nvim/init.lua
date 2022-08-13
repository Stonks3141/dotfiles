package.path = package.path .. ';' .. os.getenv('HOME') .. '/.config/nvim/?.lua'
package.path = package.path .. ';' .. os.getenv('HOME') .. '/.config/nvim/?/init.lua'

require('plugins')
require('opts')
require('keys')
require('term')
require('lsps')

vim.env.GIT_EDITOR = 'nvr --remote-tab-wait -c "set bufhidden=delete"'
