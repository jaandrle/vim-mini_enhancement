
" #region Guard
if exists('g:load_mini_enhancement')
  finish
endif
let g:load_mini_enhancement = 1

let s:save_cpo = &cpo
set cpo&vim
" #endregion

nnoremap Y y$

inoremap <c-u> <c-g>u<c-u>
inoremap <c-w> <c-g>u<c-w>
inoremap . <c-g>u.
inoremap , <c-g>u,
inoremap ; <c-g>u;

inoremap <> <c-g>u<><Left>
inoremap () <c-g>u()<Left>
inoremap {} <c-g>u{}<Left>
inoremap [] <c-g>u[]<Left>
inoremap "" <c-g>u""<Left>
inoremap '' <c-g>u''<Left>
inoremap `` <c-g>u``<Left>

cnoremap <> <><Left>
cnoremap () ()<Left>
cnoremap {} {}<Left>
cnoremap [] []<Left>
cnoremap "" ""<Left>
cnoremap '' ''<Left>
cnoremap `` ``<Left>

vnoremap * :<c-u>let @/= escape(mini_enhancement#selectedText(), "\\/.*'$^~[]")<cr>/<c-r>/<cr>
vnoremap # :<c-u>let @/= escape(mini_enhancement#selectedText(), "\\/.*'$^~[]")<cr>?<c-r>?<cr>
function! mini_enhancement#selectedText()
    " from https://stackoverflow.com/a/6271254
    let [line_start, column_start] = getpos("'<")[1:2]
    let [line_end, column_end] = getpos("'>")[1:2]
    let lines = getline(line_start, line_end)
    if len(lines) == 0 | return '' | endif
    let lines[-1] = lines[-1][: column_end - (&selection == 'inclusive' ? 1 : 2)]
    let lines[0] = lines[0][column_start - 1:]
    return join(lines, "\n")
endfunction

" #region Finish
let &cpo = s:save_cpo
unlet s:save_cpo
" #endregion

" vim: set tabstop=4 shiftwidth=4 textwidth=250 expandtab :
" vim>60: set foldmethod=marker foldmarker=#region,#endregion :
