" ===========================================================================
" FILE        : plugin/settings.vim
" DESCRIPTION : Vim settings file.
" AUTHOR      : @diacus (diacus.magnuz@gmail.com)
" CREATION    : Fri Jul 28 12:16:18 AM CST 2023
" LAST EDIT   : Wed Oct 23 11:24:48 AM CST 2024
" ===========================================================================
syntax on
filetype plugin indent on
filetype plugin on

set nocompatible
set nowrap
set termguicolors
set clipboard=unnamed
set fillchars=vert:\ 
set encoding=utf-8
set grepprg=grep\ -nH\ $*
set hidden
set list
set listchars=tab:▸\ ,trail:·
set mouse=a
set numberwidth=6
set path+=**
set ruler
set t_Co=256
set wildmenu
set splitbelow
set splitright
set textwidth=80
set cmdheight=2 " for details see :help netrw-p10<CR>

" Airline setup
if exists(':AirlineRefresh')
  let g:airline_powerline_fonts = 1
  let g:airline_left_sep = '»'
  let g:airline_right_sep = '«'
  let g:airline_symbols.crypt = '🔒'
  let g:airline_symbols.linenr = '␤'
  let g:airline_symbols.branch = '⎇'
  let g:airline_symbols.paste = 'ρ'
  let g:airline_symbols.notexists = '∄'
  let g:airline_symbols.whitespace = '☰'
  let g:airline#extensions#tabline#formatter = 'unique_tail'
endif

" Justify text
" Vim includes a macro that justifies the text, if it is present in your
" system, include it.
runtime! macros/justify.vim

hi Normal guibg=NONE ctermbg=NONE
