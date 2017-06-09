execute pathogen#infect()
syntax on
filetype plugin indent on
set nu
set relativenumber
let mapleader = "-"
autocmd StdinReadPre * let s:std_in=1
autocmd VimEnter * if argc() == 0 && !exists("s:std_in") | NERDTree | endif
nnoremap <leader>k :NERDTreeToggle<CR>
