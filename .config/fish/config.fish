if status is-interactive
    fish_vi_key_bindings
    set fish_greeting

    # Tinted Shell (base16-shell successor): defines base16-*/base24-* theme
    # switchers, reapplies persisted theme, and sets terminal ANSI colors
    # (so alacritty + tmux + nvim follow). base24 schemes have real bright
    # colors (9-14), unlike base16 where they duplicate the normal ones.
    # Skipped silently if not cloned (e.g. fresh machine).
    if test -f "$HOME/.config/tinted-shell/profile_helper.fish"
        # Keep runtime state (theme symlink + theme_name) inside tinted-shell
        # itself instead of the upstream default ~/.config/tinted-theming.
        set -g BASE16_CONFIG_PATH "$HOME/.config/tinted-shell"
        # Fallback when no theme has ever been set (fresh machine / wiped
        # state). base24-neovim = stock nvim palette, local script in
        # tinted-shell/scripts.
        set -g BASE16_THEME_DEFAULT "base24-opencode-material"
        source "$HOME/.config/tinted-shell/profile_helper.fish"
    end

    alias :q='exit'
    alias :qa='tmux kill-server'
    alias sex='bash -c \'(open . || explorer.exe . || nautilus .) &\''
    alias vim=nvim
    alias rm='rmtrash'

    set fish_cursor_insert block
end

# Portable PATH: $HOME adapts to any machine/username (mac: /Users/<user>,
# vps: /home/<user>), and each dir is only added if it exists on this machine
# (so mac-only homebrew paths are simply skipped on the VPS).
set -l candidate_paths \
    $HOME/.local/bin \
    /opt/homebrew/bin \
    $HOME/go/bin \
    $HOME/.cargo/bin \
    $HOME/utils

set -l existing_paths
for dir in $candidate_paths
    test -d $dir; and set -a existing_paths $dir
end
test (count $existing_paths) -gt 0; and fish_add_path -g $existing_paths
