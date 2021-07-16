
if exists("b:current_syntax")
  finish
endif

syntax match ntError ".*"

" ntDictItem must be given first so that it has the lowest priority
syntax match ntDictTag  "^ *[^{[].\{-}:[ \n]" contains=ntDictKey
syntax match ntDictKey  "^ *[^{[].\{-}: "he=e-2 nextgroup=ntString
syntax match ntDictKey  "^ *[^{[].\{-}:$"he=e-1

syntax match ntListTag   "^ *- " nextgroup=ntString
syntax match ntListTag   "^ *-$"

syntax match ntStringTag   "^ *> " nextgroup=ntString
syntax match ntStringTag    "^ *>$"

syntax match ntKeyTag   "^ *: " nextgroup=ntKey
syntax match ntKeyTag   "^ *:$"

syntax match ntKey ".*$" contained
syntax match ntString ".*$" contained

syntax match ntInline " *\[.*\]\s*" contains=ntInlineList
syntax region ntInlineList start="\s*\[" end="\]\s*" contained oneline contains=@ntInlineListValue
syntax cluster ntInlineListValue contains=ntInlineListString,ntInline
syntax match ntInlineListString "[^{}[\],]*" contained

" commas are pretty much ignored in inline dictionaries
syntax match ntInline " *{.*}\s*" contains=,ntInlineDict
syntax region ntInlineDict start="\s*{" end="}\s*" contained oneline contains=ntInlineDictItem
syntax match ntInlineDictItem "[^{}[\],:]*:" contained nextgroup=@ntInlineDictValue
syntax cluster ntInlineDictValue contains=ntInlineDictString,ntInline
syntax match ntInlineDictString "[^{}[\],:]*" contained

syntax match ntComment "^ *#.*$"


highlight link ntError Error
highlight link ntComment Comment

highlight link ntListTag Normal
highlight link ntStringTag Normal
highlight link ntKeyTag Normal
highlight link ntDictTag Normal
highlight link ntDictKey Label
highlight link ntKey Label
highlight link ntString String

highlight link ntInline Normal
highlight link ntInlineList Normal
highlight link ntInlineDict Normal
highlight link ntInlineListString String
highlight link ntInlineDictString String
highlight link ntInlineDictItem Label

let b:current_syntax = "nestedtext"
