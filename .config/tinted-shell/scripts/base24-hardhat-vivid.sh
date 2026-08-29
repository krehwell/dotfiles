#!/usr/bin/env sh
# tinted-shell (https://github.com/tinted-theming/tinted-shell)
# Scheme name: Hardhat Vivid
# Scheme author: g-kirti (https://github.com/g-kirti/hardhat.nvim)
# Template author: Tinted Theming (https://github.com/tinted-theming)
# Local scheme: hardhat.nvim vivid palette, ANSI colors from extras/kitty/hardhat-vivid.conf.
export BASE24_THEME="hardhat-vivid"

color00="0a/0c/0e" # Base 00 - Black
color01="ef/58/49" # Base 08 - Red
color02="cf/dc/28" # Base 0B - Green
color03="e8/c3/00" # Base 0A - Yellow
color04="39/c2/c8" # Base 0D - Blue
color05="e8/8b/2d" # Base 0E - Magenta
color06="58/b7/e4" # Base 0C - Cyan
color07="c6/cc/d1" # Base 05 - White
color08="7d/8a/92" # Base 03 - Bright Black
color09="f3/7b/6f" # Base 12 - Bright Red
color10="d4/df/63" # Base 14 - Bright Green
color11="e9/cc/5f" # Base 13 - Bright Yellow
color12="63/c9/cd" # Base 16 - Bright Blue
color13="ea/a6/67" # Base 17 - Bright Magenta
color14="79/c2/e6" # Base 15 - Bright Cyan
color15="dd/e1/e4" # Base 07 - Bright White
color16="e8/8b/2d" # Base 09
color17="ea/a6/67" # Base 0F
color18="1c/21/25" # Base 01
color19="2c/34/3c" # Base 02
color20="9a/9f/a3" # Base 04
color21="dd/e1/e4" # Base 06
color_foreground="d5/dd/e6" # Base 05
color_background="15/18/1b" # Base 00

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
  put_template_custom Pg d5dde6 # foreground
  put_template_custom Ph 15181b # background
  put_template_custom Pi d5dde6 # bold color
  put_template_custom Pj 2c343c # selection color
  put_template_custom Pk d5dde6 # selected text color
  put_template_custom Pl d5dde6 # cursor
  put_template_custom Pm 15181b # cursor text
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
  export BASE24_COLOR_00_HEX="15181b"
  export BASE24_COLOR_01_HEX="1c2125"
  export BASE24_COLOR_02_HEX="2c343c"
  export BASE24_COLOR_03_HEX="7d8a92"
  export BASE24_COLOR_04_HEX="9a9fa3"
  export BASE24_COLOR_05_HEX="c6ccd1"
  export BASE24_COLOR_06_HEX="dde1e4"
  export BASE24_COLOR_07_HEX="dde1e4"
  export BASE24_COLOR_08_HEX="ef5849"
  export BASE24_COLOR_09_HEX="e88b2d"
  export BASE24_COLOR_0A_HEX="e8c300"
  export BASE24_COLOR_0B_HEX="cfdc28"
  export BASE24_COLOR_0C_HEX="58b7e4"
  export BASE24_COLOR_0D_HEX="39c2c8"
  export BASE24_COLOR_0E_HEX="e88b2d"
  export BASE24_COLOR_0F_HEX="eaa667"
  export BASE24_COLOR_10_HEX="0c0f12"
  export BASE24_COLOR_11_HEX="0a0c0e"
  export BASE24_COLOR_12_HEX="f37b6f"
  export BASE24_COLOR_13_HEX="e9cc5f"
  export BASE24_COLOR_14_HEX="d4df63"
  export BASE24_COLOR_15_HEX="79c2e6"
  export BASE24_COLOR_16_HEX="63c9cd"
  export BASE24_COLOR_17_HEX="eaa667"
fi
