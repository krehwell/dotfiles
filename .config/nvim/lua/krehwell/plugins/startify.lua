return {
	"mhinz/vim-startify",
	config = function()
		vim.cmd([[
      " returns all modified files of the current git repo
      " `2>/dev/null` makes the command fail quietly, so that when we are not
      " in a git repo, the list will be empty
      function! s:gitModified()
        let files = systemlist('git ls-files -m 2>/dev/null')
        return map(files, "{'line': v:val, 'path': v:val}")
      endfunction

      " same as above, but show untracked files, honouring .gitignore
      function! s:gitUntracked()
        let files = systemlist('git ls-files -o --exclude-standard 2>/dev/null')
        return map(files, "{'line': v:val, 'path': v:val}")
      endfunction

      let g:startify_lists = [
        \ { 'type': 'dir',       'header': ['   MRU '. getcwd()] },
        \ { 'type': 'files',     'header': ['   MRU']            },
        \ { 'type': 'sessions',  'header': ['   Sessions']       },
        \ { 'type': 'bookmarks', 'header': ['   Bookmarks']      },
        \ { 'type': function('s:gitModified'),  'header': ['   git modified']},
        \ { 'type': function('s:gitUntracked'), 'header': ['   git untracked']},
        \ { 'type': 'commands',  'header': ['   Commands']       },
      \ ]

      let g:startify_change_to_dir = 0

      ]])

		vim.g.startify_session_dir = "$HOME/.vim/session"
	end,
}
