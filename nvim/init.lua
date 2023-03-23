require('plugins')
require('bar')
require('maps')
require('lsp')
require('opts')
-- require('coc')

local set = vim.opt
set.tabstop = 2
set.softtabstop = 2
set.shiftwidth = 2
set.relativenumber = true
set.cursorline = true


local truecolors = vim.api.nvim_exec(
[[
if (empty($TMUX))
  if (has("nvim"))
    let $NVIM_TUI_ENABLE_TRUE_COLOR=1
  endif
  if (has("termguicolors"))
    set termguicolors
  endif
endif
]], true)

local i = 1
local colors = {'monokai', 'monokai_pro', 'gruvbox'}
vim.cmd('colorscheme ' .. colors[3])

