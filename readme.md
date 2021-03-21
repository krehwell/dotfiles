# i3 Development Environment

Guide from myself, for myself, to myself in development using i3 and Arch Linux

## Main Tools

- [Bash](https://github.com/krehwell/dotfiles/#Bash): un-zsh guy `.bashrc | .profile | .screenrc`
- Vim(neovim): lit editor `init.vim`
- Coc: language server `coc-settings.json`
- Tmux: terminal multiplexer `.tmux.conf | Onestatus(vim plugin)`
- Alacritty: a sexy terminal
- Consolas NF: the one ungay powerline font

### Bash

important setup:

#### 1. command

some of needed command to have

- `ln -s <command>` : allowing shortcut to go to some dir or file
- `Ag & Rg` : fuzzy search (install using `aur`)
- `git <command>` : git of course

#### 2. `.bashrc`

- Own Alias

```
alias vim=nvim :                            # alias nvim to vim
alias ls='ls --color'                       # alias `ls` to have color
alias sex='nautilus .'                      # alias open file manager
alias :q='exit'                             # alias `:q` to exit terminal just like vim (this is faster)
```

#### 3. `.profile`

- nothing to see here I guess.

#### 4. `.screenrc`

- just like no.3

#### 5. `.tmux.conf`

- a better terminal multiplexer. the only plugin used is [tmux-resurrect](https://github.com/tmux-plugins/tmux-resurrect).

#### 6. `boilerplates/`

- this is where all my boilerplates are, remap key binding in vim to access it later to get started with it. see my `init.vim` configuration (at the end section).

#### 7. `.config/`

- this is where all the modification to each UI and UX for the system.
