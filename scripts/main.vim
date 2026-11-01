let mapleader=" "

call plug#begin()

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

" ------------------------------------------------------------------------------
"                      THIRD PARTY PLUGIN SECTION STARTS
" ------------------------------------------------------------------------------
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
" Plug 'editorconfig/editorconfig-vim'

" ------------------------------------------------------------------------------
"                       THIRD PARTY PLUGIN SECTION ENDS
" ------------------------------------------------------------------------------
call plug#end()

" netrw, the file explorer, is configured by vim-settings;
" set g:netrw_style there if you want, see :help settings-netrw

" silent! colorscheme gruvbox
function! s:apply_colorscheme() abort
  silent! colorscheme nord
  if exists('g:colors_name') && g:colors_name == 'nord'
    highlight! VertSplit guibg=#3B4252
  endif
endfunction

call s:apply_colorscheme()

" The GUI applies its own settings once the vimrc is done, which may
" reset the colors; so apply the colorscheme again when the GUI is ready
if has('gui_running')
  autocmd GUIEnter * call s:apply_colorscheme()
endif
