function tinted-chrome --description 'Generate a Chrome theme extension from the active tinted-shell theme'
    set -l theme ~/.config/tinted-theming/base16_shell_theme
    if not test -e $theme
        echo "no active tinted theme"
        return 1
    end

    set -l dir ~/.config/tinted-chrome
    mkdir -p $dir

    # Emit one "r, g, b" line per role. Same slot -> role mapping as
    # tinted-firefox: 0=bg 18=bg-alt(base01) 19=selection(base02)
    # 20=muted(base04) 7=fg(base05). BSD awk has no strtonum, hence h().
    set -l rgb (awk -F'"' '
        function h(c) { return index("0123456789abcdef", tolower(c)) - 1 }
        function d(s) { return h(substr(s,1,1))*16 + h(substr(s,2,1)) }
        function rgbline(s) { return d(substr(s,1,2)) ", " d(substr(s,3,2)) ", " d(substr(s,5,2)) }
        /^color[0-9]+="[0-9a-fA-F]{2}\// { n=substr($1,6,2)+0; gsub("/","",$2); c[n]=$2 }
        /^color[0-9]+="\$color[0-9]+"/   { n=substr($1,6,2)+0; ref[n]=substr($2,7)+0 }
        END { for (n in ref) c[n]=c[ref[n]]
              split("0 18 19 20 7", want, " ")
              for (i=1; i<=5; i++) print rgbline(c[want[i]]) }' $theme)
    set -l bg $rgb[1]
    set -l bgalt $rgb[2]
    set -l sel $rgb[3]
    set -l muted $rgb[4]
    set -l fg $rgb[5]

    printf '%s\n' "\
{
    \"manifest_version\": 3,
    \"name\": \"tinted ($(basename (readlink $theme) .sh))\",
    \"version\": \"1.0\",
    \"theme\": {
        \"colors\": {
            \"frame\": [$bg],
            \"toolbar\": [$bgalt],
            \"tab_text\": [$fg],
            \"tab_background_text\": [$muted],
            \"bookmark_text\": [$muted],
            \"omnibox_background\": [$sel],
            \"omnibox_text\": [$fg],
            \"ntp_background\": [$bg],
            \"ntp_text\": [$fg]
        }
    }
}" >$dir/manifest.json

    echo "manifest ditulis ke $dir untuk $(basename (readlink $theme))"
    echo "pertama kali: chrome://extensions -> Developer mode -> Load unpacked -> $dir"
    echo "selanjutnya: tinggal klik reload di chrome://extensions"
end
