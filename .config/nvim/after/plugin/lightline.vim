" ----- LIGHTLINE SETTTINGS -----
" let g:lightline = {'colorscheme': 'argonaut'}
" 'right': [ [ 'lineinfo' ], ['percent'], ['filetype']]
let g:lightline = {
      \ 'colorscheme': 'gruvbox',
      \ 'active': {
      \   'left': [ [ 'mode', 'paste' ],
      \             [ 'gitbranch', 'filename', 'modified' ] ],
      \   'right': []
      \ },
      \ 'component_function': {
      \   'gitbranch': 'FugitiveHead',
      \   'filename': 'LightLineFilenameAndLastPathOnly'
      \ }
      \ }

function! LightLineFilenameAndPath()
    let name = ""
    let subs = split(expand('%'), "/")
    let i = 1
    for s in subs
        let parent = name
        if  i == len(subs)
            let name = parent . '/' . s
        elseif i == 1
            let name = s
        else
            let name = parent . '/' . strpart(s, 0, 2)
        endif
        let i += 1
    endfor
    return name
endfunction

function! LightLineFilenameAndLastPathOnly()
    let filenameonly = expand('%:t:r')
    if filenameonly ==? "index"
        return remove(split(expand("%:h"), "/"), -1) . "/" . expand("%:t")
    else
        return expand("%:t")
    endif
endfunction

" ----- COLOR -----
autocmd VimEnter * call SetupLightlineColors()
function SetupLightlineColors() abort
  " transparent background in statusbar
  let l:palette = lightline#palette()

  let l:palette.normal.middle = [ [ 'NONE', 'NONE', 'NONE', 'NONE' ] ]
  let l:palette.inactive.middle = l:palette.normal.middle
  let l:palette.tabline.middle = l:palette.normal.middle

  call lightline#colorscheme()
endfunction
