function! macroscope#open(...)
  if a:0 == 0
    let register = 'q'
  else
    let register = a:1
  endif
  let reg_content = getreg(register)
  if empty(reg_content)
    echo 'macroscope: no register associated with ' . register . '!'
    return 0
  endif
  call s:open_window()
  execute 'normal! "' . register . 'p'
  call s:activate_autocmds(bufnr('%'), register)
endfunction

" utility

function! s:open_window()
  execute 'botright 1 new __macroscope__'
  setlocal bt=nofile bh=wipe nobl noswapfile nu
endfunction

function! s:close_window(reg)
  call s:update_macro(a:reg)
  close
endfunction

function! s:update_macro(reg)
  execute 'normal! "' . a:reg . 'yy'
endfunction

function! s:activate_autocmds(bufnr, reg)
  augroup macroscope_autohide
    autocmd!
    execute 'autocmd Winleave <buffer=' . a:bufnr . '> nested call <SID>close_window("'. a:reg . '")'
    execute 'autocmd * <buffer=' . a:bufnr . '> nnoremap <buffer> s <SID>update_macro("' . a:reg . '")'
  augroup END
endfunction
