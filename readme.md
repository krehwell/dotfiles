# WSL Development Environment

Guide from myself, for myself, to myself in development using Windows subsystem for Linux

## Main Tools

- [Bash](https://github.com/krehwell/dotfiles/#Bash): un-zsh guy `.bashrc | .profile | .screenrc`
- Vim(neovim): lit editor `init.vim | .config/*`
- Coc: language server `coc-settings.json`
- Tmux: terminal multiplexer `.tmux.conf | Onestatus(vim plugin)`
- Wsltty: the slut of wsl [wsltty download](https://github.com/mintty/wsltty)
- AutoHotKey: windows scripting [ahk donwload](https://www.autohotkey.com/)
- Consolas NF: the one ungay powerline font

### Bash

important setup:

1. command
   some of needed command to have

- `ln -s <command>` : allowing shortcut to go to some dir or file
- `Ag & Rg` : fuzzy search (install using `apt-get install`)
- `git <command>` : git of course

2. .bashrc

- Own Alias

```
alias vim=nvim :                            # alias nvim to vim
alias ls='ls --color'                       # alias `ls` to have color
alias sex='/mnt/c/Windows/explorer.exe .'   # alias open explorer windows in current pwd
alias code='/mnt/c/Users/kel/AppData/Local/Programs/Microsoft\ VS\ Code/bin/code'     # alias open vscode in current pws
alias :q='exit'                             # alias `:q` to exit terminal just like vim (this is faster)
```

- allowing `explorer.exe` && `Vscode to integrate`

```
export PATH="$(echo "$PATH" | python -c "import sys; path = sys.stdin.read().split(':'); path = [pp for pp in path if '/mnt/c' not in pp]; print(':'.join(path))")"`
export LD_LIBRARY_PATH="$(echo "$LD_LIBRARY_PATH" | python -c "import sys; path = sys.stdin.read().split(':'); path = [pp for pp in path if '/mnt/c' not in pp]; print(':'.join(path))")"
```

3. .profile
   nothing to see here I guess

4. .screenrc
   just like no.3
