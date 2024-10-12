au BufRead,BufNewFile *
  \ let mime = system('file --mime ' . expand('%'))
  \ | let charset_binary = matchstr(mime, 'binary\n$')
  \ | if !empty(charset_binary) && stridx(mime, "directory") == -1
  \ |   set filetype=binary
  \ | endif
