if exists('b:did_indent')
  finish
endif

let b:did_indent = 1

setlocal indentexpr=GetNestedTextIndent(v:lnum)
setlocal indentkeys=0{,0[,0>,0-,<:>,0#,!^F,o,O
setlocal nosmartindent
let b:undo_indent = "setl inde< indk< si<"

let s:list_item = '^ *-\%( \@=\|$\)'
let s:key_tag = '^ *:\%( \@=\|$\)'
let s:inline_key = '^ *[^[:space:]#>{[:-].\{-}:\%( \@=\|$\)'
let s:dict_item = '\%(' . s:key_tag . '\|' . s:inline_key . '\)'

function! s:MatchIndent(prevlnum, seek) abort
  let lnum = a:prevlnum
  let max_indent = indent(lnum)
  while lnum > 0 && getline(lnum) !~# s:list_item . '\|' . s:dict_item
    let lnum = prevnonblank(lnum-1)
    if max_indent > indent(lnum)
      let max_indent = indent(lnum)
    endif
  endwhile
  while lnum > 0
    if indent(lnum) <= max_indent && getline(lnum) =~# a:seek
      return indent(lnum)
    endif
    let lnum = prevnonblank(lnum-1)
  endwhile
  return -1
endfunction

function! GetNestedTextIndent(lnum) abort
  let prevlnum = prevnonblank(a:lnum-1)
  let prevline = getline(prevlnum)
  let line = getline(a:lnum)
  if !prevlnum
    return 0
  elseif prevline =~# s:key_tag
    if line =~# '^ *[^#: ]' || indent(a:lnum) > indent(prevlnum)
      return indent(prevlnum) + shiftwidth()
    endif
  elseif prevline =~# '\%(' . s:list_item . '\|' . s:inline_key  . '\) *$'
    if line =~# '^ *\%([[{>]\|$\)' || indent(a:lnum) > indent(prevlnum)
      return indent(prevlnum) + shiftwidth()
    endif
  elseif line =~# s:dict_item
    return s:MatchIndent(prevlnum, s:dict_item)
  elseif line =~# s:list_item
    return s:MatchIndent(prevlnum, s:list_item)
  elseif line =~# '^ *>' && prevline =~# '^ *>'
    return indent(prevlnum)
  elseif indent(a:lnum) > indent(prevlnum)
    return indent(prevlnum)
  endif
  return -1
endfunction
