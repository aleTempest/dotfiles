let mapleader =","

call plug#begin(system('echo -n "${XDG_CONFIG_HOME:-$HOME/.config}/nvim/plugged"')) 
" Plug 'vim-airline/vim-airline'
" Plug 'vim-airline/vim-airline-themes'
Plug 'junegunn/goyo.vim'
Plug 'preservim/nerdtree'
Plug 'joshdick/onedark.vim'
call plug#end() 

set relativenumber
set title
set bg=light
set go=a
set mouse=a
set nohlsearch
set clipboard+=unnamedplus
set noshowmode
set noruler
set laststatus=0
set noshowcmd
nnoremap c "_c
set nocompatible
filetype plugin on
syntax on
set encoding=utf-8
set number relativenumber
" set wildmode=longest,list,full
autocmd FileType * setlocal formatoptions-=c formatoptions-=r formatoptions-=o
set tabstop=4
set softtabstop=0 noexpandtab
set shiftwidth=4
set tabstop=8 softtabstop=0 expandtab shiftwidth=4 smarttab

" True colors
if (empty($TMUX))
  if (has("nvim"))
    let $NVIM_TUI_ENABLE_TRUE_COLOR=1
  endif
  if (has("termguicolors"))
    set termguicolors
  endif
endif

syntax on
colorscheme onedark

" Airline
let g:airline#extensions#tabline#enabled = 1

" map <leader>f :Goyo \| set bg=light \| set linebreak<CR>
map <leader>c :w! \| !compiler "<c-r>%"<CR>
map <leader>g :Goyo<CR>
