
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

vnoremap <silent> * :<C-u>call VisualSelection('')<CR>/<C-R>=@/<CR><CR>
vnoremap <silent> # :<C-u>call VisualSelection('')<CR>?<C-R>=@/<CR><CR>
function! VisualSelection(direction) range
    let l:saved_reg = @"
    execute "normal! vgvy"
    let l:pattern = escape(@", "\\/.*'$^~[]")
    let @/ = substitute(l:pattern, "\n$", "", "")
    let @" = l:saved_reg
endfunction

" #region Finish
let &cpo = s:save_cpo
unlet s:save_cpo
" #endregion

" vim: set tabstop=4 shiftwidth=4 textwidth=250 expandtab :
" vim>60: set foldmethod=marker foldmarker=#region,#endregion :
