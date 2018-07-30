fu! GetHiTerm(group, term)
 let output = execute('hi '.a:group)
 return matchstr(output, a:term.'=\zs\S*')
endf

let s:ctermfg = GetHiTerm('Comment', 'ctermfg')
let s:ctermbg = GetHiTerm('Normal',  'ctermbg')
let s:guifg   = GetHiTerm('Comment', 'guifg')
let s:guibg   = GetHiTerm('Normal',  'guibg')

let s:hidden = 0

fu! stealth#toggle()
  if s:hidden
    exe "hi Comment ctermfg=".s:ctermfg." guifg=".s:guifg
          \      ." ctermbg=".s:ctermbg." guibg=".s:guibg
    let s:hidden = 0
  el
    exe "hi Comment ctermfg=".s:ctermbg." guifg=".s:guibg
          \      ." ctermbg=".s:ctermbg." guibg=".s:guibg
    let s:hidden = 1
  en
endf
