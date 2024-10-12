" vim -b : edit binary using xxd-format!
augroup Binary
  if !exists("BinaryAutocmd")
    let BinaryAutocmd = 1
    autocmd BufLeave *
      \ set binary!
    autocmd BufEnter *
      \ set binary
      \ | if &binary
      \ |   execute "silent %!xxd -c 16"
      \ |   set nomod
      \ |   set filetype=xxd
      \ |   redraw
      \ | endif
    autocmd BufWritePre *
      \ if &binary
      \ |   let s:view = winsaveview()
      \ |   execute "silent %!xxd -r -c 16"
      \ | endif
    autocmd BufWritePost *
      \ if &binary
      \ | execute "silent %!xxd -c 16"
      \ | set nomod
      \ | call winrestview(s:view)
      \ | redraw
      \ | endif
  endif
augroup END
