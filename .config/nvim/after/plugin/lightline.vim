" ----- LIGHTLINE SETTTINGS -----
" let g:lightline = {'colorscheme': 'argonaut'}
" 'right': [ [ 'lineinfo' ], ['percent'], ['filetype']]
"'colorscheme': 'off',
let g:lightline = {
      \ 'active': {
      \   'left': [ [ 'mode', 'paste' ],
      \             [ 'gitbranch', 'filename', 'modified' ] ],
      \   'right': []
      \ },
      \ 'component_function': {
      \   'gitbranch': 'FugitiveHead',
      \   'filename': 'FilenameAndPath'
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
    " if strlen(bufname) && i >= 0 && buffullnames[i] != buffullname
    return substitute(buffullname, '.*/\([^/]\+/\)', '\1', '')
    " else
        " return strlen(bufname) ? bufname : '[No Name]'
    " endif
endfunction

function! FilenameAndPath()
    " If its tree explorer then show name as this
    if &ft == 'fern'
        return "Fern Tree"
    else

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
            let name = parent . '/' . strpart(s, 0)
        endif
        let i += 1
    endfor
    return substitute(name, '.*/\([^/]\+/\)', '\1', '')
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

