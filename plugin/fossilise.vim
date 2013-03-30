function! UpdateFossil()
  call system('fossil update trunk')
  checktime
endfunction

function! CommitFossil()
  call system('fossil commit -m "fossilise update"')
endfunction

function! SyncFossil()
  call UpdateFossil()
  call CommitFossil()
endfunction

function! InitFossilSession()
  set autoread
  augroup Fossilise
    au!
    au BufWritePost * call SyncFossil()
    au CursorHold  * call UpdateFossil()
  augroup END
endfunction

command! Fossilise call InitFossilSession()
