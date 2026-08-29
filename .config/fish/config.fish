if status is-interactive
    fish_vi_key_bindings
    set fish_greeting

    if test -f "$HOME/.config/tinted-shell/profile_helper.fish"
        set -g BASE16_CONFIG_PATH "$HOME/.config/tinted-shell"
        set -g BASE16_THEME_DEFAULT "base24-opencode-material"
        source "$HOME/.config/tinted-shell/profile_helper.fish"
    end

    alias :q='exit'
    alias :qa='tmux kill-server'
    alias sex='bash -c \'(open . || explorer.exe . || nautilus .) &\''
    alias vim=nvim
    alias rm='rmtrash'

    set fish_cursor_insert block
    set -gx CLAUDE_CODE_TMUX_TRUECOLOR 1
end

fish_add_path -g $HOME/.local/bin /opt/homebrew/bin $HOME/go/bin $HOME/.cargo/bin $HOME/utils
