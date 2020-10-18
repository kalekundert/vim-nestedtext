
if exists("b:current_syntax")
  finish
endif

syntax match ntDictKey `^ *\zs[^->"' ].\{-}\ze:` nextgroup=ntDictChar
syntax match ntDictChar `:\ze \?` contained nextgroup=ntString
syntax region ntDictKey matchgroup=ntDictChar start=`^ *\zs"` end=`":` nextgroup=ntString
syntax region ntDictKey matchgroup=ntDictChar start=`^ *\zs'` end=`':` nextgroup=ntString

syntax match ntComment "^ *#.*$"
syntax match ntListChar "^ *\zs-\ze \?" nextgroup=ntString
syntax match ntStringChar "^ *\zs>\ze \?" nextgroup=ntString

syntax match ntString ".\{-}$" contained

highlight link ntComment Comment
highlight link ntString String
highlight link ntDictKey Identifier

let b:current_syntax = "nestedtext"
