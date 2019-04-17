" vim: et sw=2 sts=2

" Plugin:      https://github.com/segeljakt/vim-stealth
" Description: Toggle the visibility of comments.
" Maintainer:  Klas Segeljakt <http://github.com/segeljakt>

fun! s:default(var, expr)
  if empty(exists("g:stealth#".a:var))
    exe 'let g:stealth#'.a:var.' = '.string(a:expr)
  en
endfun

call s:default("reveal_on_move", 1)
call s:default("use_default_mappings", 1)

com! Stealth call stealth#toggle()

nno <silent> <Plug>(Stealth) :Stealth<CR>

if g:stealth#use_default_mappings
  nmap <C-g>s <Plug>(Stealth)
en

