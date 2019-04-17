" vim: et sw=2 sts=2

" Plugin:      https://github.com/segeljakt/vim-stealth
" Description: Toggle the visibility of comments.
" Maintainer:  Klas Segeljakt <http://github.com/segeljakt>

" if exists('g:stealth#autoloaded') || &cp
"   finish
" el
"   let g:stealth#autoloaded = 1
" en

let s:hidden = v:false
let s:waiting = v:false

fun! s:hide()
  hi! link Comment Ignore
  hi! link vimCommentTitle Ignore
  let s:hidden = v:true
endfun

fun! s:reveal()
  hi! link Comment Comment
  hi! link vimCommentTitle vimCommentTitle
  let s:hidden = v:false
endfun

fun! s:start_waiting()
  aug Stealth | au!
    au CursorMoved,CursorMovedI * call s:cursor_moved()
  aug END
  let s:waiting = v:true
endfun

fun! s:cursor_moved()
  if s:hidden
    call s:reveal()
  en
  if s:waiting
    call s:stop_waiting()
  en
endfun

fun! s:stop_waiting()
  au! Stealth
  aug! Stealth
  let s:waiting = v:false
endfun

fun! stealth#toggle()
  if s:hidden
    call s:reveal()
    if s:waiting && g:stealth#reveal_on_move
      call s:stop_waiting()
    en
  el
    call s:hide()
    if !s:waiting && g:stealth#reveal_on_move
      call s:start_waiting()
    en
  en
  return ""
endfun

