if status is-interactive
	fish_vi_key_bindings

    alias :q='exit'
    alias sex='bash -c \'(open . || explorer.exe . || nautilus .) &\''
    alias vim=nvim
    alias tmux='tmux -2'
    alias txxx='tmux kill-server'
end
