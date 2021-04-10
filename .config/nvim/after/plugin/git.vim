" ----- GIT -----

" ----- CYCLE THRU HUNK -----
function! GitGutterNextHunkCycle()
    let line = line('.')
    silent! GitGutterNextHunk
    if line('.') == line
        1
        GitGutterNextHunk
    endif
endfunction

" ----- PREVENT DEFAULT KEY BINDING -----
let g:gitgutter_map_keys=0


" ----- PREFER SPLIT IN VERTICAL INSTEAD -----
set diffopt+=vertical


" ----- NEXT/PREV GO TO GIT ACTION -----
nnoremap gu :GitGutterUndoHunk<CR>
nnoremap g] :call GitGutterNextHunkCycle()<CR>
nnoremap g[ :GitGutterPrevHunk<CR>
nnoremap gp :GitGutterPreviewHunk<CR>


" ----- GIT KEY BINDING -----
nnoremap gs :Gstatus<CR>
nnoremap gh :diffget //2<CR>
nnoremap gl :diffget //3<CR>
