#!/usr/bin/env sh
# tinted-shell (https://github.com/tinted-theming/tinted-shell)
# Scheme name: South
# Scheme author: arnauKL (https://github.com/arnauKL/south.nvim)
# Template author: Tinted Theming (https://github.com/tinted-theming)
# Local scheme: south.nvim palette mapped to base24 slots (light theme).
export BASE24_THEME="south"

color00="fc/fc/fd" # Base 00 - Black (background)
color01="c1/29/3d" # Base 08 - Red (auburn)
color02="2b/97/28" # Base 0B - Green (grass, strings)
color03="d9/96/10" # Base 0A - Yellow (gold)
color04="08/50/b5" # Base 0D - Blue (cobalt, functions)
color05="61/5f/b9" # Base 0E - Magenta (purple)
color06="00/92/bf" # Base 0C - Cyan (aqua, keywords)
color07="32/3b/45" # Base 05 - White (black, foreground)
color08="b5/ba/c4" # Base 03 - Bright Black (cool medium grey)
color09="c1/29/3d" # Base 12 - Bright Red
color10="00/81/65" # Base 14 - Bright Green (lake)
color11="d9/96/10" # Base 13 - Bright Yellow
color12="25/7f/c4" # Base 16 - Bright Blue (sky)
color13="61/5f/b9" # Base 17 - Bright Magenta
color14="49/97/94" # Base 15 - Bright Cyan (persian)
color15="37/4a/67" # Base 07 - Bright White (slate grey)
color16="f2/91/30" # Base 09 (orange)
color17="78/75/71" # Base 0F (warm grey)
color18="ed/f2/fd" # Base 01 (darker background)
color19="ce/ea/ff" # Base 02 (selection)
color20="90/97/a6" # Base 04 (cool dark grey, comments)
color21="37/4a/67" # Base 06 (slate grey)
color_foreground="32/3b/45" # Base 05
color_background="fc/fc/fd" # Base 00


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
  put_template_custom Pg 323b45 # foreground
  put_template_custom Ph fcfcfd # background
  put_template_custom Pi 323b45 # bold color
  put_template_custom Pj ceeaff # selection color
  put_template_custom Pk 323b45 # selected text color
  put_template_custom Pl 323b45 # cursor
  put_template_custom Pm fcfcfd # cursor text
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
  export BASE24_COLOR_00_HEX="fcfcfd"
  export BASE24_COLOR_01_HEX="edf2fd"
  export BASE24_COLOR_02_HEX="ceeaff"
  export BASE24_COLOR_03_HEX="b5bac4"
  export BASE24_COLOR_04_HEX="9097a6"
  export BASE24_COLOR_05_HEX="323b45"
  export BASE24_COLOR_06_HEX="374a67"
  export BASE24_COLOR_07_HEX="374a67"
  export BASE24_COLOR_08_HEX="c1293d"
  export BASE24_COLOR_09_HEX="f29130"
  export BASE24_COLOR_0A_HEX="d99610"
  export BASE24_COLOR_0B_HEX="2b9728"
  export BASE24_COLOR_0C_HEX="0092bf"
  export BASE24_COLOR_0D_HEX="0850b5"
  export BASE24_COLOR_0E_HEX="615fb9"
  export BASE24_COLOR_0F_HEX="787571"
  export BASE24_COLOR_10_HEX="e4eaf3"
  export BASE24_COLOR_11_HEX="edf2fd"
  export BASE24_COLOR_12_HEX="c1293d"
  export BASE24_COLOR_13_HEX="d99610"
  export BASE24_COLOR_14_HEX="008165"
  export BASE24_COLOR_15_HEX="499794"
  export BASE24_COLOR_16_HEX="257fc4"
  export BASE24_COLOR_17_HEX="615fb9"
fi
