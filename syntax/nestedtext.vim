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


hi def link nestedtextError Error
hi def link nestedtextComment Comment

hi def link nestedtextListTag Normal
hi def link nestedtextStringTag Normal
hi def link nestedtextKeyTag Normal
hi def link nestedtextDictTag Normal
hi def link nestedtextDictKey Label
hi def link nestedtextKey Label
hi def link nestedtextString String

hi def link nestedtextInline Normal
hi def link nestedtextInlineList Normal
hi def link nestedtextInlineDict Normal
hi def link nestedtextInlineListString String
hi def link nestedtextInlineDictString String
hi def link nestedtextInlineDictItem Label

let b:current_syntax = "nestedtext"
