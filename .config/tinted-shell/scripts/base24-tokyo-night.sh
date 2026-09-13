#!/usr/bin/env sh
# tinted-shell (https://github.com/tinted-theming/tinted-shell)
# Scheme name: Dracula
# Scheme author: clach04 (https://github.com/clach04)
# Template author: Tinted Theming (https://github.com/tinted-theming)
export BASE24_THEME="tokyo-night"

color00="1a/1b/26" # Base 00 - Black
color01="f7/76/8e" # Base 08 - Red
color02="9e/ce/6a" # Base 0B - Green
color03="e0/af/68" # Base 0A - Yellow
color04="7a/a2/f7" # Base 0D - Blue
color05="bb/9a/f7" # Base 0E - Magenta
color06="7d/cf/ff" # Base 0C - Cyan
color07="c0/ca/f5" # Base 05 - White
color08="56/5f/89" # Base 03 - Bright Black
color09="f7/76/8e" # Base 12 - Bright Red
color10="9e/ce/6a" # Base 14 - Bright Green
color11="e0/af/68" # Base 13 - Bright Yellow
color12="7a/a2/f7" # Base 16 - Bright Blue
color13="bb/9a/f7" # Base 17 - Bright Magenta
color14="7d/cf/ff" # Base 15 - Bright Cyan
color15="c0/ca/f5" # Base 07 - Bright White
color16="ff/9e/64" # Base 09
color17="ff/9e/64" # Base 0F
color18="24/28/3b" # Base 01
color19="2d/36/50" # Base 02
color20="a9/b1/d6" # Base 04
color21="c0/ca/f5" # Base 06
color_foreground="c0/ca/f5" # Base 05
color_background="1a/1b/26" # Base 00


if [ -z "$TTY" ] && ! TTY=$(tty) || [ ! -w "$TTY" ]; then
  put_template() { true; }
  put_template_var() { true; }
  put_template_custom() { true; }
elif [ -n "$TMUX" ] || [ "${TERM%%[-.]*}" = "tmux" ]; then
  # Tell tmux to pass the escape sequences through
  # (Source: http://permalink.gmane.org/gmane.comp.terminal-emulators.tmux.user/1324)
  put_template() { printf '\033Ptmux;\033\033]4;%d;rgb:%s\033\033\\\033\\' "$@" > "$TTY"; }
  put_template_var() { printf '\033Ptmux;\033\033]%d;rgb:%s\033\033\\\033\\' "$@" > "$TTY"; }
  put_template_custom() { printf '\033Ptmux;\033\033]%s%s\033\033\\\033\\' "$@" > "$TTY"; }
elif [ "${TERM%%[-.]*}" = "screen" ]; then
  # GNU screen (screen, screen-256color, screen-256color-bce)
  put_template() { printf '\033P\033]4;%d;rgb:%s\007\033\\' "$@" > "$TTY"; }
  put_template_var() { printf '\033P\033]%d;rgb:%s\007\033\\' "$@" > "$TTY"; }
  put_template_custom() { printf '\033P\033]%s%s\007\033\\' "$@" > "$TTY"; }
elif [ "${TERM%%-*}" = "linux" ]; then
  put_template() { [ "$1" -lt 16 ] && printf "\e]P%x%s" "$1" "$(echo "$2" | sed 's/\///g')" > "$TTY"; }
  put_template_var() { true; }
  put_template_custom() { true; }
else
  put_template() { printf '\033]4;%d;rgb:%s\033\\' "$@" > "$TTY"; }
  put_template_var() { printf '\033]%d;rgb:%s\033\\' "$@" > "$TTY"; }
  put_template_custom() { printf '\033]%s%s\033\\' "$@" > "$TTY"; }
fi

# 16 color space
put_template 0  "$color00"
put_template 1  "$color01"
put_template 2  "$color02"
put_template 3  "$color03"
put_template 4  "$color04"
put_template 5  "$color05"
put_template 6  "$color06"
put_template 7  "$color07"
put_template 8  "$color08"
put_template 9  "$color09"
put_template 10 "$color10"
put_template 11 "$color11"
put_template 12 "$color12"
put_template 13 "$color13"
put_template 14 "$color14"
put_template 15 "$color15"

# 256 color space
put_template 16 "$color16"
put_template 17 "$color17"
put_template 18 "$color18"
put_template 19 "$color19"
put_template 20 "$color20"
put_template 21 "$color21"

# foreground / background / cursor color
if [ -n "$ITERM_SESSION_ID" ]; then
  # iTerm2 proprietary escape codes
  put_template_custom Pg c0caf5 # foreground
  put_template_custom Ph 1a1b26 # background
  put_template_custom Pi c0caf5 # bold color
  put_template_custom Pj 2d3650 # selection color
  put_template_custom Pk c0caf5 # selected text color
  put_template_custom Pl f8f8f2 # cursor
  put_template_custom Pm 282a36 # cursor text
else
  put_template_var 10 "$color_foreground"
  if [ "$BASE24_SHELL_SET_BACKGROUND" != false ]; then
    put_template_var 11 "$color_background"
    if [ "${TERM%%-*}" = "rxvt" ]; then
      put_template_var 708 "$color_background" # internal border (rxvt)
    fi
  fi
  put_template_custom 12 ";7" # cursor (reverse video)
fi

# clean up
unset put_template
unset put_template_var
unset put_template_custom
unset color00
unset color01
unset color02
unset color03
unset color04
unset color05
unset color06
unset color07
unset color08
unset color09
unset color10
unset color11
unset color12
unset color13
unset color14
unset color15
unset color16
unset color17
unset color18
unset color19
unset color20
unset color21
unset color_foreground
unset color_background

# Optionally export variables
if [ -n "$TINTED_SHELL_ENABLE_BASE24_VARS" ]; then
  export BASE24_COLOR_00_HEX="282a36"
  export BASE24_COLOR_01_HEX="21222c"
  export BASE24_COLOR_02_HEX="44475a"
  export BASE24_COLOR_03_HEX="6272a4"
  export BASE24_COLOR_04_HEX="9ea8c7"
  export BASE24_COLOR_05_HEX="f8f8f2"
  export BASE24_COLOR_06_HEX="f8f8f2"
  export BASE24_COLOR_07_HEX="ffffff"
  export BASE24_COLOR_08_HEX="ff5555"
  export BASE24_COLOR_09_HEX="ffb86c"
  export BASE24_COLOR_0A_HEX="f1fa8c"
  export BASE24_COLOR_0B_HEX="50fa7b"
  export BASE24_COLOR_0C_HEX="8be9fd"
  export BASE24_COLOR_0D_HEX="bd93f9"
  export BASE24_COLOR_0E_HEX="ff79c6"
  export BASE24_COLOR_0F_HEX="993333"
  export BASE24_COLOR_10_HEX="1e2029"
  export BASE24_COLOR_11_HEX="16171d"
  export BASE24_COLOR_12_HEX="ff6e6e"
  export BASE24_COLOR_13_HEX="ffffa5"
  export BASE24_COLOR_14_HEX="69ff94"
  export BASE24_COLOR_15_HEX="a4ffff"
  export BASE24_COLOR_16_HEX="d6acff"
  export BASE24_COLOR_17_HEX="ff92df"
fi
