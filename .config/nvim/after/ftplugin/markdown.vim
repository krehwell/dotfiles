set colorcolumn=


" ----- VARIABLE -----
let $VIMBROWSER='!/mnt/c/Program\ Files\ \(x86\)/BraveSoftware/Brave-Browser/Application/brave.exe'
let $OPENBROWSER='nnoremap <F5> :'. $VIMBROWSER .' file://wsl\%24/Ubuntu-20.04%:p<CR>'


" ----- .md OPENER -----
augroup OpenMdFile
  autocmd!
  autocmd BufEnter *.md echom "Press F5 to Open .md File"
  " Trying to make a keybind to open brave from here
  autocmd BufEnter *.md exe $OPENBROWSER
augroup END


" ----- VIM PLUG ----- 
call plug#begin('~/vim/plugged')
" ----- MARKDOWN PLUG -----
call plug#end()
