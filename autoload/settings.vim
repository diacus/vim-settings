" ===========================================================================
" FILE        : autoload/settings.vim
" DESCRIPTION : Helper functions for plugin/settings.vim
" AUTHOR      : @diacus (diacus.magnuz@gmail.com)
" LAST CHANGE : Sat Oct 31 20:30:00 CST 2026
" CREATION    : Sat Oct 31 20:30:00 CST 2026
" ===========================================================================

" ==============================================================================
" Keyboard mappings, see |settings-keyboard|
" ==============================================================================

function! settings#kb_should_load()
  " Load the keyboard mappings only when g:kb_layout is set to one of the
  " layouts we support, and only once
  if exists('g:did_kb')
    return 0
  endif
  if !exists('g:kb_layout')
    return 0
  endif
  return index(['es', 'latam'], g:kb_layout) != -1
endfunction

function! s:kb_es_generic_keys()
  " Some of the most useful keys in the 'en' layout are not that  easy  to
  " access in other keyboards.

  " To change to command mode quickly, use ñ because it is in the same place
  " for this layout.
  nnoremap ñ :
  vnoremap ñ :
  nnoremap Ñ :
  vnoremap Ñ :

  " To change to search mode quickly, use <Space> instead of slash.
  nnoremap <space> /
  vnoremap <space> /
endfunction

function! s:kb_es_keys()
  " In this case, comma is OK
  let g:mapleader=","

  " To jump tags easily in es keyboard layout
  nnoremap ¡ <Esc>
  nnoremap ç <C-]>
endfunction

function! s:kb_es_latam_keys()
  " Most popular leader key for latam keyboard layout is comma (,) but we
  " try the open question mark (¿) since the keyboard is in latam Spanish.
  let g:mapleader="¿"

  " To jump tags easily in latam keyboard layout
  nnoremap { [
  nnoremap } ]
endfunction

function! settings#kb_es()
  call s:kb_es_generic_keys()
  call s:kb_es_keys()
endfunction

function! settings#kb_latam()
  call s:kb_es_generic_keys()
  call s:kb_es_latam_keys()
endfunction

function! settings#kb_init()
  " Mappings for spanish keyboard layouts
  if index(['es', 'latam'], g:kb_layout) >= 0
    " Add spanish to spell languages, since the keyboard layout is in
    " spanish too.
    set spelllang+=es
  endif

  let Kb = function('settings#kb_' . g:kb_layout)
  call Kb()
endfunction

" ==============================================================================
" netrw, the file explorer, see |settings-netrw|
" ==============================================================================

function! settings#platform()
  if has('unix')
    return has('mac') || has('macunix') || has('osx') ? 'MacOS' : 'Linux'
  endif
  return 'Windows'
endfunction

function! settings#netrw_browsex_viewer()
  " Only Linux and MacOS have a known file manager tool; on Windows, netrw
  " picks its own viewer
  let viewers = { 'Linux': 'xdg-open', 'MacOS': 'open' }
  return get(viewers, settings#platform(), '')
endfunction

function! settings#netrw_tree_style()
  let g:netrw_liststyle = 3
  let g:netrw_browse_split = 4
  let g:netrw_winsize = 20
endfunction

function! settings#netrw_full_style()
  let g:netrw_liststyle = 2
  let g:netrw_browse_split = 0
  let g:netrw_winsize = 0
endfunction

function! settings#netrw()
  let g:netrw_banner = 0
  " Open the files with the file manager tool of the operating system
  let viewer = settings#netrw_browsex_viewer()
  if viewer != ''
    let g:netrw_browsex_viewer = viewer
  endif
  " Hide the dotfiles by default
  let g:netrw_hide = 1
  let g:netrw_list_hide = '\(^\|\s\s\)\zs\.\S\+'

  if exists('g:netrw_style')
    if g:netrw_style == 'tree'
      call settings#netrw_tree_style()
    elseif g:netrw_style == 'full'
      call settings#netrw_full_style()
    endif
  endif
endfunction