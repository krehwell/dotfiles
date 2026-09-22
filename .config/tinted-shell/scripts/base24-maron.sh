#!/usr/bin/env sh
# tinted-shell (https://github.com/tinted-theming/tinted-shell)
# Scheme name: Maron (nightfall.nvim)
# Scheme author: 2giosangmitom (https://github.com/2giosangmitom/nightfall.nvim)
# Template author: Tinted Theming (https://github.com/tinted-theming)
export BASE24_THEME="maron"

color00="12/15/18" # Base 00 - Black
color01="ff/69/69" # Base 08 - Red
color02="8e/b4/86" # Base 0B - Green
color03="ff/d9/5a" # Base 0A - Yellow
color04="9e/d0/e6" # Base 0D - Blue
color05="d1/8c/e0" # Base 0E - Magenta
color06="8b/e9/fd" # Base 0C - Cyan
color07="f5/f5/dc" # Base 05 - White
color08="58/62/69" # Base 03 - Bright Black
color09="e7/6b/74" # Base 12 - Bright Red
color10="9b/c9/95" # Base 14 - Bright Green
color11="fc/c7/37" # Base 13 - Bright Yellow
color12="82/a7/a6" # Base 16 - Bright Blue
color13="e2/ad/f2" # Base 17 - Bright Magenta
color14="a6/cd/c6" # Base 15 - Bright Cyan
color15="ff/ff/ff" # Base 07 - Bright White
color16="f0/bb/78" # Base 09
color17="b7/96/ac" # Base 0F
color18="19/1d/21" # Base 01
color19="2d/32/38" # Base 02
color20="6b/81/8c" # Base 04
color21="fb/fb/e9" # Base 06
color_foreground="f5/f5/dc" # Base 05
color_background="12/15/18" # Base 00


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
  put_template_custom Pg f5f5dc # foreground
  put_template_custom Ph 121518 # background
  put_template_custom Pi f5f5dc # bold color
  put_template_custom Pj 2d3238 # selection color
  put_template_custom Pk f5f5dc # selected text color
  put_template_custom Pl f5f5dc # cursor
  put_template_custom Pm 121518 # cursor text
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
  export BASE24_COLOR_00_HEX="121518"
  export BASE24_COLOR_01_HEX="191d21"
  export BASE24_COLOR_02_HEX="2d3238"
  export BASE24_COLOR_03_HEX="586269"
  export BASE24_COLOR_04_HEX="6b818c"
  export BASE24_COLOR_05_HEX="f5f5dc"
  export BASE24_COLOR_06_HEX="fbfbe9"
  export BASE24_COLOR_07_HEX="ffffff"
  export BASE24_COLOR_08_HEX="ff6969"
  export BASE24_COLOR_09_HEX="f0bb78"
  export BASE24_COLOR_0A_HEX="ffd95a"
  export BASE24_COLOR_0B_HEX="8eb486"
  export BASE24_COLOR_0C_HEX="8be9fd"
  export BASE24_COLOR_0D_HEX="9ed0e6"
  export BASE24_COLOR_0E_HEX="d18ce0"
  export BASE24_COLOR_0F_HEX="b796ac"
  export BASE24_COLOR_10_HEX="0c0e11"
  export BASE24_COLOR_11_HEX="07090b"
  export BASE24_COLOR_12_HEX="e76b74"
  export BASE24_COLOR_13_HEX="fcc737"
  export BASE24_COLOR_14_HEX="9bc995"
  export BASE24_COLOR_15_HEX="a6cdc6"
  export BASE24_COLOR_16_HEX="82a7a6"
  export BASE24_COLOR_17_HEX="e2adf2"
fi
