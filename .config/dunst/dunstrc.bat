
[global]
    font = "Hack Nerd Font"
    allow_markup = yes
    format = "<b>%s</b>\n%b"
    sort = yes
    indicate_hidden = yes
    alignment = center
    bounce_freq = 0
    show_age_threshold = 60
    word_wrap = yes
    ignore_newline = no
    geometry = "200x5-6+30"
    transparency = 0
    idle_threshold = 120
    monitor = 0
    follow = mouse
    sticky_history = yes
    line_height = 0
    separator_height = 2
    padding = 8
    horizontal_padding = 8
    separator_color = "#585858"
    startup_notification = false
    # https://github.com/knopwob/dunst/issues/26#issuecomment-36159395
    #icon_position = left
    #icon_folders = /usr/share/icons/elementary/actions/16/

[frame]
    width = 1
    color = "#696969"

[shortcuts]
    close = ctrl+space
    close_all = ctrl+shift+space
    history = ctrl+grave
    context = ctrl+shift+period

[urgency_low]
    background = "#121212"
    foreground = "#888888"
    timeout = 5

[urgency_normal]
    background = "#121212"
    foreground = "#f1f1f1"
    timeout = 20

[urgency_critical]
    background = "#ff3366"
    foreground = "#f1f1f1"
    timeout = 5

# vim: ft=cfg
