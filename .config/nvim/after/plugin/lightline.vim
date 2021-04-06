" ----- LIGHTLINE SETTTINGS -----
" let g:lightline = {'colorscheme': 'argonaut'}
" 'right': [ [ 'lineinfo' ], ['percent'], ['filetype']]
let g:lightline = {
      \ 'colorscheme': 'onedark',
      \ 'active': {
      \   'left': [ [ 'mode', 'paste' ],
      \             [ 'gitbranch', 'filename', 'modified' ] ],
      \   'right': []
      \ },
      \ 'component_function': {
      \   'gitbranch': 'FugitiveHead'
      \ }
      \ }


