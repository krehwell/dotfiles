function fish_greeting
    if not which fortune > /dev/null
        switch (uname)
            case Darwin
                echo Installing fortune and cowsay
                brew install fortune
                sudo gem install lolcat
            case Linux
                echo Installing fortune and cowsay
                if which pacman > /dev/null
                    sudo pacman -S fortune cowsay
                else
                    sudo yum install fortune cowsay
                end
            case '*'
                echo Wait ... where are we\? (uname), eh
        end
    end

    set -l toon (random choice {default,bud-frogs,dragon,dragon-and-cow,elephant,moose,stegosaurus,tux,vader,bunny})
    if which fortune > /dev/null
        fortune -s | cowsay -f $toon
    else
        echo Something fishy going on around here ...
    end
end
