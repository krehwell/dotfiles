if status is-interactive
    fish_vi_key_bindings
    set fish_greeting

    alias :q='exit'
    alias :qa='tmux kill-session'
    alias sex='bash -c \'(open . || explorer.exe . || nautilus .) &\''
    alias vim=nvim
    alias tmux='tmux -2'
    alias rm='rmtrash'

    # status --is-interactive; and rbenv init - fish | source

    set fish_cursor_insert block

    function killall_lsp
        set patterns biome Biome next vtsls eslint_d eslint prettierd node bun bunx tsserver next-server yarn turbo watchman deno

        for pattern in $patterns
            echo "Killing processes matching: $pattern"
            pkill -9 ^$pattern
        end
    end
end

