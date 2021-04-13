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
      \   'filename': 'FilenameAndLastPath'
      \ },
      \ 'tab_component_function': {
      \   'filename': 'TabFilenameAndLastPath',
      \ },
      \ }


" ----- COOL FILENAME FUNCTION -----
function! TabFilenameAndLastPath(n)
    let buflist = tabpagebuflist(a:n)
    let winnr = tabpagewinnr(a:n)
    let bufnum = buflist[winnr - 1]
    let bufname = expand('#'.bufnum.':t')
    let buffullname = expand('#'.bufnum.':p')
    let buffullnames = []
    let bufnames = []
    for i in range(1, tabpagenr('$'))
        if i != a:n
            let num = tabpagebuflist(i)[tabpagewinnr(i) - 1]
            call add(buffullnames, expand('#' . num . ':p'))
            call add(bufnames, expand('#' . num . ':t'))
        endif
    endfor
    let i = index(bufnames, bufname)
    if strlen(bufname) && i >= 0 && buffullnames[i] != buffullname
        return substitute(buffullname, '.*/\([^/]\+/\)', '\1', '')
    else
        return strlen(bufname) ? bufname : '[No Name]'
    endif
endfunction

function! FilenameAndPath()
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

function! FilenameAndLastPath()
    let filenameonly = expand('%:t:r')
    if filenameonly ==? "index"
        return remove(split(expand("%:h"), "/"), -1) . "/" . expand("%:t")
    else
        return expand("%:t")
    endif
endfunction
" ----- END OF COOL FILENAME FUNCTION -----


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
