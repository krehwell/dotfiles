" ----- GIT -----

" ----- CYCLE THRU HUNK
function! GitGutterNextHunkCycle()
    let line = line('.')
    silent! GitGutterNextHunk
    if line('.') == line
        if len(GitGutterGetHunks()) != 0
            1
            GitGutterNextHunk
        else
            echo "No Hunk in File"
        endif
    endif
endfunction

function! GitGutterPrevHunkCycle()
    let line = line('.')
    silent! GitGutterPrevHunk
    if line('.') == line
        if len(GitGutterGetHunks()) != 0
            norm! G
            GitGutterPrevHunk
        else
            echo "No Hunk in File"
        endif
    endif
endfunction

" ----- PREVENT DEFAULT KEY BINDING
let g:gitgutter_map_keys=0


" ----- PREFER SPLIT IN VERTICAL INSTEAD
set diffopt+=vertical


" ----- NEXT/PREV GO TO GIT ACTION
nnoremap gu :GitGutterUndoHunk<CR>
nnoremap g] :call GitGutterNextHunkCycle()<CR>
nnoremap g[ :call GitGutterPrevHunkCycle()<CR>
nnoremap gp :GitGutterPreviewHunk<CR>


" ----- GIT KEY BINDING -----
nnoremap gs :Git<CR>
nnoremap gh :diffget //2<CR>
nnoremap gl :diffget //3<CR>
cnoremap GIT git
cnoremap GIt git
cnoremap Gti git
cnoremap GTi git
