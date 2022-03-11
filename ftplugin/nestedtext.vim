if exists("b:did_ftplugin")
  finish
endif
let b:did_ftplugin = 1

setlocal expandtab
setlocal formatoptions+=r
setlocal comments=:#,b:>,b::
setlocal commentstring=#\ %s
let b:undo_ftplugin = 'setlocal et< fo< comments< cms<'
if get(g:, 'nestedtext_folding', 0)
  setlocal foldmethod=indent
  let b:undo_ftplugin .= ' fdm<'
endif
