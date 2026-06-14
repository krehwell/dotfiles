if status is-interactive
    fish_vi_key_bindings
    set fish_greeting

    alias :q='exit'
    alias :qa='tmux kill-server'
    alias sex='bash -c \'(open . || explorer.exe . || nautilus .) &\''
    alias vim=nvim
    # alias rm='rmtrash'

    # status --is-interactive; and rbenv init - fish | source

    set fish_cursor_insert block

    function killall_lsp
        set patterns biome Biome next vtsls eslint_d eslint prettierd node bun bunx tsserver next-server yarn turbo watchman deno opencode

        for pattern in $patterns
            echo "Killing processes matching: $pattern"
            pkill -9 ^$pattern
        end
    end
end

# Portable PATH: $HOME adapts to any machine/username (mac: /Users/<user>,
# vps: /home/<user>), and each dir is only added if it exists on this machine
# (so mac-only homebrew paths are simply skipped on the VPS).
set -l candidate_paths \
    $HOME/.local/bin \
    /opt/homebrew/bin \
    $HOME/go/bin \
    $HOME/.cargo/bin

set -l existing_paths
for dir in $candidate_paths
    test -d $dir; and set -a existing_paths $dir
end
test (count $existing_paths) -gt 0; and fish_add_path -g $existing_paths
