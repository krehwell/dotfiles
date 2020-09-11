if !exists(':OneStatus*')
  " ----- KEL MAKE OWN MAKE ------
  command! OneStatus call s:setCurDir() | call onestatus#build([s:defaultStyle(), s:right(), s:curwin(), s:winlist(), s:left()])
  " command! OneStatus call s:setCurDir() | call onestatus#build([s:defaultStyle(), s:right(), s:winlist(), s:left()])
endif

if exists('g:loaded_onestatus')
  finish
endif

let g:loaded_onestatus = 1
let g:onestatus_default_layout = 1
let g:cwd_formated = ""

function s:setCurDir()
  let cwd = getcwd()
  let g:cwd_formated = get(split(cwd, '/')[-1:], 0, 'root')
endfun

fun s:getFormated()
  return g:cwd_formated
endfun

fun s:getFileType()
  return &filetype != '' ? printf('[%s]', &filetype) : ''
endfun

fun s:getHead()
  let s:head = FugitiveHead()
  if (s:head == "")
    return ""
  endif
  return printf("  %s ", s:head)
endfun

fun s:getColor(colSchem, command, isStyleOnly) abort
  let s:fg = synIDattr(synIDtrans(hlID(a:colSchem)), 'fg#')
  let s:bg = synIDattr(synIDtrans(hlID(a:colSchem)), 'bg#')
  let s:attrs = {'isStyleOnly': a:isStyleOnly, 'fg': s:fg, 'bg': s:bg}
  return { 'command': a:command, 'attributes': [s:attrs]}
endfun

" set-option -g status-right
let s:right = { -> {'command': 'set-option -g status-right', 'attributes': [{"fg": "colour234", "bg": "default", "label": ""},{"fg": "#fcfcfc", "bg": "colour234", "label": "~/" . s:getFormated()}, {"fg": "colour235","bg": "colour234", "label": ""}, {"fg": "#fcfcfc", "bg": "colour235", "label": s:getFileType()}, {"fg": "colour236","bg": "colour235", "label": ""}, {"fg": "#fcfcfc", "bg": "colour236", "label": s:getHead()}]}} 

" ----- KEL MAKE OWN MAKE ------
" set-window-option -g window-status-current-style 
let s:curwin = { -> {'command': 'set-window-option -g window-status-current-style ', 'attributes': [{"fg": 'colour247', "bg": 'default', "isStyleOnly": v:true}]}}

" set-window-option -g window-status-style
let s:winlist = { -> {'command': 'set-window-option -g window-status-style', 'attributes': [{"fg": 'colour247', "bg": 'default', "isStyleOnly": v:true}]}}

" set-option -g status-left
let s:left = { -> {'command': 'set-option -g status-left', 'attributes': [{"fg": "#6c757d", "bg": "default", "label": "#H/#S"}]}}

" set-option status-style
let s:defaultStyle = { -> s:getColor('CursorLineNr', 'set-option status-style', v:true)}

" set default config
if g:onestatus_default_layout
  aug onestatus_aug
    au! BufEnter * :OneStatus
  aug END

  call onestatus#build([
        \{'command' : 'set-option -g status-justify centre'},
        \{'command': 'set-option status-right-length 50'},
        \{'command': 'set-option status-left-length 60'},
        \])
endif
