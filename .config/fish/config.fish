if status is-interactive
    fish_vi_key_bindings
    set fish_greeting

    alias :q='exit'
    alias sex='bash -c \'(open . || explorer.exe . || nautilus .) &\''
    alias vim=nvim
    alias rm='rmtrash'

    set fish_cursor_insert block
    set -gx CLAUDE_CODE_TMUX_TRUECOLOR 1
end

fish_add_path -g $HOME/.local/bin /opt/homebrew/bin $HOME/go/bin $HOME/.cargo/bin $HOME/utils
