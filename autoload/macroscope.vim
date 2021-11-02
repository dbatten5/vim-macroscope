" config

let g:macroscope_default_register = get(g:, 'macroscope_default_register', 'q')
let g:macroscope_window_position  = get(g:, 'macroscope_window_position', 'bottom')
let g:macroscope_window_height    = get(g:, 'macroscope_window_height', '1')

" public functions

function! macroscope#open(...)
  execute s:window_position_check()
  if empty(a:1)
    let register = g:macroscope_default_register
  else
    let register = a:1
  endif
  if empty(getreg(register))
    echo 'macroscope: no register associated with ' . register . '!'
    return 0
  endif
  call s:open_window()
  execute 'normal! "' . register . 'pkdd'
  call s:activate_autocmds(bufnr('%'), register)
endfunction

" utility

function! s:window_position_check()
  let position = g:macroscope_window_position
  if position != 'bottom' && position != 'top'
    echo 'macroscope: invalid position! please choose top or bottom, you chose ' . position
    return 'return 0'
  endif
  return ''
endfunction

function! s:open_window()
  execute s:get_position() . ' ' . g:macroscope_window_height . ' new __macroscope__'
  setlocal buftype=nofile bh=wipe nobl noswapfile nonu norelativenumber
endfunction

function! s:get_position()
  if g:macroscope_window_position == 'top'
    return 'topleft'
  endif
  return 'botright'
endfunction

function! s:close_window(reg)
  call s:update_macro(a:reg)
  close
endfunction

function! s:update_macro(reg)
  echo 'macroscope: macro in register ' . a:reg . ' updated!'
  execute 'normal! "' . a:reg . 'yy'
endfunction

function! s:activate_autocmds(bufnr, reg)
  augroup macroscope_autohide
    autocmd!
    execute 'autocmd Winleave <buffer=' . a:bufnr . '> nested call <SID>close_window("'. a:reg . '")'
  augroup END
endfunction
