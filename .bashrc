#
# ~/.bashrc
#

# If not running interactively, don't do anything
[[ $- != *i* ]] && return

alias ls='ls --color=auto'
alias grep='grep --color=auto'
PS1='[\u@\h \W]\$ '

# Base16 Shell: base16_* theme switchers; sets terminal ANSI colors so
# alacritty + tmux + nvim follow. Switch with e.g. base16_ocean.
BASE16_SHELL="$HOME/.config/base16-shell"
BASE16_DEFAULT_THEME="default-dark"
[ -n "$PS1" ] && [ -s "$BASE16_SHELL/profile_helper.sh" ] && source "$BASE16_SHELL/profile_helper.sh"
