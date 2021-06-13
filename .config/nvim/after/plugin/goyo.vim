function! s:goyo_enter()
    set nu
    set relativenumber
endfunction

function! s:goyo_leave()
    exec 'source ~/.config/nvim/init.vim'
endfunction

autocmd! User GoyoEnter nested call <SID>goyo_enter()
autocmd! User GoyoLeave nested call <SID>goyo_leave()
