#!/usr/bin/env sh
# tinted-shell (https://github.com/tinted-theming/tinted-shell)
# Scheme name: sw1comm
# Scheme author: mcauley-penney (https://github.com/mcauley-penney/techbase.nvim)
# Template author: Tinted Theming (https://github.com/tinted-theming)
# Local scheme: techbase.nvim sw1comm palette mapped to base24 slots (light theme).
export BASE24_THEME="sw1comm"

color00="d4/d4/d4" # Base 00 - Black
color01="b0/00/00" # Base 08 - Red
color02="45/76/3c" # Base 0B - Green
color03="c7/a3/1a" # Base 0A - Yellow
color04="00/48/c8" # Base 0D - Blue
color05="00/00/a0" # Base 0E - Magenta
color06="00/48/a0" # Base 0C - Cyan
color07="20/20/20" # Base 05 - White
color08="74/75/83" # Base 03 - Bright Black
color09="d0/00/00" # Base 12 - Bright Red
color10="00/a5/16" # Base 14 - Bright Green
color11="de/b5/1d" # Base 13 - Bright Yellow
color12="35/80/e1" # Base 16 - Bright Blue
color13="55/57/6e" # Base 17 - Bright Magenta
color14="35/80/e1" # Base 15 - Bright Cyan
color15="00/00/00" # Base 07 - Bright White
color16="f8/77/37" # Base 09
color17="90/00/00" # Base 0F
color18="cc/cc/cc" # Base 01
color19="a5/c6/f2" # Base 02
color20="5f/60/78" # Base 04
color21="10/10/10" # Base 06
color_foreground="20/20/20" # Base 05
color_background="d4/d4/d4" # Base 00

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
  put_template_custom Pg 202020 # foreground
  put_template_custom Ph d4d4d4 # background
  put_template_custom Pi 202020 # bold color
  put_template_custom Pj a5c6f2 # selection color
  put_template_custom Pk 202020 # selected text color
  put_template_custom Pl 202020 # cursor
  put_template_custom Pm d4d4d4 # cursor text
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
  export BASE24_COLOR_00_HEX="d4d4d4"
  export BASE24_COLOR_01_HEX="cccccc"
  export BASE24_COLOR_02_HEX="a5c6f2"
  export BASE24_COLOR_03_HEX="747583"
  export BASE24_COLOR_04_HEX="5f6078"
  export BASE24_COLOR_05_HEX="202020"
  export BASE24_COLOR_06_HEX="101010"
  export BASE24_COLOR_07_HEX="000000"
  export BASE24_COLOR_08_HEX="b00000"
  export BASE24_COLOR_09_HEX="f87737"
  export BASE24_COLOR_0A_HEX="c7a31a"
  export BASE24_COLOR_0B_HEX="45763c"
  export BASE24_COLOR_0C_HEX="0048a0"
  export BASE24_COLOR_0D_HEX="0048c8"
  export BASE24_COLOR_0E_HEX="0000a0"
  export BASE24_COLOR_0F_HEX="900000"
  export BASE24_COLOR_10_HEX="c6c6c6"
  export BASE24_COLOR_11_HEX="c2c2c2"
  export BASE24_COLOR_12_HEX="d00000"
  export BASE24_COLOR_13_HEX="deb51d"
  export BASE24_COLOR_14_HEX="00a516"
  export BASE24_COLOR_15_HEX="3580e1"
  export BASE24_COLOR_16_HEX="3580e1"
  export BASE24_COLOR_17_HEX="55576e"
fi
