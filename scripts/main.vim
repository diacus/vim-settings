let mapleader=" "

call plug#begin()
" Third party plugins, uncomment to install as needed
" Plug 'airblade/vim-gitgutter'
" Plug 'vim-airline/vim-airline'
" Plug 'vim-airline/vim-airline-themes'
" Plug '/usr/local/bin/fzf'
" Plug 'junegunn/fzf'
" Plug 'junegunn/fzf.vim'
" Plug 'jremmen/vim-ripgrep'
" Plug 'tpope/vim-fugitive'
" Plug 'tpope/vim-vinegar'
" Plug 'vim-utils/vim-man'
" Plug 'mbbill/undotree'
" Plug 'uguu-org/vim-matrix-screensaver'
" Plug 'tweekmonster/django-plus.vim'
" Plug 'junegunn/vim-emoji'

Plug 'diacus/vim-settings'
if has('gui_running')
  Plug 'diacus/vim-gvimsettings'
endif
Plug 'diacus/vim-markdown'
Plug 'diacus/vim-development'
Plug 'diacus/vim-spelling'

" Color schemes
" Plug 'lifepillar/vim-colortemplate'
" Plug 'vim-scripts/Wombat'
" Plug 'vim-scripts/wombat256.vim'
" Plug 'morhetz/gruvbox'
Plug 'arcticicestudio/nord-vim'

" Started to use these for Legacy.com
" Plug 'editorconfig/editorconfig-vim'
call plug#end()

let g:netrw_hide=1
let g:netrw_liststyle=2
let g:netrw_list_hide = '\(^\|\s\s\)\zs\.\S\+'

" silent! colorscheme gruvbox
silent! colorscheme nord
if exists('g:colors_name') && g:colors_name == 'nord'
  highlight! VertSplit guibg=#3B4252
endif
