if exists("b:current_syntax")
  finish
endif

syntax match nestedtextError ".*"

" nestedtextDictItem must be given first so that it has the lowest priority
syntax match nestedtextDictTag  "^ *[^{[].\{-}:[ \n]" contains=nestedtextDictKey
syntax match nestedtextDictKey  "^ *[^{[].\{-}: "he=e-2 nextgroup=nestedtextString
syntax match nestedtextDictKey  "^ *[^{[].\{-}:$"he=e-1

syntax match nestedtextListTag   "^ *- " nextgroup=nestedtextString
syntax match nestedtextListTag   "^ *-$"

syntax match nestedtextStringTag   "^ *> " nextgroup=nestedtextString
syntax match nestedtextStringTag    "^ *>$"

syntax match nestedtextKeyTag   "^ *: " nextgroup=nestedtextKey
syntax match nestedtextKeyTag   "^ *:$"

syntax match nestedtextKey ".*$" contained
syntax match nestedtextString ".*$" contained

syntax match nestedtextInline " *\[.*\]\s*" contains=nestedtextInlineList
syntax region nestedtextInlineList start="\s*\[" end="\]\s*" contained oneline contains=@nestedtextInlineListValue
syntax cluster nestedtextInlineListValue contains=nestedtextInlineListString,nestedtextInline
syntax match nestedtextInlineListString "[^{}[\],]*" contained

" commas are pretty much ignored in inline dictionaries
syntax match nestedtextInline " *{.*}\s*" contains=,nestedtextInlineDict
syntax region nestedtextInlineDict start="\s*{" end="}\s*" contained oneline contains=nestedtextInlineDictItem
syntax match nestedtextInlineDictItem "[^{}[\],:]*:" contained nextgroup=@nestedtextInlineDictValue
syntax cluster nestedtextInlineDictValue contains=nestedtextInlineDictString,nestedtextInline
syntax match nestedtextInlineDictString "[^{}[\],:]*" contained

syntax match nestedtextComment "^ *#.*$"


highlight link nestedtextError Error
highlight link nestedtextComment Comment

highlight link nestedtextListTag Normal
highlight link nestedtextStringTag Normal
highlight link nestedtextKeyTag Normal
highlight link nestedtextDictTag Normal
highlight link nestedtextDictKey Label
highlight link nestedtextKey Label
highlight link nestedtextString String

highlight link nestedtextInline Normal
highlight link nestedtextInlineList Normal
highlight link nestedtextInlineDict Normal
highlight link nestedtextInlineListString String
highlight link nestedtextInlineDictString String
highlight link nestedtextInlineDictItem Label

let b:current_syntax = "nestedtext"
