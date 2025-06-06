if status is-interactive
	fish_vi_key_bindings
    set fish_greeting

    alias :q='exit'
    alias :qa='tmux kill-session'
    alias sex='bash -c \'(open . || explorer.exe . || nautilus .) &\''
    alias vim=nvim
    alias tmux='tmux -2'
    alias rm='rmtrash'

    set -x GEMINI_API_KEY "AIzaSyDD7SbjH2KTvR_EEaC9mWBE9y3A3u1mdG4"
    status --is-interactive; and rbenv init - fish | source

    set fish_cursor_insert block

    # function postexec_test --on-event fish_postexec
    #     echo
    # end

    function "killall_lsp"
        set processes biome next vtsls eslint_d prettierd node bun bunx tsserver
        for process in $processes
            killall -9 $process ^/dev/null
        end
    end
end

