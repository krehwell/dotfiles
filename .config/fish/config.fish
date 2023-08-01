if status is-interactive
	fish_vi_key_bindings
    set fish_greeting

    alias :q='exit'
    alias :qa='tmux kill-session'
    alias sex='bash -c \'(open . || explorer.exe . || nautilus .) &\''
    alias vim=nvim
    alias tmux='tmux -2'

    function postexec_test --on-event fish_postexec
        echo
    end
end

