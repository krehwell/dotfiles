#!/usr/bin/env fish

# ----------------------------------------------------------------------
# Setup variables and env
# ----------------------------------------------------------------------

# Allow users to optionally configure where their tinted-shell config is
# stored by specifying BASE16_CONFIG_PATH before loading this script
if test -z "$BASE16_CONFIG_PATH"
  if test -n "$XDG_CONFIG_HOME"
    set -g BASE16_CONFIG_PATH "$XDG_CONFIG_HOME/tinted-theming"
  else
    set -g BASE16_CONFIG_PATH "$HOME/.config/tinted-theming"
  end
end
set -g BASE16_SHELL_COLORSCHEME_PATH \
  "$BASE16_CONFIG_PATH/base16_shell_theme"
# Store the theme name in a file so we aren't reliant on environment
# variables to store this value alone since it can be inaccurate when
# using session managers such as TMUX
set -g BASE16_SHELL_THEME_NAME_PATH "$BASE16_CONFIG_PATH/theme_name" 

# Allow users to optionally configure their tinted-shell path and set
# the value if one doesn't exist
if test -z "$BASE16_SHELL_PATH"
  set -g BASE16_SHELL_PATH (realpath (dirname (status -f)))
end

# If the user hasn't specified a hooks dir path or it is invalid, use
# the existing path
if test -z "$BASE16_SHELL_HOOKS_PATH"; or not test -d "$BASE16_SHELL_HOOKS_PATH"
  set -g BASE16_SHELL_HOOKS_PATH "$BASE16_SHELL_PATH/hooks"
end

# Create the config path if the path doesn't currently exist
if not test -d "$BASE16_CONFIG_PATH"
  mkdir -p "$BASE16_CONFIG_PATH"
end

# Create a file containing the current theme name
if not test -e "$BASE16_SHELL_THEME_NAME_PATH"
  touch "$BASE16_SHELL_THEME_NAME_PATH";
end

# ----------------------------------------------------------------------
# Functions
# ----------------------------------------------------------------------

function set_theme
  set theme_name $argv[1]

  if not test -e "$BASE16_CONFIG_PATH"
    echo "\$BASE16_CONFIG_PATH doesn't exist. Try sourcing this script \
      and then try again"
    return 2
  end

  if test -z "$theme_name"
    echo "Provide a theme name to set_theme or ensure \
      \$BASE16_THEME_DEFAULT is set"
    return 1
  end

  if test -f "$BASE16_SHELL_THEME_NAME_PATH"
    echo "$theme_name" > "$BASE16_SHELL_THEME_NAME_PATH";
  end

  # Symlink and source
  # LOCAL PATCH: upstream blindly prepends "base16-", breaking base24-* and
  # tinted8-* themes. Keep the name as-is when it already has a prefix.
  set -l script_name "base16-$theme_name"
  if string match -qr '^(base16|base24|tinted8)-' -- "$theme_name"
    set script_name "$theme_name"
  end
  command ln -fs \
    "$BASE16_SHELL_PATH/scripts/$script_name.sh" \
    "$BASE16_SHELL_COLORSCHEME_PATH"
  if not test -e "$BASE16_SHELL_COLORSCHEME_PATH"
    echo "Attempted symbolic link failed. Ensure \$BASE16_SHELL_PATH \
    and \$BASE16_SHELL_COLORSCHEME_PATH are valid paths."
    return 2
  end

  # Source newly symlinked file
  if test -f "$BASE16_SHELL_COLORSCHEME_PATH"
    # LOCAL PATCH: over ssh from inside tmux, TERM=tmux-* but $TMUX is unset,
    # so the theme script wraps its escapes in tmux passthrough and recolors
    # the whole outer terminal. Force a non-tmux TERM so it emits plain OSC,
    # which tmux applies to this pane only.
    if string match -q 'tmux*' -- "$TERM"; and test -z "$TMUX"
      env TERM=xterm-256color sh $BASE16_SHELL_COLORSCHEME_PATH
    else
      sh $BASE16_SHELL_COLORSCHEME_PATH
    end

    # Env variables aren't globally set when bash shell is sourced
    set -gx BASE16_THEME "$theme_name"
  end

  if test -d "$BASE16_SHELL_HOOKS_PATH"; \
    and test (count $BASE16_SHELL_HOOKS_PATH) -eq 1;
    for hook in $BASE16_SHELL_HOOKS_PATH/*.fish
      test -x "$hook"; and source "$hook"
    end
  end
end

# ----------------------------------------------------------------------
# Execution
# ----------------------------------------------------------------------

# Reload the $BASE16_SHELL_COLORSCHEME_PATH when the shell is reset
alias reset "command reset \
  && [ -f $BASE16_SHELL_COLORSCHEME_PATH ] \
  && sh $BASE16_SHELL_COLORSCHEME_PATH"

# Set base16-* aliases
# LOCAL PATCH: upstream forks `basename` once per script (~700 forks,
# ~0.7s of shell startup). Batch the name mangling through the `string`
# builtin instead, and define functions directly (`alias` re-parses its
# argument every call).
for function_name in (string replace -r '^.*/(.*)\.sh$' '$1' -- $BASE16_SHELL_PATH/scripts/*.sh)
  set theme_name (string replace -a 'base16-' '' -- $function_name)
  function $function_name --inherit-variable theme_name
    set_theme "$theme_name"
  end
end

# unset loop variables to not leak to user's shell
set -e script_path function_name theme_name

# If $BASE16_THEME is set, this has already been loaded. This guards
# against a bug where this script is sourced two or more times.
if test -n "$BASE16_THEME"
  exit 0
end

# Load the active theme
# If the theme name can be easily retrieved
read current_theme_name < "$BASE16_SHELL_THEME_NAME_PATH"
if test -n "$current_theme_name"
  set_theme "$current_theme_name"
# Else extract from the colorscheme file
else if test -e "$BASE16_SHELL_COLORSCHEME_PATH"
  # Get the active theme name from the export variable in the script
  set current_theme_name \
    (grep 'export BASE16_THEME' "$BASE16_SHELL_COLORSCHEME_PATH")
  set current_theme_name \
    (string replace -r 'export BASE16_THEME=' '' $current_theme_name)
  set_theme "$current_theme_name"
# If a colorscheme file doesn't exist and BASE16_THEME_DEFAULT is set,
# then create the colorscheme file based on the BASE16_THEME_DEFAULT
# scheme name
else if test -n "$BASE16_THEME_DEFAULT"
  set_theme "$BASE16_THEME_DEFAULT"
end
