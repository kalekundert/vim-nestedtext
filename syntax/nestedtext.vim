if exists("b:current_syntax")
  finish
endif

syntax match nestedtextError "^\t\+"

syntax match nestedtextDictKey "^ *\zs[^[:space:]{[].\{-}: "he=e-2 nextgroup=nestedtextString
syntax match nestedtextDictKey "^ *\zs[^[:space:]{[].\{-}:$"he=e-1

syntax match nestedtextListTag "^ *\zs- " nextgroup=nestedtextString
syntax match nestedtextListTag "^ *\zs-$"

syntax match nestedtextStringTag "^ *\zs> " nextgroup=nestedtextString
syntax match nestedtextStringTag "^ *\zs>$"

syntax match nestedtextKeyTag "^ *\zs: " nextgroup=nestedtextKey
syntax match nestedtextKeyTag "^ *\zs:$"

syntax match nestedtextKey ".*$" contained
syntax match nestedtextString ".*$" contained

syntax match nestedtextInline "\[.*\]" contains=nestedtextInlineList
syntax region nestedtextInlineList start="\[" end="\]" contained oneline contains=@nestedtextInlineListValue
syntax cluster nestedtextInlineListValue contains=nestedtextInlineListString,nestedtextInline
syntax match nestedtextInlineListString "[^{}[\],]*" contained

" commas are pretty much ignored in inline dictionaries
syntax match nestedtextInline "{.*}" contains=,nestedtextInlineDict
syntax region nestedtextInlineDict start="{" end="}" contained oneline contains=nestedtextInlineDictItem
syntax match nestedtextInlineDictItem "[^{}[\],:]*:" contained nextgroup=@nestedtextInlineDictValue
syntax cluster nestedtextInlineDictValue contains=nestedtextInlineDictString,nestedtextInline
syntax match nestedtextInlineDictString "[^{}[\],:]*" contained

syntax match nestedtextComment "^ *\zs#.*$"


hi def link nestedtextError Error
hi def link nestedtextComment Comment

hi def link nestedtextListTag Normal
hi def link nestedtextStringTag Normal
hi def link nestedtextKeyTag Normal
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
