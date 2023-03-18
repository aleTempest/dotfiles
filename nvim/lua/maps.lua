local api = vim.api
vim.g.mapleader = ' '
vim.opt.clipboard:append {'unnamedplus'}

local function map(m, k, v)
	vim.keymap.set(m, k, v, {silent = true})
end

map('n', '<leader>fr', '<CMD>Telescope oldfiles<CR>')
map('n', '<leader>ff', '<CMD>Telescope find_files<CR>')
map('n', '<leader>fb', '<CMD>Telescope file_browser<CR>')
map('n', '<leader>fw', '<CMD>Telescope live_grep<CR>')
map('n', '<leader>ht', '<CMD>Telescope colorscheme<CR>')
map('n', '<Return>tn', ':tabedit<CR>')
map('n', '<Return>tc', ':tabclose<CR>')
map('n', '<Return>tN', ':tabNext<CR>')
map('n', '<leader>h', '<C-w>h<CR>')
map('n', '<leader>l', '<C-w>l<CR>')
map('n', '<leader>j', '<C-w>j<CR>')
map('n', '<leader>k', '<C-w>k<CR>')
map('n', '<leader>n', ':NERDTreeToggle<CR>')
api.nvim_create_autocmd(
	"FileType", { pattern = { "tex", "latex" }, command = [[map  <C-B>      bdwi\begin{<ESC>pa}<CR>\end{<ESC>pa}<ESC>O]] }
)
local cursorGrp = api.nvim_create_augroup("CursorLine", { clear = true })
api.nvim_create_autocmd(
  { "InsertLeave", "WinEnter" },
  { pattern = "*", command = "set cursorline", group = cursorGrp }
)
api.nvim_create_autocmd(
  { "InsertEnter", "WinLeave" },
  { pattern = "*", command = "set nocursorline", group = cursorGrp }
)
