require('plugins')
require('bar')
require('maps')

local set = vim.opt
set.tabstop = 2
set.softtabstop = 2
set.shiftwidth = 2
set.relativenumber = true
set.cursorline = true

local i = 1
local colors = {'monokai', 'monokai_pro'}
vim.cmd('colorscheme ' .. colors[2])
