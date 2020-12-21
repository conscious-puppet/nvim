function! Scratchpad_buffer()
  edit scratch
  setlocal buftype=nofile bufhidden=hide noswapfile
  augroup scratchpad_buffer
    autocmd! * <buffer>
    " autocmd BufLeave <buffer> echo "Do stuff"
  augroup END
endfunction

command! ScratchPad :call Scratchpad_buffer()
